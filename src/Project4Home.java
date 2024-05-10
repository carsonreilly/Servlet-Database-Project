/*Name: Carson Reilly
 * Course: CNT 4714 - Spring 2024 - Project 4
 * Assignment Title: A Three-Tier Distributed Web-Based Application
 * Date: April 23rd, 2024
 */
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.util.Properties;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.mysql.cj.jdbc.MysqlDataSource;

@WebServlet("/authenticate")
public class Project4Home extends HttpServlet{
	private Connection connection;
	ResultSet lookupResults;
	PreparedStatement pstatement;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inBoundUsername = request.getParameter( "Username" );
		String inBoundPassword = request.getParameter( "Password" );
		String credentialsSearchQuery = "SELECT * FROM usercredentials WHERE login_username = ? AND login_password = ?";
		boolean foundUsername;
		boolean foundUserPassword;
		boolean usernameMismatch;
		boolean passwordMismatch;
		Properties properties=new Properties();
		FileInputStream filein=null;
		MysqlDataSource dataSource=null;
	    boolean userCredentialsOK = true;
	    try {
			try {
				filein=new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 10.1/webapps/Project-4/WEB-INF/lib/systemapp.properties");
				properties.load(filein);
				dataSource=new MysqlDataSource();
				dataSource.setUrl(properties.getProperty("MYSQL_DB_URL"));
				dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
				dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));
				connection=dataSource.getConnection();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			catch(IOException e) {
				e.printStackTrace();
			}
	    	pstatement=connection.prepareStatement(credentialsSearchQuery);
	    	pstatement.setString(1, inBoundUsername);
	    	pstatement.setString(2,inBoundPassword);
	    	lookupResults=pstatement.executeQuery();
	    	if(lookupResults.next()) {
	    		userCredentialsOK=true;
	    	}
	    	else {
	    		userCredentialsOK=false;
	    	}
	    }
	    catch(SQLException sqlException) {
	    	sqlException.printStackTrace();
	    }
	    if(userCredentialsOK) {
	    	if(inBoundUsername.equals("root")) {
	    		response.sendRedirect("roothome.jsp");
	    	}
	    	else if(inBoundUsername.equals("client")) {
	    		response.sendRedirect("clienthome.jsp");
	    	}
	    	else if(inBoundUsername.equals("dataentryuser")) {
	    		response.sendRedirect("dataentryhome.jsp");
	    	}
	    	else if(inBoundUsername.equals("theaccountant")) {
	    		response.sendRedirect("accountanthome.jsp");
	    	}
	    }
	    else {
	    	response.sendRedirect("errorpage.html");
	    }
//	    if (userCredentialsOK) {
//	        switch (inBoundUsername) {
//	            case "root":
//	            	if(inBoundPassword.equals("root")&&inBoundPassword.equals("root")) {
//	            		response.sendRedirect("roothome.jsp");
//	            	}
//	            	else {
//	            		response.sendRedirect("errorpage.html");
//	            	}
//	            	break;
//	            case "client":
//	            	if(inBoundPassword.equals("client")&&inBoundPassword.equals("client")) {
//	            		response.sendRedirect("clienthome.jsp");
//	            	}
//	            	else {
//	            		response.sendRedirect("errorpage.html");
//	            	}
//	            	break;
//	            case "dataentryuser":
//	            	if(inBoundPassword.equals("dataentryuser")&&inBoundPassword.equals("dataentryuser")) {
//	            		response.sendRedirect("dataentryhome.jsp");
//	            	}
//	            	else {
//	            		response.sendRedirect("errorpage.html");
//	            	}
//	            	break;
////	            case "dataupdateuser":
////	                System.out.println("Redirecting to dataUpdateHome.html");
////	                response.sendRedirect("dataupdatehome.html");
////	                break;
//	            case "theaccountant":
//	            	if(inBoundPassword.equals("theaccountant")&&inBoundPassword.equals("theaccountant")) {
//	            		response.sendRedirect("accountanthome.jsp");
//	            	}
//	            	else {
//	            		response.sendRedirect("errorpage.html");
//	            	}
//	            	break;
//	            default:
//	                System.out.println("Redirecting to errorpage.html");
//	                response.sendRedirect("errorpage.html");
//	                break;
//	        }
//	    
//	    } 
	}
	private void getDBConnection(){
		Properties properties=new Properties();
		FileInputStream filein=null;
		MysqlDataSource dataSource=null;
		try {
			filein=new FileInputStream("\"C:\\Program Files\\Apache Software Foundation\\Tomcat 10.1\\webapps\\Project-4\\WEB-INF\\lib\\systemapp.properties\"");
			properties.load(filein);
			dataSource=new MysqlDataSource();
			dataSource.setUrl(properties.getProperty("MYSQL_DB_URL"));
			dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
			dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));
			connection=dataSource.getConnection();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
}
