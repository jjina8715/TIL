package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import article.dao.ArticleDao;
import article.model.Article;
import jdbc.connection.ConnectionProvider;

public class ListArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private int size = 3;
	
	public ArticlePage getArticlePage(int pageNum, int bulId) throws SQLException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = articleDao.selectCount(conn, bulId);
			List<Article> content = articleDao.select(
					conn, (pageNum - 1) * size, size, bulId);
			return new ArticlePage(total, pageNum, size, content);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}


}
