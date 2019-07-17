package basket;

public class Cart {
	private String stuffName;
	private int stuffPrice;
	private int amount;
	private int totalPrice;
	
	public Cart(String stuffName, int stuffPrice) {
		this.stuffName = stuffName;
		this.stuffPrice = stuffPrice;
		this.amount = 1;
		this.totalPrice = stuffPrice;
	}
	public Cart(String stuffName, int stuffPrice, int amount, int totalPrice) {
		this.stuffName = stuffName;
		this.stuffPrice = stuffPrice;
		this.amount = amount;
		this.totalPrice = totalPrice;
	}
	public void setStuffName(String name) {
		stuffName = name;
	}
	public String getStuffName() {
		return stuffName;
	}
	public void setStuffPrice(int price) {
		stuffPrice = price;
	}
	public int getStuffPrice() {
		return stuffPrice;
	}
	public int getAmount() {
		return amount;
	}
	public void increseAmount() {
		amount += 1;
		setTotalPrice(amount * this.stuffPrice);
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
