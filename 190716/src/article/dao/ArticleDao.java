package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import jdbc.JdbcUtil;

public class ArticleDao {

	public Article insert(Connection conn, Article article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("insert into articles "
					+ "(bul_id, writer_id, title, content, posting_date, read_cnt) "
					+ "values (?, ?, ?, ?, ?, 0)");
			pstmt.setInt(1, article.getBulId());
			pstmt.setString(2, article.getWriterId());
			pstmt.setString(3, article.getTitle());
			pstmt.setString(4, article.getContent());
			pstmt.setTimestamp(5, toTimestamp(article.getPostingDate()));
			
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from articles");
				if(rs.next()) {
					Integer newNo = rs.getInt(1);
					return new Article(article.getBulId(),
							newNo,
							article.getWriterId(),
							article.getTitle(),
							article.getContent(),
							article.getPostingDate(),
							0);
				}
			}
			return null;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}

	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}

	public int selectCount(Connection conn, int bul_id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select count(*) from articles where bul_id = ?");
			pstmt.setInt(1, bul_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}


	public int seletUserCount(Connection conn, String userId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select count(*) from articles where writer_id = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<Article> select(Connection conn, int startRow, int size, int bulId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from articles where bul_id = ? " +
					"order by article_id desc limit ?, ?");
			pstmt.setInt(1, bulId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);
			rs = pstmt.executeQuery();
			List<Article> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Article convertArticle(ResultSet rs) throws SQLException  {
		return new Article(rs.getInt("bul_id"),
				rs.getInt("article_id"),
				rs.getString("writer_id"),
				rs.getString("title"),
				rs.getString("content"),
				toDate(rs.getTimestamp("posting_date")),
				rs.getInt("read_cnt"));
	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}

	public Article seleteById(Connection conn, int articleNum) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from articles where article_id = ?");
			pstmt.setInt(1, articleNum);
			rs = pstmt.executeQuery();
			Article article = null;
			if(rs.next()) {
				article = convertArticle(rs);
			}
			return article;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public void increaseReadCount(Connection conn, int articleNum) throws SQLException {
		try(PreparedStatement pstmt = 
				conn.prepareStatement(
						"update articles set read_cnt = read_cnt + 1 "+
						"where article_id = ?")) {
			pstmt.setInt(1, articleNum);
			pstmt.executeUpdate();
		}
	}
	
	public void decreaseReadCount(Connection conn, int articleNum) throws SQLException {
		try(PreparedStatement pstmt = 
				conn.prepareStatement(
						"update articles set read_cnt = read_cnt - 1 "+
						"where article_id = ?")) {
			pstmt.setInt(1, articleNum);
			pstmt.executeUpdate();
		}
	}

	public int update(Connection conn, int articleId, String title, String content) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update articles set title = ?, content = ? "+
						"where article_id = ?")) {
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, articleId);
			return pstmt.executeUpdate();
		}
	}

	public void deletArticle(Connection conn, int articleId) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"delete from articles "+
						"where article_id = ?")) {
			pstmt.setInt(1, articleId);
			pstmt.executeUpdate();
		}
	}

	public void deletArticleByUser(Connection conn, String userId) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"delete from articles "+
						"where writer_id = ?")) {
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		}
	}

}
