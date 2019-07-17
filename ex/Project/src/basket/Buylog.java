package basket;

import java.sql.Timestamp;
import java.util.Date;

public class Buylog {
	private String cid;
	private String sid;
	private String sname;
	private int price;
	private Date buyTime;
	
	public Buylog(String cid, String sid, Date buyTime) {
		this.cid = cid;
		this.sid = sid;
		this.buyTime = buyTime;
		this.setPrice(0);
		this.setSname("");
	}
	
	public Buylog(int price, String sname, Date buyTime) {
		this.setPrice(price);
		this.setSname(sname);
		this.buyTime = buyTime;
		this.cid = "";
		this.sid = null;
	}
	
	public String getCustomerId() {
		return cid;
	}

	public String getStuffId() {
		return sid;
	}

	public Timestamp getBuyTime() {
		return toTimestamp(buyTime);
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
	
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
}
