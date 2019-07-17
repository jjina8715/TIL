package entrance;

import java.sql.SQLException;

import basket.BasketDAO;
import entrance.dao.TagDAO;
import util.ArduinoSerial;

public class exit {
	ArduinoSerial arduino = new ArduinoSerial("COM7");
	String tag, id;
	Thread t = new Thread() {
		
		@Override
		public void run() {
			arduino.initialize();
			while(true) {
				System.out.println(arduino.read());
			
				if(arduino.read() != null) {
					TagDAO tagDAO = new TagDAO();
					BasketDAO basketDAO = new BasketDAO();
					tag = arduino.read();
				
					try {
						id = tagDAO.confirmMemberInfo(tag);
					
						if(basketDAO.selectBasketCount(id)<=0) { 
							tagDAO.deleteCustomerList(id);
							System.out.println("goodbye");
						}else {
							System.err.println("you didn't pay");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					arduino.sleep(1000);
				}
			}
		}
	};
}

