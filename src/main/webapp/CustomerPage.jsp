<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Details</title>
<style type="text/css">
table, th {
  border: 1px solid black;
  border-collapse: collapse;
  width: 600px;
  padding: 10px;
  background-color: orange;
}
td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 8px;
  background-color: silver;	
}
</style>
</head>
<body style="background:graytext; "><br><br>

		<h1 style="text-align: center;background-color: white; color: red">SHOPPING&ensp;CART&ensp;FOR&ensp;BOOK&ensp;STORE</h1>
	
	<center><fieldset style="width:60%; color: white;">
	<legend>Enter Your Details</legend>
	
		<form action="./CustomerRegistration"><font size="4">
				
				Customer Name :&ensp;<input type="text" name="Cust_Name"><br><br>
				Address :&ensp;<textarea name="Address"></textarea><br><br>
				Phone No. :&ensp;<input type="tel" name="Phone_No"><br><br>
				Order Date :&ensp;<input type="date" name="Date"><br><br>
				
				Your Order Details are:
				</font>
					<table>
						<tr>
							<th><font color="black" face="comic sans ms">Book Name</font></th>
							<th><font color="black" face="comic sans ms">Author</font></th>
							<th><font color="black" face="comic sans ms">Price</font></th>
							<th><font color="black" face="comic sans ms">Quantity</font></th>
							<th><font color="black" face="comic sans ms">Total Price</font></th>
						</tr>
						
						<%
						try
						{
								ResultSet rs=(ResultSet)session.getAttribute("rs2");
								String Qty=(String)session.getAttribute("Qty");
								int qty=Integer.parseInt(Qty);
								
								while(rs.next())
								{
									int price=rs.getInt("Price");
						%>
							<tr>
								<td><font color="black" face="comic sans ms"><%=rs.getString("Book_Name")%></font></td>
								<td><font color="black" face="comic sans ms"><%=rs.getString("Author")%></font></td>
								<td><font color="black" face="comic sans ms"><%=rs.getInt("Price")%><% out.print("/-"); %></font></td>
								<td><font color="black" face="comic sans ms"><%=qty %></font></td>
								<td><font color="maroon" face="comic sans ms"><%=price*qty %><% out.print("/-"); %></font></td>
							</tr>
						<%
								}
						}
						catch(Exception e){
							e.printStackTrace();
						}
						%>
					</table>
				
					<input type="submit" value="Confirm">
					<input type="reset" value="Clear">
		</form>			
						
						<form action="Index.jsp">
							<input type="submit" value="Cancel">
						</form>
										
				
	</fieldset></center>	
</body>
</html>