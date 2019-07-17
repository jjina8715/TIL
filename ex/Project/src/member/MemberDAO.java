package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			String URL = "jdbc:mysql://uws7-074.cafe24.com:3306/wjswlsk1599"+
					"?characterEncoding=utf8&characterSetResults=utf8";
			String ID = "wjswlsk1599";
			String password = "hoseo2015!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, ID, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public String confirmMember(String tag)  throws SQLException{
		try {
			pstmt = conn.prepareStatement(
					"select customer_id from memberinfo where nfcid = ?");
			pstmt.setString(1, tag);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getString(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Member selectById(String id) {
		Member member = null;
		try {
			pstmt = conn.prepareStatement(
					"select customer_id, customer_password from memberinfo where customer_id= ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new Member(
						rs.getString(1),  
						rs.getString(2)
						);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
}
