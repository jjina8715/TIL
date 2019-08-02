package hdfsexam;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;


public class TomcatLogHDFS_Save {
	 public static void main(String[] args) {
		 String srcDir = "C:/jjn/eclipse_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/logs/";
		 File[] files =  new File(srcDir).listFiles();
		 String data;
		 File result = new File("c:/iotest/tomcat_access_log.txt");
		 if(!result.exists()) {
			try {
				result.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
		 try (FileWriter writer = new FileWriter("c:/iotest/tomcat_access_log.txt", true);
	        		PrintWriter out = new PrintWriter(writer)){     
			 for(File file: files) {     
				 try (FileReader reader = new FileReader(srcDir+file.getName());
				    	   BufferedReader br = new BufferedReader(reader);){  
				           while (true) {
				               data = br.readLine();
				               if (data == null)
				                   break;       
				               out.println(data);
				           }
				       } catch (Exception e) {
				    	   e.printStackTrace();
				       }
			 }
			 
	     } catch (Exception e) {
	    	 e.printStackTrace();
	     }  
		 Configuration conf = new Configuration();
	     conf.set("fs.defaultFS", "hdfs://192.168.111.120:9000");
		 try(FileReader reader = new FileReader("c:/iotest/tomcat_access_log.txt");
		    	   BufferedReader br = new BufferedReader(reader);) {
			 FileSystem hdfs = FileSystem.get(conf);
	         Path path = new Path("/edudata/tomcat_access_log.txt");
	         FSDataOutputStream out = hdfs.append(path);
	         while (true) {
	               data = br.readLine();
	               if (data == null)
	                   break;       
	               out.writeChars(data);
	         }
	         
	         out.close();
			 FileStatus fStatus = hdfs.getFileStatus(path);
			 if(fStatus.isFile()) {
				 System.out.println("파일 사이즈 : "+fStatus.getLen()+"byte");
			 }
		 }catch(Exception e){
			 
		 }
		 
	 }
}
