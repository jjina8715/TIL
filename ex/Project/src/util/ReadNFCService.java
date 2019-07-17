package util;

public class ReadNFCService {
	private static ReadNFCService instance = new ReadNFCService();

	public static ReadNFCService getInstance() {
		return instance;
	}
	private ReadNFCService() {
	}
	
	public String readNFC() {
		ArduinoSerial arduino = new ArduinoSerial("COM7");
		String tag;
		arduino.initialize();
		tag = arduino.read();
		while(true) {
			tag = arduino.read();	
			if(tag !=null) { 
				System.out.println(tag);
				return tag;
			}
		}
		
	}
}
