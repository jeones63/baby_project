<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="shop.productshop.master.ShopProductDBBean" %>
<%@ page import="shop.productshop.master.ShopProductDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Business Casual - Start Bootstrap Theme</title>

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

<style>
	.sticky {
	  position: fixed; z-index: 1;
	  top: 0;
	  width: 100%
	  
	}
</style>

</head>

<body onscroll="myFunction()">
	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-pink"> <!-- fixed-top" id="mainNav" -->
      <div class="container">
        <!-- <a class="navbar-brand" href="index.html">AGASHOP</a> -->
        <img src="../module/babyshop_bg.jpg" border="0" width="100" height="50" onclick="location.href='shopMain.jsp'">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <jsp:include page="../module/top.jsp" flush="false"/>
      </div>
    </nav>

	<div
		class="tagline-upper text-center text-heading text-shadow text-black mt-5 d-none d-lg-block">AgaShop
		Shopping</div>
	<div
		class="tagline-lower text-center text-expanded text-shadow text-uppercase text-black mb-5 d-none d-lg-block">since
		2017.10.25 | 대구광역시 중구 아앙로 135 | 053.123.4567</div>

	<!-- Navigation -->
	<div id="navbar">
	<nav class="navbar navbar-expand-lg navbar-light bg-pink py-lg-4">
		<div class="container">
			<a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
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
	</div>

	<%
	String product_kind = request.getParameter("product_kind");
	
	List<ShopProductDataBean> productLists = null;
	ShopProductDataBean productList = null;
	String product_kindName="";
	
	ShopProductDBBean productProcess = ShopProductDBBean.getInstance();
	productLists = productProcess.getProducts(product_kind);
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
	} else if(product_kind.equals("all")) {
		product_kindName="전체";
	}
	%>
	<br>
	
<div class="container">	
	
	<h4 class="my-4"><%=product_kindName %>분류의 목록
        <small><a href="shopMain.jsp">메인으로</a></small>
    </h4>
	
	<div class="row">
	<%
	for(int i=0; i<productLists.size(); i++) {
		productList = (ShopProductDataBean)productLists.get(i);
	%>
	<div  class="card h-100" style="margin: 5px">
		<table align="center">
		<tr height="50">
			<td rowspan="4" width="100">
				<a href="productContent.jsp?product_id=<%=productList.getProduct_id() %>&product_kind=<%=product_kind %>">
					<img src="../../imageFile/<%=productList.getProduct_image() %>" border="0" width="100" height="120"></a></td>
			<td width="350"><font size="+1"><b>
				<a href="productContent.jsp?product_id=<%=productList.getProduct_id() %>&product_kind=<%=product_kind %>">
				<%=productList.getProduct_title() %></a></b></font></td>
			<td rowspan="4" width="100" align="center" valign="middle">
			<%if(productList.getProduct_count()==0) {%>
				<font color="red"><b>일시품절</b></font>
			<%} else {%>
				<font color="blue"><b>구매 가능</b></font>
			<%} %>
			</td>
		</tr>
		<tr height="30">
			<td width="350">브랜드: <%=productList.getBrand() %></td>
		</tr>
		<tr height="30">
			<td width="350">정가:
			<%=NumberFormat.getInstance().format(productList.getProduct_price()) %><br>
				판매가: <b><font color="red">
			
			<%=NumberFormat.getInstance().format(
					(int)(productList.getProduct_price()*(
							(double)(100-productList.getDiscount_rate())/100))) %>
			</font></b></td>
		</tr>
		</table>
	</div>
	<br>
	<%}	%>
	</div>
</div>

  <script>
	var navbar = document.getElementById("navbar");
	var sticky = navbar.offsetTop;
	
	function myFunction() {
	  if (window.pageYOffset >= sticky) {
	    navbar.classList.add("sticky")
	  } else {
	    navbar.classList.remove("sticky");
	  }
	}
  </script> 

</body>

</html>
