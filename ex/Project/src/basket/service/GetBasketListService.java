package basket.service;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import basket.Basket;
import basket.Cart;
import stuff.Stuff;
import stuff.StuffDAO;
import basket.BasketDAO;

public class GetBasketListService {
	private static GetBasketListService instance = new GetBasketListService();

	public static GetBasketListService getInstance() {
		return instance;
	}

	private GetBasketListService() {
	}
	public CartListView getBasketList(String cid) {
		try {
			BasketDAO baksetDAO = new BasketDAO();
			int BasketTotalCount = baksetDAO.selectBasketCount(cid);
			List<Cart> basketList = null;
			if (BasketTotalCount > 0) {
				basketList = baksetDAO.selectBasketList(cid);
			} else {
				basketList = Collections.emptyList();
			}
			return new CartListView(basketList, BasketTotalCount);
		} catch (SQLException e) {
			throw new ServiceException("error: " + e.getMessage(), e);
		} 
	}
	
	public BasketListView getPayStufflist(String cid) {
		try {
			BasketDAO baksetDAO = new BasketDAO();
			int BasketTotalCount = baksetDAO.selectBasketCount(cid);
			List<Basket> basketList = null;
			if (BasketTotalCount > 0) {
				basketList = baksetDAO.getPayStufflist(cid);
			} else {
				basketList = Collections.emptyList();
			}
			return new BasketListView(basketList, BasketTotalCount);
		} catch (SQLException e) {
			throw new ServiceException("error: " + e.getMessage(), e);
		} 
	}

}
