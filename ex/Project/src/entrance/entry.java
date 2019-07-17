package entrance;

import java.sql.SQLException;

import entrance.dao.TagDAO;
import util.ArduinoSerial;

public class entry {

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
				
					tag = arduino.read();
					try {
						id = tagDAO.confirmMemberInfo(tag);
						if(!id.equals(null)) { 
							tagDAO.insertCustomerList(id, tag);
							System.out.println("come in");
						}else {
							System.err.println("login please");
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
