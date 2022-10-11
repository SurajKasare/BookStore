<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<style>
table, th {
  border: 3px solid black;
  border-collapse: collapse;
  width: 1000px;
  padding: 15px;
  background-color: orange;
}
td {
  border: 2px solid black;
  border-collapse: collapse;
  padding: 11px;
  background-color: silver;	
}
</style>
</head>
<body style="background:graytext;">

	<h1 style="text-align: center;color:silver;">
	<marquee scrollamount="30" behavior="alternate">&emsp;&emsp;Welcome!&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	&emsp;Welcome!&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Welcome!&emsp;&emsp;</marquee>
	</h1>
	
	<h1 style="text-align: center;color:maroon;background-color: white;">
	<font size="20">SHOPPING&ensp;CART&ensp;FOR&ensp;BOOK&ensp;STORE</font></h1>
	
	<br><br><br>
	<center>
	<table>
		<tr>
			<th><font size="5" face="comic sans ms">Book Name</font></th>
			<th><font size="5" face="comic sans ms">Author</font></th>
			<th><font size="5" face="comic sans ms">Price</font></th>
		</tr>	
	
			<%
			try
			{
				ResultSet rs=(ResultSet)session.getAttribute("rs");
				System.out.println("Data in WelcomePage.jsp");
				
				while(rs.next())
				{
			%>
				<tr>
					<td><font size="4" face="comic sans ms"><a href="Book.jsp?BKID=<%=rs.getString("Book_Id")%>"><%=rs.getString("Book_Name")%></<font></font></a></td>
					<td><font size="4" face="comic sans ms"><%=rs.getString("Author")%></font></td>
					<td><font size="4" face="comic sans ms"><%=rs.getString("Price")%><% out.print("/-"); %></font></td>
				</tr>
			<%
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
				
			%>
	</table>
	</center>
	<br><br><br><br><br><br>
</body>
</html>