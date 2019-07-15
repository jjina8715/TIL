package my.spring.festival;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.FestivalDAO;
import vo.FestivalList;
import vo.FestivalVO;
import vo.SearchInfoVO;


@Controller
@SessionAttributes(value = "festainfo")
public class FestivalController {
	@Autowired
	FestivalDAO dao;
	int size = 10;
	@ModelAttribute("festainfo")
	public SearchInfoVO createFestainfo() {
		return new SearchInfoVO();
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView showList(@ModelAttribute("festainfo") SearchInfoVO festainfo, SearchInfoVO info, int pageNo) {
		List<FestivalVO> tmplist;
		ModelAndView mav = new ModelAndView();	
		if(info.getAction().equals("search"));
			festainfo = info;
		
		int total = dao.selectCount(festainfo);
		festainfo.setStartRow((pageNo-1)*size);
		festainfo.setSize(size);
		tmplist = dao.search(festainfo);
		if (tmplist.size() == 0) {
			mav.addObject("listMsg", "검색하신 정보에 해당하는 축제가 존재하지 않습니다.");
		}else {
			mav.addObject("resultlist", new FestivalList(total, pageNo, size, tmplist));
		}
		List<Float[]> latlng = new ArrayList<Float[]>();
		for(FestivalVO festa : tmplist) {
			latlng.add(new Float[]{festa.getLat(), festa.getLng()});
		}
		mav.addObject("latlng", latlng);
		mav.setViewName("showlist");
		return mav;
	}
}
