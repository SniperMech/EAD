<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
sales display = (sales)request.getAttribute("monthSales");
sales display2 = (sales)request.getAttribute("monthSales2");
%>

	<script type="text/javascript">
		window.onload = function () {
			var chart = new CanvasJS.Chart("chartContainer", {
				title: {
					text: "Monthly Sales Report Between <%=display.getDate()%> and <%=display2.getDate()%>"
				},
				data: [{
					type: "column",
					dataPoints: [
					  { label: "<%=display.getDate()%>" , y: <%=display.getCost() %>, indexLabel: "Cost" },
					  { label: "<%=display2.getDate()%>" , y: <%=display2.getCost() %>, indexLabel: "Cost" },
					]
				}, {
					type: "column",
					dataPoints: [
					  { label: "<%=display.getDate()%>" , y: <%=display.getRevenue() %>, indexLabel: "Revenue" },
					  { label: "<%=display2.getDate()%>" , y: <%=display2.getRevenue() %>, indexLabel: "Revenue" },
					]
				}, {
					type: "column",
					dataPoints: [
					  { label: "<%=display.getDate()%>" , y: <%=display.getProfit() %>, indexLabel: "Profit" },
					  { label: "<%=display2.getDate()%>" , y: <%=display2.getProfit() %>, indexLabel: "Profit" },
					]
				}]
			});
			chart.render();
		}
	</script>
	<script src="canvasjs.min.js"></script>
	<title>CanvasJS Example</title> 
</head>
</head>
<body>

<div id="chartContainer" style="height: 400px; width: 100%;"></div>

<h2>Sales for <%=display.getDate() %></h2>

<p>The initial cost for this month is <%=display.getCost() %> </p>

<p>The revenue generated for this month is <%=display.getRevenue() %> </p>

<p>Hence the evaluated profit is <%=display.getRevenue() %> - <%=display.getCost() %> = "<%=display.getProfit() %>"</p>



<h2>Sales for <%=display2.getDate() %></h2>

<p>The initial cost for this month is <%=display2.getCost() %> </p>

<p>The revenue generated for this month is <%=display2.getRevenue() %> </p>

<p>Hence the evaluated profit is <%=display2.getRevenue() %> - <%=display2.getCost() %> = "<%=display2.getProfit() %>"</p>

</body>
</html>