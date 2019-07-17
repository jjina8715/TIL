package util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.TooManyListenersException;

import gnu.io.*;

public class ArduinoSerial implements SerialPortEventListener{
	private SerialPort serialPort;
	private final String namePort;
	
	public ArduinoSerial(String portName) {
		this.namePort = portName;
	}
	
	private BufferedReader input;
	private OutputStream output;
	private static final int TIME_OUT = 2000;
	private static final int DATA_RATE = 9600;
    private String inputLine;
    
    public void initialize() {
    	CommPortIdentifier portId = null;
    	Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();
    	
    	while(portEnum.hasMoreElements()) {
    		CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();
    		if(namePort.equals(currPortId.getName())) {
    			portId = currPortId;
    			break;
    		}
    	}
    	
    	if(portId == null) {
    		System.out.println("Could not find COM port");
    		return;
    	}
    	
    	try {
    		serialPort = (SerialPort) portId.open(this.getClass().getName(), TIME_OUT);
    		
    		serialPort.setSerialPortParams(DATA_RATE,  SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
    		
    		input = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
    		output = serialPort.getOutputStream();
    		
    		serialPort.addEventListener(this);
    		serialPort.notifyOnDataAvailable(true);
    	}catch (PortInUseException | UnsupportedCommOperationException | IOException | TooManyListenersException e) {
            System.err.println(e.toString());
        }
    }
    
    public void send(String data) {
    	try {
    		output.write(data.getBytes());
    	}catch (Exception e) {
            System.err.println(e.toString());
        }
    }
    
    public String read() {
        return inputLine;
    }

    public void sleep(int time) {
        try {
            Thread.sleep(time);
        } catch (InterruptedException e) {
            System.err.println(e.toString());
        }
    }
    
    public synchronized void close() {
    	if(serialPort != null) {
    		serialPort.removeEventListener();
    		serialPort.close();
    	}
    }
    
    public synchronized void serialEvent(SerialPortEvent oEvent) {
    	if(oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
    		try {
    			inputLine = input.readLine();
    		}catch (Exception e) {
                System.err.println(e.toString());
            }
    	}
    }
}
