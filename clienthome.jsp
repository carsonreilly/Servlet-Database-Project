<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- Retrieve sqlStatement and message from session --%>
<%
String sqlStatement = (String) session.getAttribute("sqlStatement");
if (sqlStatement == null) sqlStatement = "select * from suppliers";
String message = (String) session.getAttribute("message");
if (message == null) message = " ";
%>
<html>
<head>
    <title>CNT 4714 Spring 2024 - Project 4 Enterprise System - Client</title>
    <style>
        body {background:black;text-align:center; font-family:Arial;}
        h1 {color:red; font-size: 28pt;}
        h2 {color:cyan; font-size:24pt;}
        input {color:yellow;background:665D1E;font-weight:bold;font-size:16pt;}
        input[type="submit"]{color:lime;}
        input[type="reset"]{color:red;}
        p {color:black;font-size:13pt;}
        table{font-family:Verdana;border: 3px solid black;}
        textarea{background:blue;color:white;font-family:Verdana;font-size:15pt;width:900px;height:275px;}
        th, td {padding:5px;border:1px solid black;}
        th {background-color:red;} /* Added background color for table headers */
        .highlight {color:red;}
        .main {color:white;}
        #bl {color:#708090;}
    </style>
    <script type="text/javascript">
        function eraseText(){
            document.getElementById("cmd").innerHTML=" ";
        }
    </script>
    <script type="text/javascript">
        function eraseData(){
            document.getElementById("data").innerHTML=" ";
        }
    </script>
</head>
<body>
    <h1>Welcome to the Spring 2024 Project 4 Enterprise System</h1>
    <h2>A Servlet/JSP-based Multi-tiered Enterprise Application Using A Tomcat Container</h2>
    <hr>
    <p class="main">You are connected to the Project 4 Enterprise System database as a <span class="highlight">client-level</span> user. <br />
    Please enter any SQL query or update command in the box below. <br />
    <br />
    </p>
    <form action="client" method="post">
        <textarea id="cmd" name="sqlStatement" cols=60 rows=8><%=sqlStatement%></textarea><br>
        <br>
        <input type="submit" value="Execute Command" />&nbsp;&nbsp;
        <input type="reset" value="Reset Form" onclick="javascript:eraseText();" />&nbsp;&nbsp;&nbsp;
        <input type="button" value="Clear Results" onclick="javascript:eraseData();" />
    </form>
    <p class="main"><br />All execution results will appear below this line. </p>
    <hr>
    <center>
        <p>
            <b class="main">Execution Results:</b><br>
            <table id="data">
                <%-- JSP expression to access servlet variable: message --%>
                <%=message%>
            </table>
        </p>
    </center>
</body>
</html>
