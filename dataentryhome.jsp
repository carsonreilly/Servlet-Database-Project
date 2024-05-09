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
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Container Page</title>
   <style>
      body {
         font-family: Arial, sans-serif;
         background-color: black; /* Set background color to black */
         color: white; /* Set text color to white */
         margin: 0;
         padding: 0;
      }

      .container {
         width: 100%;
         max-width: 1200px;
         margin: 0 auto;
         padding: 20px;
         box-sizing: border-box;
         margin-bottom: 20px;
         border: 2px solid white; /* Set border color to white */
         position: relative;
      }

      /* Remove border for containers 1, 2, and 6 */
      .container:nth-child(-n+2),
      .container:nth-child(6) {
          border: none;  /* Remove this line */
      }

      .welcome-text {
         color: red;
         text-align: center;
         margin-bottom: 10px; /* Add margin below the welcome text */
         font-size: 35px;
      }

      .data-entry-text {
         color: #00FFFF; /* Set text color to neon blue */
         text-align: center;
         font-size: 30px; /* Set font size to slightly smaller */
      }

      .connected-text {
         text-align: center;
         color: white; /* Set text color to white */
         font-size: 20px;
      }

      .red-text {
         color: red; /* Set text color to red */
      }

      /* Updated styles for table in container 3, 4, 5, and 6 */
      .container:nth-child(3) table,
      .container:nth-child(4) table,
      .container:nth-child(5) table,
      .container:nth-child(6) table,
      .container:nth-child(9) table {
         width: 100%; /* Make table fill container width */
         border-collapse: collapse; /* Collapse border */
         margin-top: 40px; /* Add margin to the top */
         font-size: 20px; /* Set font size */
         border: 4px solid yellow; /* Set thicker border */
         background-color: black; /* Set background color to black */
      }

      .container:nth-child(3) th, .container:nth-child(3) td,
      .container:nth-child(4) th, .container:nth-child(4) td,
      .container:nth-child(5) th, .container:nth-child(5) td,
      .container:nth-child(6) th, .container:nth-child(6) td,
      .container:nth-child(9) th, .container:nth-child(9) td {
         border: 2px double yellow; /* Set double lines for inside borders */
         padding: 10px; /* Add padding */
         text-align: center; /* Center align text */
      }

      /* Styling for text area fields */
      .container:nth-child(3) textarea,
      .container:nth-child(4) textarea,
      .container:nth-child(5) textarea,
      .container:nth-child(6) textarea,
      .container:nth-child(9) textarea {
         width: calc(100% - 24px); /* Subtract padding from width */
         margin-top: 10px; /* Add margin to the top */
         padding: 10px; /* Add padding */
         border: 2px solid yellow; /* Set border color to yellow */
         background-color: lightyellow; /* Set background color to yellow */
         color: black; /* Set text color to black */
         resize: none; /* Disable textarea resize */
      }

      /* Button styles */
      .button-container {
         text-align: center;
         margin-top: 20px;
      }



      .button-red {
         background-color: #333; /* Dark grey */
         color: red; /* Red text */
      }
   </style>
       <script type="text/javascript">
        function eraseText(){
            document.getElementById("cmd").innerHTML=" ";
            document.getElementById("data").innerHTML=" ";
        }
    </script>
</head>
<body>
   <div class="container">
      <h1 class="welcome-text">Welcome to the Spring 2024 Project 4 Enterprise System</h1>
      <p class="data-entry-text">Data Entry Application</p>
   </div>
   <div class="container">
      <p class="connected-text">You are connected to the Project 4 Enterprise System database as a <span class="red-text">data-entry-level</span> user.</p>
      <p class="connected-text">Enter the data values in a form below to add a new record to the corresponding database.</p>
   </div>
   <div class="container">
      <form action="suppliersForm" method="post">
         <p>Suppliers Record Insert</p>
         <table>
            <thead>
               <tr>
                  <th>snum</th>
                  <th>sname</th>
                  <th>status</th>
                  <th>city</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><textarea name="sup1"></textarea></td>
                  <td><textarea name="sup2"></textarea></td>
                  <td><textarea name="sup3"></textarea></td>
                  <td><textarea name="sup4"></textarea></td>
               </tr>
            </tbody>
         </table>
         <div class="button-container">
       		<input type="submit" value="Enter Suppliers Record Into Database" />
            <input type="reset" value="Clear Data and Results" onclick="javascript:eraseText();" />&nbsp;&nbsp;&nbsp;
         </div>
      </form>
   </div>
   <div class="container">
      <form action="partsForm" method="post">
         <p>Parts Record Insert</p>
         <table>
            <thead>
               <tr>
                  <th>pnum</th>
                  <th>pname</th>
                  <th>color</th>
                  <th>weight</th>
                  <th>city</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><textarea name="p1"></textarea></td>
                  <td><textarea name="p2"></textarea></td>
                  <td><textarea name="p3"></textarea></td>
                  <td><textarea name="p4"></textarea></td>
                  <td><textarea name="p5"></textarea></td>
               </tr>
            </tbody>
         </table>
         <div class="button-container">
         	<input type="submit" value="Enter Parts Record Into Database" />
            <input type="reset" value="Clear Data and Results" onclick="javascript:eraseText();" />&nbsp;&nbsp;&nbsp;

         </div>
      </form>
   </div>
   <div class="container">
     <form action="jobsForm" method="post">
         <p>Jobs Record Insert</p>
         <table>
            <thead>
               <tr>
                  <th>jnum</th>
                  <th>jname</th>
                  <th>numworkers</th>
                  <th>city</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><textarea name="j1"></textarea></td>
                  <td><textarea name="j2"></textarea></td>
                  <td><textarea name="j3"></textarea></td>
                  <td><textarea name="j4"></textarea></td>
               </tr>
            </tbody>
         </table>
         <div class="button-container">
         	<input type="submit" value="Enter Jobs Record Into Database" />
            <input type="reset" value="Clear Data and Results" onclick="javascript:eraseText();" />&nbsp;&nbsp;&nbsp;
         </div>
      </form>
   </div>
    <div class="container">
      <form action="shipmentsForm" method="post">
         <p>Shipments Record Insert</p>
         <table>
            <thead>
               <tr>
                  <th>snum</th>
                  <th>pnum</th>
                  <th>jnum</th>
                  <th>quantity</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><textarea name="s1"></textarea></td>
                  <td><textarea name="s2"></textarea></td>
                  <td><textarea name="s3"></textarea></td>
                  <td><textarea name="s4"></textarea></td>
               </tr>
            </tbody>
         </table>
         <div class="button-container">
       		<input type="submit" value="Enter Shipments Record Into Database" />
            <input type="reset" value="Clear Data and Results" onclick="javascript:eraseText();" />&nbsp;&nbsp;&nbsp;
         </div>
      </form>
   </div>
   <div class="container" style="border: none;">
      <p class="connected-text">Execution Results:</p>
      <table id="data" style="margin: 0 auto; border: 2px solid white;">
      	 <%=message%>
      </table> <!-- Empty HTML table -->
   </div>
</body>
</html>
