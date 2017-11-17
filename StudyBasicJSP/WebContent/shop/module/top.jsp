<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.productshop.shopping.CustomerDBBean"%>
<%@ page import="shop.productshop.shopping.CustomerDataBean"%>
<%@ page import="shop.productshop.master.*" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품분류 메뉴</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.nav-link {
		color: white;
	}
</style>
</head>
<body bgcolor="<%=bodyback_c %>">
<%
try {
	if(session.getAttribute("id") == null) {
%>
		<header>
			<div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link" href="loginForm.jsp">로그인</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="joinForm.jsp">회원가입</a>
	            </li>
	          </ul>
	        </div>
	        <font color="red">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.</font>
<%
	} else {
		String id = (String)session.getAttribute("id");
		
		ShopProductDBBean managerProcess = ShopProductDBBean.getInstance();
		int check = managerProcess.managerLogin(id);
		
		if(check == 1) {
			//관리자 메뉴
%>
			<div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link" href="logout.jsp">로그아웃</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="../manager/managerMain.jsp">상품관리</a>
	            </li>
	          </ul>
	          <font color="white"><b>관리자 <font color="red"><%=id %></font>님 접속중입니다.</b></font>
	        </div>
<%
		} else {
			CustomerDBBean memberProcess = CustomerDBBean.getInstance();
			CustomerDataBean member = memberProcess.getMember(id);
%>
			<div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link" href="logout.jsp">로그아웃</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="cartList.jsp?product_kind=all">장바구니</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="buyList.jsp">구매목록</a>
	            </li>
	          </ul>
	        </div>
	        <font color="blue"><b><%=member.getName() %></b>님, 즐거운 쇼핑시간이 되세요.</font>
<%
		}
	}
%>
</header>
<%
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>