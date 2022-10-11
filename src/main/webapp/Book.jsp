<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			String bkid=request.getParameter("BKID");
			System.out.println("Clickable Book Id in Book.jsp"+bkid);
			
			session.setAttribute("bid", bkid);
			
			response.sendRedirect("./PurchaseServlet");
		%>
</body>
</html>