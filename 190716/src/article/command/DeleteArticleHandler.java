package article.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.model.Article;
import article.service.ArticleNotFoundException;
import article.service.DeleteArticleService;
import article.service.PermissionDeniedException;
import article.service.ReadArticleService;
import member.service.InvalidPasswordException;
import mvc.command.CommandHandler;

public class DeleteArticleHandler implements CommandHandler{
	private static final String FORM_VIEW = "/WEB-INF/view/deleteForm.jsp";

	private ReadArticleService readService = new ReadArticleService();
	private DeleteArticleService deleteService = new DeleteArticleService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
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
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String authUser = (String)req.getSession().getAttribute("authUser");
		int articleId = Integer.parseInt(req.getParameter("no"));
		
		Article article = readService.getArticle(articleId, false);
		
		if(!canDelete(authUser, article)) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		String password = req.getParameter("password");
		
		if(password == null || password.isEmpty()) {
			errors.put("password", Boolean.TRUE);
		}
		if(!errors.isEmpty()) {
			req.getSession().setAttribute("authUser", authUser);
			return FORM_VIEW;
		}	
		
		try {
			deleteService.deleteArticle(authUser, password, articleId);
			HttpSession session = req.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			req.getSession().setAttribute("authUser", authUser);
			return "/WEB-INF/view/deleteSuccess.jsp";
		}catch(InvalidPasswordException e) {
			errors.put("badPwd", Boolean.TRUE);
			return FORM_VIEW;
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
	}

	private boolean canDelete(String authUser, Article article) {
		String writerId = article.getWriterId();
		return authUser.equals(writerId);
	}

}
