package my.spring.festival;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.FestivalDAO;
import vo.FestivalList;
import vo.FestivalVO;
import vo.SearchInfoVO;


@Controller
public class FestivalController {
	@Autowired
	FestivalDAO dao;
	int size = 10;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView showList(SearchInfoVO info, int pageNo) {
		List<FestivalVO> tmplist;
		ModelAndView mav = new ModelAndView();	
		int total = dao.selectCount(info);
		info.setStartRow((pageNo-1)*size);
		info.setSize(size);
		tmplist = dao.search(info);
		if (tmplist.size() == 0) {
			mav.addObject("listMsg", "검색하신 정보에 해당하는 축제가 존재하지 않습니다.");
		}else {
			mav.addObject("list", new FestivalList(total, pageNo, size, tmplist));
		}
		return mav;
	}
}
