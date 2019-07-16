package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleDao;
import auth.service.LoginFailException;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;
import member.service.InvalidPasswordException;

public class DeleteArticleService {
	
	private ArticleDao articleDao = new ArticleDao();
	private MemberDao memberDao = new MemberDao();
	
	public void deleteArticle(String authUser, String password, int articleId) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, authUser);
			if (member == null) {
				throw new InvalidPasswordException();
			}
			if(!member.matchPassword(password)) {
				throw new PermissionDeniedException();
			}
			articleDao.deletArticle(conn, articleId);
			conn.commit();
		}catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}

	public void deleteUserArticle(String userId, String password) {
		
	}

}
