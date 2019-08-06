package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import vo.OnePersonVO;

@Repository
public class OnePersonDAO {
	@Autowired
	@Qualifier("hiveDataSource")	
	DataSource ds;

	public List<OnePersonVO> selectorder() {//1인 가구가 많은 순
		List<OnePersonVO> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select addr1, addr2, households from oneperson order by households desc");
			OnePersonVO vo = null;
			while(rs.next()) {
				vo = new OnePersonVO();
				vo.setAddr1(rs.getString(1));
				vo.setAddr2(rs.getString(2));
				vo.setHouseholds(rs.getInt(3));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( stmt != null ) stmt.close();
				if( conn != null ) conn.close();
			} catch (Exception e) {
				e.printStackTrace();				
			} 
		}
		return list;
	}

	public List<OnePersonVO> selectgroup() {//구별 1인 가구 명수
		List<OnePersonVO> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select addr1, sum(households) households from oneperson group by addr1");
			OnePersonVO vo = null;
			while(rs.next()) {
				vo = new OnePersonVO();
				vo.setAddr1(rs.getString(1));
				vo.setHouseholds(rs.getInt(2));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( stmt != null ) stmt.close();
				if( conn != null ) conn.close();
			} catch (Exception e) {
				e.printStackTrace();				
			} 
		}
		return list;
	}

	public List<OnePersonVO> selectmost1() {//1인 가구수가 제일 많은 동의 구 이름과 동 이름
		List<OnePersonVO> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select addr1, addr2, households from oneperson order by households desc limit 1");
			OnePersonVO vo = null;
			while(rs.next()) {
				vo = new OnePersonVO();
				vo.setAddr1(rs.getString(1));
				vo.setAddr2(rs.getString(2));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( stmt != null ) stmt.close();
				if( conn != null ) conn.close();
			} catch (Exception e) {
				e.printStackTrace();				
			} 
		}
		return list;
	}

	public List<OnePersonVO> selectmost2() {//1인 가구수가 제일 많은 구
		List<OnePersonVO> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select addr1, sum(households) households from oneperson group by addr1 order by households desc limit 1");
			OnePersonVO vo = null;
			while(rs.next()) {
				vo = new OnePersonVO();
				vo.setAddr1(rs.getString(1));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( stmt != null ) stmt.close();
				if( conn != null ) conn.close();
			} catch (Exception e) {
				e.printStackTrace();				
			} 
		}
		return list;
	}

	public List<OnePersonVO> search(String action) {
		List<OnePersonVO> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select addr2, households from oneperson where addr1='"+action+"'");
			OnePersonVO vo = null;
			while(rs.next()) {
				vo = new OnePersonVO();
				vo.setAddr2(rs.getString(1));
				vo.setHouseholds(rs.getInt(2));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( stmt != null ) stmt.close();
				if( conn != null ) conn.close();
			} catch (Exception e) {
				e.printStackTrace();				
			} 
		}
		return list;
	}
}


