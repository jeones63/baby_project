<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../etc/color.jspf" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" href="css/style.css">
<style>
	label {
		width: 80px;
		float: left;
		color: #777;
		font-weight: bold;
		margin-bottom: 5px;
	}
</style>
</head>
<body>
<div class="container">
	<section id="content">
		<form action="joinPro.jsp" method="post">
			<h1>Join</h1>
			<div>
				<label for="id">아이디 : </label>
				<input type="text" placeholder="Username" required="" 
					name="id" id="id" />
			</div>
			<div>
				<label for="password">비밀번호 : </label>
				<input type="password" placeholder="Password" required=""
					name="passwd" id="password" />
			</div>
			<div>
				<label for="name">이름 : </label>
				<input type="text" placeholder="Name" required=""
					name="name" id="name" />
			</div>
			<div>
				<label for="tel">연락처 : </label>
				<input type="text" placeholder="Phone" required=""
					name="tel" id="tel" />
			</div>
			<div>
				<label for="address">주소 : </label>
				<input type="text" placeholder="Address" required=""
					name="address" id="address" />
			</div>
			<div>
				<input type="submit" value="Join" />
				<input type="reset" value="Reset">
			</div>
		</form>
		<!-- form -->
		
	</section>
	<!-- content -->
</div>
</body>
</html>