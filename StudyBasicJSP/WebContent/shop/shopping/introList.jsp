<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.productshop.master.ShopProductDBBean" %>
<%@ page import="shop.productshop.master.ShopProductDataBean" %>
<%@ page import="java.text.NumberFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">

</head>
<body>
<br><br>
<h3 align="center">상품 소개</h3>

<%
ShopProductDataBean[] productLists = null;
int number = 0;
String product_kindName = "";

ShopProductDBBean productProcess = ShopProductDBBean.getInstance();
for(int i=1; i<=5; i++) {
	productLists = productProcess.getProducts(i+"00", 4);
	
	if(productLists[0].getProduct_kind().equals("100")) {
		product_kindName = "젖병/젖꼭지";
	} else if(productLists[0].getProduct_kind().equals("200")) {
		product_kindName = "노리개/치발기";
	} else if(productLists[0].getProduct_kind().equals("300")) {
		product_kindName = "빨대컵/유아컵";
	} else if(productLists[0].getProduct_kind().equals("400")) {
		product_kindName = "치약/칫솔";
	} else if(productLists[0].getProduct_kind().equals("500")) {
		product_kindName = "이유용품";
	}
%>
<hr>

<!-- Page Content -->
<div class="container">

      <!-- 신제품 목록 -->
      <h4 class="my-4"><%=product_kindName %>분류의 신상품 목록:
        <small><a href="list.jsp?product_kind=<%=productLists[0].getProduct_kind() %>">더보기</a></small>
      </h4>
      
      <div class="row">
      <%
		for(int j=0; j<productLists.length; j++) {
	  %>
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="productContent.jsp?product_id=<%=productLists[j].getProduct_id() %>&product_kind=<%=productLists[0].getProduct_kind() %>">
            	<img class="card-img-top" src="../../imageFile/<%=productLists[j].getProduct_image() %>" alt="" width="700" height="150">
            </a>
            <div class="card-body">
              <h6 class="card-title">
                <a href="productContent.jsp?product_id=<%=productLists[j].getProduct_id() %>&product_kind=<%=productLists[0].getProduct_kind() %>"><%=productLists[j].getProduct_title() %></a>
              </h6>
              <p class="card-text">
              	정가 : <%=NumberFormat.getInstance().format(productLists[j].getProduct_price()) %>원<br>
				판매가 : <b><font color="red" size="5">
				<%=NumberFormat.getInstance().format((int)(productLists[j].getProduct_price()*(
				(double)(100-productLists[j].getDiscount_rate())/100))) %>
				</font></b>원
			</p>
            </div>
          </div>
        </div>
        <%
		}
        %>
      </div>
 </div>
 <%
 }%>
 <hr>
</body>
</html>