package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDao {

	public Member selectById(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from members where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Member member = null;
			if (rs.next()) {
				member = new Member(
						rs.getString("id"), 
						rs.getString("name"),  
						rs.getString("password"),
						toDate(rs.getTimestamp("regdate")));
			}
			return member;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}

	public void insert(Connection conn, Member member) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement("insert into members values(?,?,?,?)")) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setTimestamp(4, new Timestamp(member.getRegDate().getTime()));
			pstmt.executeUpdate();
		}
	}

	public int update(Connection conn, Member member) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("update members set name = ? , password = ? where id = ?")){
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getId());
			return pstmt.executeUpdate();
		} 
	}

	public int delete(Connection conn, String id, String password) throws SQLException {
		try(PreparedStatement pstmt = conn.prepareStatement("delete from members where id = ? AND password = ?")){
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			return pstmt.executeUpdate();
		}
	}
}
