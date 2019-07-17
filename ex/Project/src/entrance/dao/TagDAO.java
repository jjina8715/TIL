package entrance.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import stuff.Stuff;

public class TagDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public TagDAO() {
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
	public String confirmMemberInfo(String tag) throws SQLException{
		try {
			pstmt = conn.prepareStatement("select customer_id from memberinfo where nfcid = ? ");
			pstmt.setString(1, tag);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getString(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int insertCustomerList(String id, String tag) throws SQLException{
		try {
			pstmt = conn.prepareStatement(
					"insert into customerlist " + 
					" values (?, ?)");
			pstmt.setString(1, id);
			pstmt.setString(2, tag);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int deleteCustomerList(String id) throws SQLException{
		try {
			pstmt = conn.prepareStatement("delete from customerlist where customer_id = ?");
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

}
