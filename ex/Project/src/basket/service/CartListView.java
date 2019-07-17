package basket.service;

import java.util.List;

import basket.Cart;

public class CartListView {
	private int stuffTotalCount;
	private int stuffTotalPrice;
	private List<Cart> cartList;
	
	public CartListView(List<Cart> cartList, int stuffTotalCount) {
		this.cartList = cartList;
		this.stuffTotalCount = stuffTotalCount;
	}
	public int getStuffTotalCount() {
		return stuffTotalCount;
	}

	public boolean isEmpty() {
		return stuffTotalCount == 0;
	}
	public List<Cart> getCartList() {
		return cartList;
	}
	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}
	public int getStuffTotalPrice() {
		return stuffTotalPrice;
	}
	public void setStuffTotalPrice(int stuffTotalPrice) {
		this.stuffTotalPrice = stuffTotalPrice;
	}
	public void updatePrice() {
		for(int i = 0; i<cartList.size();i++) {
			this.stuffTotalPrice += cartList.get(i).getTotalPrice();
		}
	}
}
