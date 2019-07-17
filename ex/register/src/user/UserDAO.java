package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	
	public UserDAO() {
		try {
			String URL = "jdbc:mysql://localhost:3306/REGISTER";
			String ID = "jspexam";
			String password = "jsppw";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, ID, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int registerCheck(String userID){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next() || userID.equals("")) {
				return 0;
			}else {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	

	public int register(String userID, String userPassword1, String userName, String userAge,
			String userGender, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword1);
			pstmt.setString(3, userName);
			pstmt.setInt(4,  Integer.parseInt(userAge));
			pstmt.setString(5, userGender);
			pstmt.setString(6, userEmail);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}
