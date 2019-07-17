package basket.service;

import java.sql.SQLException;

import basket.BasketDAO;

public class DeleteBasketService {
	private static DeleteBasketService instance = new DeleteBasketService();

	public static DeleteBasketService getInstance() {
		return instance;
	}
	private DeleteBasketService() {
	}
	public void deleteBasket(String cid) {
		try {
			BasketDAO basketDAO = new BasketDAO();
			basketDAO.deleteBasket(cid);
		} catch (SQLException ex) {
			throw new ServiceException("error:" + ex.getMessage(), ex);
		}
	}
}
