<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Page</title>
</head>
<body style="background:graytext; "><br><br>

	<h1 style="text-align: center;background-color: white; color: maroon;">PURCHASE&ensp;SECTION&ensp;</h1>
	
	<center><fieldset style="width:60%; color: white;">
	<legend>Purchase Your Book</legend>
	
	<form action="./CustomerServlet"><font size="4">
		<%
			ResultSet rs=(ResultSet)session.getAttribute("rs1");
			
			while(rs.next())
			{
		%>
			Book Name:&ensp;<font color="yellow" face="comic sans ms"><%=rs.getString("Book_Name")%></font><br>
			Author:&ensp;<font color="yellow" face="comic sans ms"><%=rs.getString("Author")%></font><br>
			Price:&ensp;<font color="yellow" face="comic sans ms"><%=rs.getInt("Price")%><% out.print("/-"); %></font><br>
		<%		
			}
		%>
		<br>
			Quantity:&ensp;<input type="text" name="Qty"><br>
				<input type="submit" value="Purchase">
	</font></form>
					
			<form action="Index.jsp"><input type="submit" value="Cancel"></form>
	
	</fieldset></center>
</body>
</html>