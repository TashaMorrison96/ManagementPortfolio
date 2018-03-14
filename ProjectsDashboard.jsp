<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 21-Jan-2018, 15:08:07
    Author     : Tasha
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <li><a href="index.jsp"><h1>Management Portfolio</h1></a></li>
        
        <!--Gantt Chart-->
         <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">
              google.charts.load('current', {'packages':['gantt']});
              google.charts.setOnLoadCallback(drawChart);

              function drawChart() {

                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Project ID');
                data.addColumn('string', 'Task Name');
                data.addColumn('string', 'Resource');
                data.addColumn('date', 'Start Date');
                data.addColumn('date', 'End Date');
                data.addColumn('number', 'Duration');
                data.addColumn('number', 'Percent Complete');
                data.addColumn('string', 'Dependencies');

                data.addRows([
                  ['Project 1', 'Project 1', 'Team 1',
                   new Date(2018, 1, 1), new Date(2018, 1, 15), null, 100, null],
                  ['Project 2', 'Project 2', 'Team 1',
                   new Date(2017, 12, 11), new Date(2018, 1, 31), null, 33, null],
                  ['Project 3', 'Project 3', 'Team 2',
                   new Date(2018, 2, 21), new Date(2018, 3, 31), null, 0, null],
                  ['Project 4', 'Project 4', 'Team 1',
                   new Date(2018, 1, 8), new Date(2018, 2, 5), null, 0, null],
                  ['Project 5', 'Project 5', 'Team 3',
                   new Date(2018, 1, 29), new Date(2018, 2, 26), null, 0, null],
                ]);

                var options = {
                  width: 400,
                  height: 200,
                  gantt: {
                    trackHeight: 30
                  }
                };

                var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

                chart.draw(data, options);
              }
            <!--Pie Charts-->
            // Load Charts and the corechart package.
            google.charts.load('current', {'packages':['corechart']});

            // Draw the pie chart for Sarah's pizza when Charts is loaded.
            google.charts.setOnLoadCallback(drawRiskChart);

            // Draw the pie chart for the Anthony's pizza when Charts is loaded.
            google.charts.setOnLoadCallback(drawResourceChart);
            google.charts.setOnLoadCallback(drawBudgetChart);

            // Callback that draws the Risk's Pie Chart
            function drawRiskChart() {

              // Create the data table for Sarah's pizza.
              var data = new google.visualization.DataTable();
              data.addColumn('string', 'Status');
              data.addColumn('number', 'Projects');
              data.addRows([
                ['Completed', 1],
                ['In Progress', 2],
                ['Not Started', 2]
              ]);

              // Set options for Sarah's pie chart.
              var options = {title:'Risk',
                             width:300,
                             height:300};

              // Instantiate and draw the Risk Pie Chart
              var chart = new google.visualization.PieChart(document.getElementById('Risk_chart_div'));
              chart.draw(data, options);
            }

            <!--Callback that draws the Resource Pie Chart-->
            function drawResourceChart() {

              // Create the data table for Resource Pie Chart
              var data = new google.visualization.DataTable();
              data.addColumn('string', 'Team');
              data.addColumn('number', 'Projects');
              data.addRows([
                ['Team 1', 3],
                ['Team 2', 1],
                ['Team 3', 1]
              ]);

              var options = {title:'Resource',
                             width:300,
                             height:300};

              <!--Instantiate and draw the Resource Pie Chart-->
              var chart = new google.visualization.PieChart(document.getElementById('Resource_chart_div'));
              chart.draw(data, options);
            }
            
            
            function drawBudgetChart() {

              <!--Data for Budget Pie Chart-->
              var data = new google.visualization.DataTable();
              data.addColumn('string', 'Project');
              data.addColumn('number', 'Budget');
              data.addRows([
                ['Project 1', 100],
                ['Project 2', 500],
                ['Project 3', 8000],
                ['Project 4', 750],
                ['Project 5', 5000]
              ]);
              
              var options = {title:'Budget',
                             width:300,
                             height:300};

              <!--Instantiate and draw the Budget Pie Chart-->
              var chart = new google.visualization.PieChart(document.getElementById('Budget_chart_div'));
              chart.draw(data, options);
            }
            </script>
        
    </head>
    
    
    <body>
        <!--Team Sign In Button - Source: https://www.w3schools.com/howto/howto_css_login_form.asp with amendments by 1400580-->    
        <p align="right"><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Team Sign In</button></P>  

                <div id="id01" class="modal">

                  <form class="modal-content animate" action="/action_page.php">
                    <div class="imgcontainer">
                      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                    </div>

                    <div class="container">
                      <label><b>Team</b></label>
                      <input type="text" placeholder="Enter Username" name="uname" required>

                      <label><b>Password</b></label>
                      <input type="password" placeholder="Enter Password" name="psw" required>

                      <button type="submit">Login</button>
                      <label>
                        <input type="checkbox" checked="checked"> Remember me
                      </label>
                    </div>

                    <div class="container" style="background-color:#f1f1f1">
                      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                      <span class="psw">Forgot <a href="#">password?</a></span>
                    </div>
                  </form>
                </div>

                <script>
                <!--Get the modal-->
                var modal = document.getElementById('id01');

                <!--When the user clicks anywhere outside of the modal, close it-->
                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
                </script>

            
            <ul>    <!--Navigation Bar-->
                <li><a href="KPIDashboard.jsp">KPI Dashboard</a></li>
                <li><a href="ProjectsDashboard.jsp">Projects Dashboard</a></li>
            </ul>
               
                <!--Table and divs that hold the pie charts-->
                <table class="columns">
                  <tr>
                    <td><div id="chart_div"></div></td> <!--Gantt Chart Source: https://developers.google.com/chart/interactive/docs/gallery/ganttchart with amendments by 1400580-->
                    <td><div id="Risk_chart_div"></div></td>
                    <td><div id="Resource_chart_div"></div></td>
                    <td><div id="Budget_chart_div"></div></td>
                  </tr>
                </table>
           
        <!--Project_Management Database Table -->
        <table class="columns">
        <tr>
        <td>
        <TABLE BORDER=1 BGCOLOR=#ffffff CELLSPACING=0><FONT FACE="Calibri" COLOR=#000000></FONT>

            <THEAD>
                <TR>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project_ID</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application_Name</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Issue_Log</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project_Name</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Complete</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Start Date</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>End Date</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Status</FONT></TH>

                </TR>
            </THEAD>
                <TBODY>
                    <TR VALIGN=TOP>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>1</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 1</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Issue 1, 2, 3</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project 1</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Yes</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>01/01/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>15/01/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Completed</FONT></TD>

                    </TR>

                <TR VALIGN=TOP>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>2</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 2</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Issue, 1, 2, 3, 4, 5, 6, 7</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project 2</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>No</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>11/12/2017</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>31/01/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>In Progress</FONT></TD>

                </TR>

                <TR VALIGN=TOP>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>3</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 3</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Issue 1, 2</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project 3</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>No</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>05/02/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>31/03/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Not Started</FONT></TD>

                </TR>

                <TR VALIGN=TOP>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>4</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 4</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Issue 1, 2, 3</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project 4</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>No</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>08/01/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>05/02/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>In Progress</FONT></TD>

                </TR>

                <TR VALIGN=TOP>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>5</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 5</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>No Issues Logged</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project 5</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>No</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>29/01/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>26/02/2018</FONT></TD>
                        <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Not Started</FONT></TD>

                </TR>
                
            </TBODY>
                <TFOOT></TFOOT>
        </TABLE>
        </td>
        <td><div id="Budget_chart_div"></div></td>
        </tr>
        </table>
        <!--User inputs into table-->       
        <table>
            <form action="/action_page.php">
                <thead>
                    <tr>
                        <th BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project_ID</FONT></th>
                        <th BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application_Name</FONT></th>
                        <th BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Issue_Log</FONT></th>
                        <th BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Project_Name</FONT></th>
                        <th BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Complete</FONT></th>
                        <th BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Start Date</FONT></th>
                        <th BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>End Date</FONT></th>
                        <th BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Status</FONT></th>

                    </tr>
                </thead>
                <tbody>
                    <tr VALIGN=TOP>
                        <th><input type="text" name="Project_ID" value="6"></th>
                        <th><input type="text" name="Application_Name" value=""></th>
                        <th><input type="text" name="Issue_Log" value=""></th>
                        <th><input type="text" name="Project_Name" value=""></th>
                        <th><input type="text" name="Complete" value=""></th>
                        <th><input type="text" name="Start Date" value=""></th>
                        <th><input type="text" name="End Date" value=""></th>
                        <th><input type="text" name="Status" value=""></th>
                        <th><input type="submit" value="Submit"></th>
                    </tr>

                </tbody>
            </form>
        </table>
                
    </body>  

</html>
