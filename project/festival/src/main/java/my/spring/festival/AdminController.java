package my.spring.festival;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.AdminDAO;
import vo.ReportVO;

@Controller
public class AdminController {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping(value="/adminpage")
	public String MainAdminPage() {
		return "adminpage";
	}
	@RequestMapping(value="/adminpage/report")
	public ModelAndView manageReport() {
		ModelAndView mav = new ModelAndView();
		List<ReportVO> list;
		list = dao.selectReportlist();
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
}
