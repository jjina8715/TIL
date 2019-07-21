package my.spring.festival;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.AdminDAO;
import dao.NoticeDAO;
import vo.NoticeVO;
import vo.ReportVO;
import vo.SearchNoticeInfoVO;

@Controller
@SessionAttributes(value = "adminnotice")
public class AdminController {
	@Autowired
	private AdminDAO admindao;
	@Autowired 
	private NoticeDAO noticedao; 
	@ModelAttribute("adminnotice")
	public SearchNoticeInfoVO createFestainfo() {
		return new SearchNoticeInfoVO();
	}
	@RequestMapping(value="/adminpage")
	public String MainAdminPage() {
		
		return "adminpage";
	}
	@RequestMapping(value="/adminpage/report")
	public ModelAndView manageReport() {
		ModelAndView mav = new ModelAndView();
		List<ReportVO> list;
		list = admindao.selectReportlist();
		if(list.size()==0) {
			mav.addObject("listmsg", "신고된 리뷰가 존재하지 않습니다.");
		} else {
			mav.addObject("reportlist", list);
		}
		mav.setViewName("adminpage");
		return mav;
	}
	@RequestMapping(value="/adminpage/report/del")
	public String deleteReport(HttpServletRequest request, String[] check, String action) {
		String[] ids;
		if(action.equals("선택된 신고 삭제")) {
			for(int i = 0; i<check.length;i++) {
				ids = check[i].split(" ");
				admindao.deleteReport(Integer.parseInt(ids[0]));
			}
		}else if(action.equals("선택된 리뷰 삭제")) {	
			for(int i = 0; i<check.length;i++) {
				ids = check[i].split(" ");
				admindao.deleteReview(Integer.parseInt(ids[0]),Integer.parseInt(ids[1]));
			}
		}
			
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	@RequestMapping(value="/adminpage/notice")
	public ModelAndView manageNotice(@ModelAttribute("adminnotice") SearchNoticeInfoVO noticeinfo,
			SearchNoticeInfoVO info){
		ModelAndView mav = new ModelAndView();
		List<NoticeVO> list = null;
		
		if (info.getAction().equals("list")) {
			noticeinfo.setSearchType("title");
			noticeinfo.setKey("");
			noticeinfo.setAction("list");
		}else {
			noticeinfo = info;
		}
		list = noticedao.selectlist(noticeinfo);
		if (list.size() == 0) {
			System.out.println("0");
			mav.addObject("listmsg", "공지사항이 존재하지 않습니다.");
		} else {
			mav.addObject("noticelist", list);
		}
		mav.setViewName("adminpage");
		return mav;
	}
	
	@RequestMapping(value = "/adminpage/ncontent", method = RequestMethod.GET)
	public ModelAndView showNoticeContent(int nid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("content", noticedao.selectNotice(nid, "admin"));
		mav.setViewName("adminpage");
		return mav;
	}
	
	@RequestMapping(value = "/adminpage/managenotice")
	public ModelAndView updateNotice(@ModelAttribute("adminnotice") SearchNoticeInfoVO noticeinfo,
												HttpServletRequest request, NoticeVO info, String action) {
		ModelAndView mav = null;
		if(action.equals("수정")) {
			noticedao.updateNotice(info);
			mav = showNoticeContent(info.getNid());
		}else if(action.equals("삭제")) {
			noticedao.deleteNotice(info.getNid());
			mav = manageNotice(noticeinfo, noticeinfo);
		}else if(action.equals("작성")) {
			noticedao.insertNotice(info);
			mav = manageNotice(noticeinfo, noticeinfo);
		}
	    return mav;
	}
}
