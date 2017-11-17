<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="shop.productshop.shopping.CustomerDataBean" %>
<%@ page import="shop.productshop.shopping.CustomerDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
Timestamp reg_date = new Timestamp(System.currentTimeMillis());
String address = request.getParameter("address");
String tel = request.getParameter("tel");

CustomerDataBean member = new CustomerDataBean();
member.setId(id);
member.setPasswd(passwd);
member.setName(name);
member.setReg_date(reg_date);
member.setAddress(address);
member.setTel(tel);

CustomerDBBean memberProcess = CustomerDBBean.getInstance();
memberProcess.insertMenber(member);
%>
<script>
	alert("회원가입이 완료되었습니다.");
	location.href="shopMain.jsp";
</script>
</body>
</html>