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

@WebServlet("/suppliersForm")
public class SupplierServlet extends HttpServlet{
	private int mysqlUpdateValue;
	private Connection connection;
	private Statement statement;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String command1=request.getParameter("sup1");
    	String command2=request.getParameter("sup2");
    	String command3=request.getParameter("sup3");
    	String command4=request.getParameter("sup4");
    	String message="";
    	Properties properties=new Properties();
        MysqlDataSource dataSource=null;
    	int c=Integer.parseInt(command3);
    	String sqlStatement="insert into suppliers values(\""+command1+"\", \""+command2+"\", "+command3+", \""+command4+"\")";
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");
			FileInputStream filein = new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 10.1/webapps/Project-4/WEB-INF/lib/dataentry.properties");
			properties.load(filein);
			dataSource=new MysqlDataSource();
			dataSource.setUrl(properties.getProperty("MYSQL_DB_URL"));
			dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
			dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));
            connection = dataSource.getConnection();	        statement=connection.createStatement();
	        mysqlUpdateValue=statement.executeUpdate(sqlStatement);
            message = "<tr style=\"text-align:center;font color:black;background-color:#00FF00;\"><td><font color=\"#ffffff\"><b>The statement executed successfully.</b><br>" + mysqlUpdateValue + "<b> row(s) affected.</b>";
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
            message="<tr bgcolor=#ff0000><td><font color:#ffffff><b>Error executing the SQL statement:</b><br>"+e.getMessage()+" </td></tr>";
		}
    	HttpSession session=request.getSession();
        session.setAttribute("message",message);
        RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/dataentryhome.jsp");
        dispatcher.forward(request, response);
    }
}
