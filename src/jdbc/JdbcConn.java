package jdbc;

import java.sql.DriverManager;
import java.sql.ResultSet;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;



public class JdbcConn {
	
	public static Connection conn;
	public static  Statement st;
	public static ResultSet rs;
	
	public static Connection getConnection() throws Exception{
		
		Class.forName("com.mysql.jdbc.Driver");
		conn= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/textReport","root","893389");
		
		return conn;
		
	}

}
