package basket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class BasketDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BasketDAO() {
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
	
	public int selectBasketCount(String cid) throws SQLException {
		try {
			pstmt = conn.prepareStatement(
					"select count(*) from basket where customer_id = ?");
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<Basket> getPayStufflist(String cid) throws SQLException {
		List<Basket> basketList = new ArrayList<Basket>();
		try { 
			pstmt = conn.prepareStatement("select * from basket where customer_id = ?");
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					basketList.add(makePayStufflistFromResultSet(rs));
				}while(rs.next());
				
			}else {
				return Collections.emptyList();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return basketList;
	}
	
	private Basket makePayStufflistFromResultSet(ResultSet rs) throws SQLException {
		Basket basket = new Basket(rs.getString(1), rs.getString(2));
		return basket;
	}

	public int insertBuyLog(Buylog buylog) throws SQLException{
		try {
			pstmt = conn.prepareStatement(
					"insert into buylog " + 
					" values (?, ?, ?)");
			pstmt.setString(1, buylog.getCustomerId());
			pstmt.setString(2, buylog.getStuffId());
			pstmt.setTimestamp(3, toTimestamp(buylog.getBuyTime()));
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}

	public List<Cart> selectBasketList(String cid) throws SQLException{
		List<Cart> basketList = new ArrayList<Cart>();
		try { 
			pstmt = conn.prepareStatement("select S.stuff_name, S.stuff_price, count(*) as amount, (S.stuff_price*count(*)) as totalprice " + 
					"from stuffinfo S, basket B where B.customer_id = ? AND S.stuff_id = B.stuff_id  GROUP by S.stuff_name");
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					basketList.add(makeBasketListFromResultSet(rs));
				}while(rs.next());
				
			}else {
				return Collections.emptyList();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return basketList;
	}
	
	private Cart makeBasketListFromResultSet(ResultSet rs) throws SQLException {
		Cart cart = new Cart(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
		return cart;
	}

	public int deleteBasket(String cid) throws SQLException {
		try {
			pstmt = conn.prepareStatement("delete from basket where customer_id = ?");
			pstmt.setString(1, cid);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
