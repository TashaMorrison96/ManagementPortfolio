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
        <link rel="stylesheet" type="text/css" href="style.css">
        <li><a href="index.jsp"><h1>Management Portfolio</h1></a></li>
        
        
        <!--Pie Chart Container-->
        <!--Source: https://developers.google.com/chart/interactive/docs/basic_multiple_charts amended by 1400580-->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">

            // Load Charts and the corechart and barchart packages.
            google.charts.load('current', {'packages':['corechart']});
            google.charts.load('current', {'packages':['gantt']});

            // Draw the pie chart and bar chart when Charts is loaded.
            google.charts.setOnLoadCallback(drawChart1);
            google.charts.setOnLoadCallback(drawStatusChart);
            google.charts.setOnLoadCallback(drawSLAChart);
            google.charts.setOnLoadCallback(drawTeamTicketsChart);
            
            
            <!--Gantt Chart from Projects Dashboard-->
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
                  height: 200,
                  gantt: {
                    trackHeight: 30
                  }
                };

                var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

                chart.draw(data, options);
              }
            
            <!--Pie and Bar Chart-->
            function drawChart1() {

              var data = new google.visualization.DataTable();
              data.addColumn('string', 'Priority');
              data.addColumn('number', 'Ticket');
              data.addRows([
                ['Low', 2],
                ['Normal', 2],
                ['High', 1],
                ['Urgent', 0]
              ]);

              var piechart_options = {title:'Tickets',
                             width:400,
                             height:200};
              var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
              piechart.draw(data, piechart_options);

              var barchart_options = {title:'Ticket Priority',
                             width:400,
                             height:200,
                             legend: 'none'};
              var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
              barchart.draw(data, barchart_options);
            }
           
            <!--Additional Pie Charts-->
            // Callback that draws the Status Pie Chart
            function drawStatusChart() 
            {

              // Create the data table 
              var data = new google.visualization.DataTable();
              data.addColumn('string', 'Status');
              data.addColumn('number', 'Tickets');
              data.addRows([
                ['Completed', 1],
                ['In Progress', 2],
                ['Not Started', 2]
              ]);

              // Set options
              var options = {title:'Status',
                             width:400,
                             height:200};

              // Instantiate and draw the Status Pie Chart
              var chart = new google.visualization.PieChart(document.getElementById('Status_chart_div'));
              chart.draw(data, options);
            }

            <!--Callback that draws the SLA Pie Chart-->
            function drawSLAChart() {

              // Create the data table for SLA Pie Chart
              var data = new google.visualization.DataTable();
              data.addColumn('string', 'SLA');
              data.addColumn('number', 'Tickets');
              data.addRows([
                ['SLA', 3],
                ['Out of SLA', 2]
              ]);

              var options = {title:'SLA',
                             width:400,
                             height:200};

              <!--Instantiate and draw the SLA Pie Chart-->
              var chart = new google.visualization.PieChart(document.getElementById('SLA_chart_div'));
              chart.draw(data, options);
            }
            
             //Team SLA Pie Chart
            function drawTeamTicketsChart() {

              var data = new google.visualization.DataTable();
              data.addColumn('string', 'Team');
              data.addColumn('number', 'Tickets');
              data.addRows([
                ['Team 1', 3],
                ['Team 2', 1],
                ['Team 3', 1]
              ]);
              
              var options = {title:'Team SLA',
                             width:400,
                             height:200};

              <!--Instantiate and draw the Team SLA Pie Chart-->
              var chart = new google.visualization.PieChart(document.getElementById('TeamTickets_chart_div'));
              chart.draw(data, options);
            }
            
        </script>
                   
    </head>
      
            
    <body>
        
        <p align="left">
        
        <p align="right"><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Team Sign In</button></p>  <!--Team Sign In Button-->

                <div id="id01" class="modal">

                  <form class="modal-content animate" action="/action_page.php">
                    <div class="imgcontainer">
                      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                    </div>

                    <div class="container">
                      <label><b>Username</b></label>
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
                // Get the modal
                var modal = document.getElementById('id01');

                // When the user clicks anywhere outside of the modal, close it
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
        
        <!--Search Bar-->       
        <input width="20px" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for applications..">
        
      
 
        <!--Filter Table-->
        <script>    <!--Source: https://www.w3schools.com/howto/howto_js_filter_table.asp with amendments by 1400580-->
            function myFunction() {
              // Declare variables 
              var input, filter, table, tr, td, i;
              input = document.getElementById("myInput");
              filter = input.value.toUpperCase();
              table = document.getElementById("myTable");
              tr = table.getElementsByTagName("tr");

              // Loop through all table rows, and hide those who don't match the search query
              for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                  } else {
                    tr[i].style.display = "none";
                  }
                } 
              }
            }
        </script>
        
        
        <!--Rectangle showing snapshot of Projects Dashboard-->
        <!--<p align="left"><svg width="400" height="180">
            <rect x="50" y="20" rx="20" ry="20" width="500" height="250"
            style="fill:#e0ffff;stroke:black;stroke-width:5;opacity:0.5" />
            </svg></p>-->
        
        
        <!--Multiple Pie Charts-->
        <!--Table and divs that hold the charts Source: https://developers.google.com/chart/interactive/docs/basic_multiple_charts-->
        <table class="columns">
          <tr>
            <!--Projects Gantt Chart-->
            <td><div id="chart_div" style="border: 10px solid #e0ffff"></div></td>
            <!--KPI Visualisations-->
            <td><div id="piechart_div"></div></td>
            <td><div id="barchart_div"></div></td>
          </tr>
        </table>
          
        
        <!--Additional Pie Charts-->          
        <table class="columns">
          <tr>
            <td><div id="Status_chart_div"></div></td>
            <td><div id="SLA_chart_div"></div></td>
            <td><div id="TeamTickets_chart_div"></div></td>
          </tr>
        </table>
                  
        
        <!--Table-->
        <TABLE id="myTable" BORDER=1 BGCOLOR=#ffffff CELLSPACING=0><FONT FACE="Calibri" COLOR=#000000></FONT>

            <THEAD>
                <TR>
                    
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Ticket_ID</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Summary</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Description</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Start Date</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>End Date</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>SLA Met</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Analyst</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Resolving_Agency</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Status</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Priority</FONT></TH>
                    <TH BGCOLOR=#e0ffff BORDERCOLOR=#000000 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Subcode</FONT></TH>

                </TR>
            </THEAD>
            
            <TBODY>
                <TR VALIGN=TOP>
                    
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 1</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>1</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Summary 1</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Description 1</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>22/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>31/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Yes</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Analyst 2</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Team 3</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Completed</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>(3) Low</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Subcode 5</FONT></TD>

                </TR>

                <TR VALIGN=TOP>
                    
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 5</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>2</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Summary 2</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Description 2</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>20/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>27/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>No</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Analyst 3</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Team 1</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>In Progress</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>(2) Normal</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Subcode 2</FONT></TD>

                </TR>

                <TR VALIGN=TOP>
                    
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 2</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>3</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Summary 3</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Description 3</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>15/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>29/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Yes</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Analyst 1</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Team 1</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Completed</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>(3) Low</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Subcode 1</FONT></TD>

                </TR>

                <TR VALIGN=TOP>
                    
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 4</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>4</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Summary 4</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Description 4</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>01/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>05/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>No</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Analyst 3</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Team 1</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Not Started</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>(1) High</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Subcode 2</FONT></TD>

                </TR>

                <TR VALIGN=TOP>
                    
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Application 3</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>5</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Summary 5</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Description 5</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>21/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>25/01/2018</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6  ALIGN=RIGHT><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Yes</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Analyst 4</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Team 2</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Completed</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>(2) Normal</FONT></TD>
                    <TD BORDERCOLOR=#e7e6e6 ><FONT style=FONT-SIZE:11pt FACE="Calibri" COLOR=#000000>Subcode 3</FONT></TD>

                </TR>
            </TBODY>
            <TFOOT></TFOOT>
                
        </TABLE>
    </body>        
</html>
