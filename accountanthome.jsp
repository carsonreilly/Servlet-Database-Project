<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String sqlStatement = (String) session.getAttribute("sqlStatement");
if (sqlStatement == null) sqlStatement = "select * from suppliers";
String message = (String) session.getAttribute("message");
if (message == null) message = " ";
%>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>CNT 4714 Spring 2024</title>
   <style>
      body {
         font-family: Arial, sans-serif;
         font-size: 20px;
         margin: 0;
         padding: 0;
         background-color: black; /* Black background */
         color: white; /* White text color */
         overflow-x: hidden; /* Prevent horizontal scrolling */
      }

      .section {
         width: 100%;
         background-color: black; /* Black background for sections */
         padding: 20px; /* Add padding */
         text-align: center; /* Center align text */
         border-bottom: 1px solid white; /* Grey border between sections */
      }

      .yellow-text {
         color: yellow; /* Yellow text color */
         font-size: 35px; /* Font size */
         margin-top: 20px; /* Top margin */
         margin-bottom: 20px; /* Bottom margin */
      }

      .neon-green-text {
         color: #00FF00; /* Neon green text color */
         font-size: 35px; /* Font size */
         margin-bottom: 20px; /* Bottom margin */
      }

      .red-text {
         color: red; /* Red text color */
      }
      /* Remove border bottom from the last container */
      .section:last-child {
         border-bottom: none;
      }

      /* Style for the grey box */
      .grey-box {
         background-color: grey;
         width: 90%; /* Adjusted width */
         margin: 0 auto;
         padding: 20px;
         border-radius: 10px;
      }

      /* Style for radio buttons */
      .radio-container {
         display: flex;
         flex-direction: column;
         align-items: flex-start;
         margin-top: 20px;
      }

      .radio-container label {
         margin-left: 150px; /* Add space between radio button and label */
         color: blue; /* Blue text color */
         font-size: 25px;
         font-weight: bold;
         display: flex;
         align-items: center;
      }

      .radio-container label .black-text {
         color: black; /* Black text color */
         font-size: 25px;
         font-weight: bold;
         margin-left: 10px; /* Add space between black and blue text */
         font-family: Arial, sans-serif; /* Same font as blue text */
      }

      .radio-container input[type="radio"] {
         margin-right: 10px;
      }

      /* Center justify buttons */
      .button-container {
         display: flex;
         justify-content: center;
         margin-top: 20px;
      }

      .button-container button {
         margin: 5px;
         padding: 10px 20px;
         font-size: 20px;
         cursor: pointer;
         background-color: #30544c; /* Button background color */
         border: none; /* No border */
         color: white; /* Button text color */
         font-weight: bold; /* Bold text */
         box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6); /* Emboss effect */
      }

      /* Button text colors */
      .button-container button:first-child {
         color: #00FF00; /* Neon green text color */
      }

      .button-container button:last-child {
         color: red; /* Red text color */
      }
      table {
        color: black; /* Set text color to black */
    }
    th{
		color: white; /* Set text color to white */    
    }
   </style>
   <script type="text/javascript">
        function eraseData(){
            document.getElementById("data").innerHTML=" ";
        }
    </script>
</head>
<body>
   <div class="section">
      <p class="yellow-text">Welcome to the Spring 2024 Project 4 Enterprise System</p>
      <p class="neon-green-text">A Servlet/JSP-based Multi-tiered Enterprise Application Using A Tomcat Container</p>
   </div>
   <div class="section">
      <p>You are connected to the Project 4 Enterprise System database as an <span class="red-text">accountant-level user</span>.</p>
      <p>Please select the operation you would like to perform from the list below.</p>
      <!-- Content for the second section -->
      <div class="grey-box">
         <form method="post" action="accountant">
            <div class="radio-container">
               <label for="operation1"><input type="radio" name="operation" id="operation1" value="operation1"> Get The Maximum Status Value Of All Suppliers <span class="black-text"> (Returns a maximum value)</span></label>
               <br><br>
               <label for="operation2"><input type="radio" name="operation" id="operation2" value="operation2"> Get The Total Weight Of All Parts <span class="black-text"> (Returns a sum)</span></label>
               <br><br>
               <label for="operation3"><input type="radio" name="operation" id="operation3" value="operation3"> Get The Total Number Of Shipments <span class="black-text"> (Returns the current number of shipments in total)</span></label>
               <br><br>
               <label for="operation4"><input type="radio" name="operation" id="operation4" value="operation4"> Get The Name And Number Of Workers Of The Job With The Most Workers <span class="black-text"> (Returns two value)</span></label>
               <br><br>
               <label for="operation5"><input type="radio" name="operation" id="operation5" value="operation5"> List The Name And Status Of Every Supplier <span class="black-text"> (Returns a list of supplier names with status)</span></label>
               <br><br>
            </div>
            <!-- Buttons -->
            <div class="button-container">
               <input type="submit" value="Execute Command" />
               <input type="button" value="Clear Results" onclick="javascript:eraseData();" />
            </div>
         </form>
      </div>
	<br>
	<label>All execution results will appear below this line.</label>
	<br>
   </div>
   <div class="section">
     <br>
     <label> Execution Results: </label>
     <br><br>
     <table id="data" style="margin: 0 auto; border: 2px solid white;">
     <%-- JSP expression to access servlet variable: message --%>
     <%=message%>
     </table> <!-- Empty HTML table -->
   </div>
</body>
</html>
