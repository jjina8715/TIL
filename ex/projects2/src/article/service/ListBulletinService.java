package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import article.dao.BulletinDao;
import article.model.Bulletin;
import article.service.BulletinList;
import jdbc.connection.ConnectionProvider;;

public class ListBulletinService {
	
	private BulletinDao bulletinDao = new BulletinDao();
	
	public BulletinList getBulList() {
		try (Connection conn = ConnectionProvider.getConnection()){
			int total = bulletinDao.selectCount(conn);
			List<Bulletin> bulletinList = bulletinDao.selectList(conn);
			return new BulletinList(bulletinList, total);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
