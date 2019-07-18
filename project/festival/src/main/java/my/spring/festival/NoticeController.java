package my.spring.festival;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.NoticeDAO;
import vo.PageList;
import vo.NoticeVO;
import vo.SearchNoticeInfoVO;

@Controller
@SessionAttributes(value = "noticeinfo")
public class NoticeController {
	@Autowired
	private NoticeDAO dao;
	private int size = 10;

	@ModelAttribute("noticeinfo")
	public SearchNoticeInfoVO createFestainfo() {
		return new SearchNoticeInfoVO();
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public ModelAndView showNoticeList(@ModelAttribute("noticeinfo") SearchNoticeInfoVO noticeinfo,
			SearchNoticeInfoVO info) {
		ModelAndView mav = new ModelAndView();
		List<NoticeVO> tmplist = null;
		int pageNo = info.getPageNo();
		if (info.getSearchType()==null) {
			if(pageNo!=0) {
				noticeinfo.setSearchType("title");
				noticeinfo.setKey("");
				noticeinfo.setPageNo(pageNo);
			}else
				pageNo = noticeinfo.getPageNo();
		}else {
			noticeinfo = info;
		}
		int total = dao.selectSearchCount(noticeinfo);
		noticeinfo.setStartRow((pageNo - 1) * size + 1);
		noticeinfo.setEndRow((pageNo - 1) * size + size);
		tmplist = dao.search(noticeinfo);

		if (tmplist.size() == 0) {
			mav.addObject("listMsg", "공지사항이 존재하지 않습니다.");
		} else {
			mav.addObject("resultlist", new PageList<NoticeVO>(total, pageNo, size, tmplist));
		}
		mav.setViewName("shownotice");
		return mav;
	}

	@RequestMapping(value = "/notice/ncontent", method = RequestMethod.GET)
	public ModelAndView showNoticeContent(int nid) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("content", dao.selectNotice(nid));
		mav.setViewName("shownotice");
		return mav;
	}
}
