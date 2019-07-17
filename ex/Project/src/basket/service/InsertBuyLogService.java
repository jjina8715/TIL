package basket.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import basket.*;
import stuff.*;

public class InsertBuyLogService {
	private static InsertBuyLogService instance = new InsertBuyLogService();

	public static InsertBuyLogService getInstance() {
		return instance;
	}

	private InsertBuyLogService() {
	}

	public void insertBuyLog(BasketListView basketlistview) {
		try {
			BasketDAO basketDAO = new BasketDAO();
			Buylog buylog = null;
			List<Basket> basketList = basketlistview.getBasketList();
			Basket basket;
			Date now = new Date();
			for(int i = 0; i<basketlistview.getBasketTotalCount();i++) {
				basket = basketList.get(i);
			buylog = new Buylog(basket.getCustomerId(), basket.getStuffId(), now);
			basketDAO.insertBuyLog(buylog);
			}	
		} catch (SQLException e) {
			throw new ServiceException(
					"error: " + e.getMessage(), e);
		}
	}
}
