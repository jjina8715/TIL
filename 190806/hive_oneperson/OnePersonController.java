package my.spring.springedu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.OnePersonDAO;
import vo.OnePersonVO;

@Controller
public class OnePersonController {
	@Autowired
	OnePersonDAO dao;
	
	@RequestMapping("/one")
	String gohome() {
		return "OnePersonView";
	}
	
	@RequestMapping(value="/one/{action}", method = RequestMethod.GET)
	ModelAndView selectData(@PathVariable String action) {
		ModelAndView mav = new ModelAndView();
		List<OnePersonVO> list  = null;
		if(action.equals("order")) {
			list = dao.selectorder();
			mav.addObject("msg", "1인 가구가 많은 순서");
		}else if(action.equals("group")) {
			list = dao.selectgroup();
			mav.addObject("msg", "구별 1인 가구 명수");
		}else if(action.equals("most1")) {
			list = dao.selectmost1();
			mav.addObject("msg", "1인 가구수가 제일 많은 동");
		}else if(action.equals("most2")) {
			list = dao.selectmost2();
			mav.addObject("msg", "1인 가구수가 제일 많은 구");
		}
		if(list != null)
			mav.addObject("list", list);
		mav.addObject("action", action);
		
		mav.setViewName("OnePersonView");
		return mav;	
	}
	@RequestMapping(value="/one/{action}", method = RequestMethod.POST)
	ModelAndView searchData(@PathVariable String action, String key) {
		ModelAndView mav = new ModelAndView();
		List<OnePersonVO> list  = null;
		if(action.equals("search")){
			list = dao.search(key);
			mav.addObject("msg", key + "의 1인 가구수");
		}
		if(list != null)
			mav.addObject("list", list);
		mav.addObject("action", action);
		mav.setViewName("OnePersonView");
		return mav;	
	}
}
