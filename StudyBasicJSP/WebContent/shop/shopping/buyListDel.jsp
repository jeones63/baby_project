<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.productshop.shopping.BuyDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매삭제 처리</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<%
String[] product_id = request.getParameterValues("list");
BuyDBBean buyprocess = BuyDBBean.getInstance();

for(int i=0; i<product_id.length; i++) {
	buyprocess.deleteBuy(product_id[i]); 
}

response.sendRedirect("buyList.jsp");
%>
</body>
</html>