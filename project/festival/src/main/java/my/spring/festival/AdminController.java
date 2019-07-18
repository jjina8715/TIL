package my.spring.festival;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
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
			mav.addObject("listMsg", "검색하신 정보에 해당하는 축제가 존재하지 않습니다.");
		} else {
			mav.addObject("reportlist", list);
		}
		mav.setViewName("adminpage");
		return mav;
	}
	@RequestMapping(value="/adminpage/report/del")
	public String deleteReport(HttpServletRequest request, List<String> name) {
		
	    return "sucess";
	}
	@RequestMapping(value="/adminpage/ncontent")
	public ModelAndView manageNotice(@ModelAttribute("adminnotice") SearchNoticeInfoVO noticeinfo,
			@RequestAttribute(required=false) SearchNoticeInfoVO info){
		ModelAndView mav = new ModelAndView();
		List<NoticeVO> list = null;
		if (info!=null&&info.getSearchType()==null) {
			noticeinfo.setSearchType("title");
			noticeinfo.setKey("");
		}else {
			noticeinfo = info;
		}
		list = noticedao.search(noticeinfo);
		if (list.size() == 0) {
			mav.addObject("listMsg", "공지사항이 존재하지 않습니다.");
		} else {
			mav.addObject("noticelist", list);
		}
		mav.setViewName("adminpage");
		return mav;
	}
	@RequestMapping(value = "/adminpage/notice", method = RequestMethod.GET)
	public ModelAndView showNoticeContent(int nid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("content", noticedao.selectNotice(nid));
		mav.setViewName("adminpage");
		return mav;
	}
}
