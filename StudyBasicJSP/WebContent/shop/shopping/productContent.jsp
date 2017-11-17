<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.productshop.master.ShopProductDBBean" %>
<%@ page import="shop.productshop.master.ShopProductDataBean" %>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Book Shopping Mall</title>
	
	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom fonts for this template -->
	<link
		href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
		rel="stylesheet" type="text/css">
	<link
		href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
		rel="stylesheet" type="text/css">
	
	<!-- Custom styles for this template -->
	<link href="css/business-casual.css" rel="stylesheet">
	
	<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
	<div
		class="tagline-upper text-center text-heading text-shadow text-black mt-5 d-none d-lg-block">AgaShop
		Shopping</div>
	<div
		class="tagline-lower text-center text-expanded text-shadow text-uppercase text-black mb-5 d-none d-lg-block">since
		2017.10.25 | 대구광역시 중구 아앙로 135 | 053.123.4567</div>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-pink py-lg-4">
		<div class="container">
			<a
				class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
				href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item active px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="shopMain.jsp">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded"
						href="../shopping/list.jsp?product_kind=all">전체목록</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded"
						href="../shopping/list.jsp?product_kind=100">젖병/젖꼭지</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded"
						href="../shopping/list.jsp?product_kind=200">노리개/치발기</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded"
						href="../shopping/list.jsp?product_kind=300">빨대컵/유아컵</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded"
						href="../shopping/list.jsp?product_kind=400">치약/칫솔</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded"
						href="../shopping/list.jsp?product_kind=500">이유용품</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br><br>
<%
String product_kind = request.getParameter("product_kind");
String product_id = request.getParameter("product_id");
String id = "";
int buy_price = 0;
try {
	if(session.getAttribute("id")==null) {
		id = "not";
	} else {
		id = (String)session.getAttribute("id");
	}
} catch(Exception e) {
	
}

ShopProductDataBean productList = null;
String product_kindName="";

ShopProductDBBean productProcess = ShopProductDBBean.getInstance();

productList = productProcess.getProduct(Integer.parseInt(product_id));

if(product_kind.equals("100")) {
	product_kindName="젖병/젖꼭지";
} else if(product_kind.equals("200")) {
	product_kindName="노리개/치발기";
} else if(product_kind.equals("300")) {
	product_kindName="빨대컵/유아컵";
} else if(product_kind.equals("400")) {
	product_kindName="치약/칫솔";
} else if(product_kind.equals("500")) {
	product_kindName="이유용품";
}


//관리자 아이디인지를 확인하기
//관리자가 맞다면 x에 1을 담기
int managerCheck = productProcess.managerLogin(id);
%>
<form name="inform" method="post" action="cartInsert.jsp">
<table align="center">
<tr height="80">
	<td rowspan="4" width="150">
		<img src="../../imageFile/<%=productList.getProduct_image() %>"
		border="0" width="150" height="200"></td>
	<td width="500"><font size="+1">
	<b><%=productList.getProduct_title() %></b></font></td>
</tr>
<tr><td width="500">저자: <%=productList.getBrand() %></td></tr>
<tr><td width="500">정가: 
<%=NumberFormat.getInstance().format(productList.getProduct_price()) %>원<br>
	<%buy_price=(int)(productList.getProduct_price()*(
			(double)(100-productList.getDiscount_rate())/100)); %>
	판매가: <b><font color="red">
	<%=NumberFormat.getInstance().format((int)(buy_price)) %>원	
	</font></b></td></tr>
	<tr><td width="500">수량: <input type="text" size="5" name="buy_count" value="1">개
	<%
	if(id.equals("not")) {
		if(productList.getProduct_count()==0) {
	%>
			<font color="red"><b>일시품절</b></font>
	<%	} else { %>
			<b><font color="red">로그인하시면 구매가능합니다.</font></b>
	<%
		}
	} else if(managerCheck == 1) {
		if(productList.getProduct_count()==0) {
	%>
			<font color="red"><b>일시품절</b></font>
	<%	} else {%>
		<input type="button" value="상품 수정" 
		onclick="javascript:window.location='../manager/productProcess/productUpdateForm.jsp?product_id=<%=product_id %>&product_kind=<%=product_kind %>'">
	<%
		}
	} else {
		if(productList.getProduct_count()==0) {
	%>
			<font color="red"><b>일시품절</b></font>
	<%	} else {%>
		<input type="hidden" name="product_id" value="<%=product_id %>">
		<input type="hidden" name="product_image" value="<%=productList.getProduct_image() %>">
		<input type="hidden" name="product_title" value="<%=productList.getProduct_title() %>">
		<input type="hidden" name="buy_price" value="<%=buy_price %>">
		<input type="hidden" name="product_kind" value="<%=product_kind %>">
		<input type="submit" value="장바구니에 담기">
	<%
		}
	}
	%>
		<input type="button" value="목록으로"
		onclick="javascript:window.location='list.jsp?product_kind=<%=product_kind %>'">
		<input type="button" value="메인으로"
		onclick="javascript:window.location='shopMain.jsp'">
		</td>
	</tr>
	<tr>
		<td colspan="3" align="left" width="300" style="padding: 15px">
			<br><%=productList.getProduct_content() %></td>
	</tr>
</table>
</form>
</body>
</html>