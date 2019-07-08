package edu.spring.springnews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dao.NewsDAO;
import vo.NewsVO;
import vo.SearchVO;

@Controller
@SessionAttributes(value = "status")
public class NewsController {

	@Autowired
	NewsDAO dao;

	@ModelAttribute("status")
	public SearchVO createVO() {
		return new SearchVO();
	}

	@RequestMapping(value = "/news")
	public ModelAndView listAll(SessionStatus session) {
		ModelAndView mav = new ModelAndView();
		List<NewsVO> list = dao.listAll();
		mav.addObject("list", list);
		if (list.size() != 0) {
			mav.addObject("list", list);
		} else {
			mav.addObject("listMsg", "추출된 미팅 정보가 없습니다.");
		}
		mav.setViewName("newsView");
		session.setComplete();
		return mav;
	}

	@RequestMapping(value = "/news/{action}", method = RequestMethod.GET)
	public ModelAndView doGet(@PathVariable String action, NewsVO vo, SearchVO searchVO,
			@ModelAttribute("status") SearchVO status) {
		ModelAndView mav = new ModelAndView();
		List<NewsVO> list = null;
		if (action.equals("read")) {
			NewsVO news = dao.listOne(vo.getId());
			mav.addObject("vo", news);
		} else if (action.equals("delete")) {
			if (dao.delete(vo.getId()))
				mav.addObject("msg", "뉴스가 성공적으로 삭제되었습니다.");
			else
				mav.addObject("msg", "뉴스를 삭제하는데  실패했습니다.");
		} else {
			status = new SearchVO();
			status.setKey(searchVO.getKey());
			status.setSearchType(searchVO.getSearchType());
			if (action.equals("search")) {
				list = dao.search(searchVO);
				if (list.size() != 0) {
					mav.addObject("list", list);
				} else {
					mav.addObject("listMsg", searchVO.getKey() + "로 검색된 뉴스 정보가 없습니다.");
				}
			} else if (action.equals("listWr")) {
				list = dao.listWriter(searchVO);
				if (list.size() != 0) {
					mav.addObject("list", list);
				} else {
					mav.addObject("listMsg", searchVO.getKey() + "가 작성한 뉴스 정보가 없습니다.");
				}
			}
		}
		if (list == null) {
			if (status.getKey() != null) {
				list = dao.search(status);
				if (list.size() != 0) {
					mav.addObject("list", list);
				} else {
					mav.addObject("listMsg", status.getKey()+"로 검색된 뉴스 정보가 없습니다.");
				}
			} else {
				list = dao.listAll();
				if (list.size() != 0) {
					mav.addObject("list", list);
				} else {
					mav.addObject("listMsg", "추출된 뉴스 정보가 없습니다.");
				}
			}
			
		}
		mav.setViewName("newsView");
		return mav;
	}

	@RequestMapping(value = "/news/{action}", method = RequestMethod.POST)
	public ModelAndView doPost(@PathVariable String action, NewsVO vo, @ModelAttribute("status") SearchVO status) {
		ModelAndView mav = new ModelAndView();
		List<NewsVO> list = null;
		System.out.println(vo.toString());
		if (action.equals("insert")) {
			boolean result = dao.insert(vo);
			if (result) {
				mav.addObject("msg", "성공적으로 저장되었어요.");
			} else {
				mav.addObject("msg", "작성을 실패했어요.");
			}
		} else if (action.equals("update")) {
			boolean result = dao.update(vo);
			if (result) {
				mav.addObject("msg", "성공적으로 수정되었어요.");
			} else {
				mav.addObject("msg", "수정에 실패했어요.");
			}
		}
		if (status.getKey() != null) {
			list = dao.search(status);
		} else {
			list = dao.listAll();
		}
		if (list.size() != 0) {
			mav.addObject("list", list);
		} else {
			mav.addObject("listMsg", "추출된 뉴스 정보가 없습니다.");
		}
		mav.setViewName("newsView");
		return mav;
	}
}
