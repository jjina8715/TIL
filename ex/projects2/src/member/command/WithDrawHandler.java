package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.service.DeleteArticleService;
import member.service.InvalidPasswordException;
import member.service.MemberNotFoundException;
import member.service.WithDrawService;
import mvc.command.CommandHandler;

public class WithDrawHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/WEB-INF/view/withDrawForm.jsp";
	private WithDrawService drawService = new WithDrawService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String userId = (String)req.getSession().getAttribute("authUser");
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		String password = req.getParameter("password");
		
		if(password == null || password.isEmpty()) {
			errors.put("password", Boolean.TRUE);
		}
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			drawService.deleteMember(userId, password);
			HttpSession session = req.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			return "/WEB-INF/view/withDrawSuccess.jsp";
		}catch(InvalidPasswordException e) {
			errors.put("badPwd", Boolean.TRUE);
			return FORM_VIEW;
		}catch(MemberNotFoundException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}
		
	}
}
