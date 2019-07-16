package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import article.model.Bulletin;
import jdbc.JdbcUtil;

public class BulletinDao {

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from bulletins");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Bulletin> selectList(Connection conn) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement("select * from bulletins");
				rs = pstmt.executeQuery();
				List<Bulletin> result = new ArrayList<>();
				while (rs.next()) {
					result.add(convertBulletin(rs));
				}
				return result;
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
	}

	private Bulletin convertBulletin(ResultSet rs) throws SQLException {
		return new Bulletin(rs.getInt("id"),
				rs.getString("title"));
	}

}
