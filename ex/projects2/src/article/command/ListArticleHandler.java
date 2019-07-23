package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticlePage;
import article.service.BulletinList;
import article.service.ListArticleService;
import article.service.ListBulletinService;
import mvc.command.CommandHandler;

public class ListArticleHandler implements CommandHandler{

	private ListArticleService listService = new ListArticleService();
	private ListBulletinService bulletinService = new ListBulletinService();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		String id = req.getParameter("bul_id");
		
		BulletinList bulletins = bulletinService.getBulList();
		req.setAttribute("bulletins", bulletins);
		
		if(id != null) {
			int pageNo = 1;
			int bul_id = Integer.parseInt(id);
			if(pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
			ArticlePage articlePage = listService.getArticlePage(pageNo, bul_id);
			req.setAttribute("articlePage", articlePage);
		}else {
			req.setAttribute("articlePage", null);
		}
		return "/WEB-INF/view/listArticle.jsp";
	}

}
