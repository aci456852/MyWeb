package Utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;



public class DBUtils {
	private static String url;
	private static String username;
	private static String password;
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Properties properties=new Properties();
		try {
			properties.load(DBUtils.class.getResourceAsStream("/jdbc.properties"));
			url=properties.getProperty("jdbc.url");
			username=properties.getProperty("jdbc.username");
			password=properties.getProperty("jdbc.password");
			//System.out.println(url+" "+username+" "+password+"****");
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	public static Connection getConnection(){
		try {
			return DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void close(Connection conn){
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
