package basket.service;
import java.util.List;

import basket.Basket;

public class BasketListView {
	private int basketTotalCount;
	private List<Basket> basketList;
	
	public BasketListView(List<Basket> basketList, int basketTotalCount) {
		this.basketList = basketList;
		this.basketTotalCount = basketTotalCount;
	}

	public int getBasketTotalCount() {
		return basketTotalCount;
	}

	public List<Basket> getBasketList() {
		return basketList;
	}

	public boolean isEmpty() {
		return basketTotalCount == 0;
	}
}
