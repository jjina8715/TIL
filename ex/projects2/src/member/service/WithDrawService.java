package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class WithDrawService {

	private MemberDao memberDao = new MemberDao();
	private ArticleDao articleDao = new ArticleDao();
	
	public void deleteMember(String userId, String password) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, userId);
			if(member == null) {
				throw new MemberNotFoundException();
			}
			if(!member.matchPassword(password)) {
				throw new InvalidPasswordException();
			}
			
			int count = articleDao.seletUserCount(conn, userId);
			if(count > 0) {
				articleDao.deletArticleByUser(conn, userId);
			}
			memberDao.delete(conn, userId, password);
			conn.commit();
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
	} 

}
