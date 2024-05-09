# Servlet-Database-Project

This project uses Tomcat to deploy servlets (in the form of .jsp and .html pages) to allow for the user to login to an SQL database and enter commands that are then reflected on to the database. 

An SQL connector and Tomcat were used to build, test, and run. 

There are 4 different users that can log in: the accountant, root, client, and datentryuser users.

The accountant user can select different select statements that they wish to run to see specific information regarding the database.

The root user can run select and update statements to view and modify data inside of the database. 

The client user can run select statements to view data inside of the database.

The data entry user can input data inside of the text areas, which are then inserted into an update statement and ran on the database to modify it. 

Properties files are used to validate log-in credentials.
