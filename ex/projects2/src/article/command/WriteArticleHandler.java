package article.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.WriteArticleService;
import article.service.WriteRequest;
import mvc.command.CommandHandler;

public class WriteArticleHandler implements CommandHandler{
	private static final String FORM_VIEW = "/WEB-INF/view/newArticleForm.jsp";
	private WriteArticleService writeService = new WriteArticleService();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		String authUser = (String)req.getSession(false).getAttribute("authUser");
		WriteRequest writeReq = createWriteRequest(authUser, req);
		writeReq.validate(errors);
		
		if(!errors.isEmpty()) {
			req.getSession().setAttribute("authUser", authUser);
			return FORM_VIEW;
		}
		
		int newAticleNo = writeService.write(writeReq);
		req.setAttribute("newArticleNo", newAticleNo);
		
		req.getSession().setAttribute("authUser", authUser);
		return "/WEB-INF/view/newArticleSuccess.jsp";
	}
	private WriteRequest createWriteRequest(String userid, HttpServletRequest req) {
		return new WriteRequest(
				userid,
				Integer.parseInt(req.getParameter("bul_id")),
				req.getParameter("title"),
				req.getParameter("content"));
	}
	
	
}
