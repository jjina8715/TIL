package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.vo.NewsVO;

public class NewsDAO {
	private Connection connectDB() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", "jdbctest");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	private void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
	private void close(Connection conn, PreparedStatement stmt) {
		try {
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
	public boolean insert(NewsVO vo) {
		Connection conn = connectDB();
		PreparedStatement pstmt = null;
		boolean result = true;
		try {pstmt = conn.prepareStatement("insert into news values(news_seq.nextval, ?, ?, ?, sysdate, 0)");
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			int num = pstmt.executeUpdate();
			if(num != 1)
				result = false;
		} catch (SQLException e) {
			result=false;
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		return result;
	}
	
	public boolean update(NewsVO vo) {
		boolean result = true;
		Connection conn = connectDB();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update news set writer=?, "
					+"title=?, content=? where id=?");
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getId());
			int num = pstmt.executeUpdate();
			if(num != 1)
				result = false;
		}catch (SQLException e) {
			result=false;
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		return result;
	}
	
	public boolean delete(int id) {
		boolean result = true;
		Connection conn = connectDB();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from news where id=?");
			pstmt.setInt(1, id);
			int num = pstmt.executeUpdate();
			if(num != 1)
				result = false;
		}catch (SQLException e) {
			result=false;
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		return result;
	}
	
	public List<NewsVO> listAll(){
		Connection conn = connectDB();
		List<NewsVO> list = new ArrayList<>();
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select id, writer, title, content,"
					+ " to_char(writedate, 'yyyy/mm/dd HH24:mi'), cnt from news");
			NewsVO vo;
			while(rs.next()) {
				vo = new NewsVO();
				vo.setId(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setWritedate(rs.getString(5));
				vo.setCnt(rs.getInt(6));
				list.add(vo);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn, stmt, rs);
		}
		return list;
	}
	public NewsVO listOne(int id) {
		Connection conn = connectDB();
		NewsVO vo = null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate("update news set cnt=cnt+1 where id="+id);		
			rs = stmt.executeQuery("select id, writer, title, content,"
					+ "to_char(writedate, 'yyyy/mm/dd HH24:mi'), cnt from news where id="+id);
			vo = new NewsVO();
			rs.next();
			vo.setId(rs.getInt(1));
			vo.setWriter(rs.getString(2));
			vo.setTitle(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setWritedate(rs.getString(5));
			vo.setCnt(rs.getInt(6));
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn, stmt, rs);
		}
		return vo;
	}
	public List<NewsVO> listWriter(String writer){//작성자 이름 클릭시 발생 =작성자책만 리스트로 나옴. 작성자 필요
		Connection conn=connectDB();
		List<NewsVO> list=new ArrayList<NewsVO>();//여러개받을려고
		Statement stmt=null;
		ResultSet res=null;
		try {
			stmt=conn.createStatement();
			res=stmt.executeQuery("select id,writer, content ,title,to_char(writedate,'yyyy/mm/dd HH24:mi'), CNT from news where writer="
							+ writer);
			NewsVO vo;
			while(res.next()) {
				vo= new NewsVO();
				vo.setId(res.getInt(1));
				vo.setWriter(res.getString(2));
				vo.setContent(res.getString(3));
				vo.setTitle(res.getString(4));
				vo.setWritedate(res.getString(5));
				vo.setCnt(res.getInt(6));
				list.add(vo);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,stmt,res);
		}
		return list;
		
	}
	
	public List<NewsVO> search(String key, String searchType){
		Connection conn=connectDB();
		NewsVO vo=null;
		Statement stmt=null;
		ResultSet res=null;
		List<NewsVO> list=new ArrayList<NewsVO>();
		try {
			stmt=conn.createStatement();
			res=stmt.executeQuery("select id,writer, content ,title, to_char(writedate,'yyyy/mm/dd HH24:mi'), CNT from news where "
			+searchType +" like '%"+key+"%'");
			while(res.next()) {
				vo= new NewsVO();
				vo.setId(res.getInt(1));
				vo.setWriter(res.getString(2));
				vo.setContent(res.getString(3));
				vo.setTitle(res.getString(4));
				vo.setWritedate(res.getString(5));
				vo.setCnt(res.getInt(6));
				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,stmt,res);
		}
		return list;
	}
}