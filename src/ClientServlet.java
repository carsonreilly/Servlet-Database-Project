/*Name: Carson Reilly
 * Course: CNT 4714 - Spring 2024 - Project 4
 * Assignment Title: A Three-Tier Distributed Web-Based Application
 * Date: April 23rd, 2024
 */
import java.io.*;
import java.sql.*;
import java.util.Properties;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.mysql.cj.jdbc.MysqlDataSource;

@WebServlet("/client")
public class ClientServlet extends HttpServlet{
	private Connection connection;
	private Statement statement;
	private int mysqlUpdateValue;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sqlStatement=request.getParameter("sqlStatement");
		String message=" ";
		Properties properties=new Properties();
        MysqlDataSource dataSource=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            FileInputStream filein = new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 10.1/webapps/Project-4/WEB-INF/lib/client.properties");
			properties.load(filein);
			dataSource=new MysqlDataSource();
			dataSource.setUrl(properties.getProperty("MYSQL_DB_URL"));
			dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
			dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));
            connection = dataSource.getConnection();
            statement=connection.createStatement();
		    sqlStatement=sqlStatement.trim();
		    String sqlType=sqlStatement.substring(0,6);
		    if(sqlType.equalsIgnoreCase("select")) {
		    	ResultSet resultSet=statement.executeQuery(sqlStatement);
		    	message=ResultSetToHTMLFormatterClass.getHtmlRows(resultSet);
		    	//execute query
		    	//convert resultset to an html table
		    }
		    else {
		    	mysqlUpdateValue=statement.executeUpdate(sqlStatement);
		    }
		    //close statement
		    statement.close();
		}
		catch(SQLException | ClassNotFoundException e) {
			message="<tr bgcolor=#ff0000><td><font color:#ffffff><b>Error executing the SQL statment:</b><br>"+e.getMessage()+" </td></tr>";
		}
		HttpSession session=request.getSession();
		session.setAttribute("message",message);
		session.setAttribute("sqlStatement", sqlStatement);
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/clienthome.jsp");
		dispatcher.forward(request, response);
	}
}