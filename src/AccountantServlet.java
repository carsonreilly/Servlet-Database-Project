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

@WebServlet("/accountant")
public class AccountantServlet extends HttpServlet{
	private Connection connection;
	private Statement statement;
	private int mysqlUpdateValue;
	private boolean mysqlReturnValue;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		String message;
		String command;
		Properties properties=new Properties();
        MysqlDataSource dataSource=null;
        // Handle the operation accordingly
        if (operation != null) {
        	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				FileInputStream filein = new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 10.1/webapps/Project-4/WEB-INF/lib/accountant.properties");
				properties.load(filein);
				dataSource=new MysqlDataSource();
				dataSource.setUrl(properties.getProperty("MYSQL_DB_URL"));
				dataSource.setUser(properties.getProperty("MYSQL_DB_USERNAME"));
				dataSource.setPassword(properties.getProperty("MYSQL_DB_PASSWORD"));
	            connection = dataSource.getConnection();
	            statement=connection.createStatement();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            // Perform database operations based on the selected operation
            switch (operation) {
                case "operation1":
                    // Execute SQL command for operation1
                    // Example:
                	command="{call Get_The_Maximum_Status_Of_All_Suppliers()}";
                    break;
                case "operation2":
                    // Execute SQL command for operation2
                    // Example:
                	command="{call Get_The_Sum_Of_All_Parts_Weights()}";
                    break;
                case "operation3":
                    // Execute SQL command for operation2
                    // Example:
                	command="{call Get_The_Total_Number_Of_Shipments()}";
                    break;
                case "operation4":
                    // Execute SQL command for operation2
                    // Example:
                	command="{call Get_The_Name_Of_The_Job_With_The_Most_Workers()}";
                    break;
                case "operation5":
                    // Execute SQL command for operation2
                    // Example:
                	command="{call List_The_Name_And_Status_Of_All_Suppliers()}";
                    break;
                 default:
                	 command="{call ERROR()}";
                // Add cases for other operations
            }
            try {
				CallableStatement statement=connection.prepareCall(command);
				mysqlReturnValue=statement.execute();
				if(mysqlReturnValue) {
					ResultSet resultSet=statement.getResultSet();
					message=ResultSetToHTMLFormatterClass.getHtmlRows(resultSet);
					 statement.close();
				}
				else {
					message="Error executing RPC!";
					 statement.close();
				}
			} catch (SQLException e) {
				message="<tr bgcolor=#ff0000><td><font color:#ffffff><b>Error executing the SQL statment:</b><br>"+e.getMessage()+" </td></tr>";
			}
            HttpSession session=request.getSession();
    		session.setAttribute("message",message);
    		session.setAttribute("sqlStatement", command);
    		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/accountanthome.jsp");
    		dispatcher.forward(request, response);
        } else {
            // Handle case where no operation is selected
            
        }
	}
}
