package stuff;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import basket.Buylog;

public class StuffDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public StuffDAO() {
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
	
	public Stuff selectStuff(int id) 
			throws SQLException {
		Stuff stuff = new Stuff();
		try {
			pstmt = conn.prepareStatement("select * from stuffinfo where stuff_id = ? ");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					stuff = makeStuffFromResultSet(rs);
				} while (rs.next());
			} else {
				return null;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return stuff;
	}
	
	private Stuff makeStuffFromResultSet(ResultSet rs) throws SQLException {
		Stuff stuff = new Stuff();
		stuff.setId(rs.getString("stuff_id"));
		stuff.setName(rs.getString("stuff_name"));
		stuff.setPrice(rs.getInt("stuff_price"));
		return stuff;
	}
	
	public int deleteStuff(int sid) throws SQLException {
		try {
			pstmt = conn.prepareStatement("delete from stuffinfo where stuff_id = ?");
			pstmt.setInt(1, sid);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
