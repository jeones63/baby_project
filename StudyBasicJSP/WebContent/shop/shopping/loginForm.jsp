<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="container">
		<section id="content">
			<form action="loginPro.jsp" method="post">
				<h1>Login</h1>
				<div>
					<input type="text" placeholder="Username" required="" 
						name="id" id="username" />
				</div>
				<div>
					<input type="password" placeholder="Password" required=""
						name="passwd" id="password" />
				</div>
				<div>
					<input type="submit" value="Log in" />
					<input type="reset" value="Reset">
				</div>
			</form>
			<!-- form -->
			
		</section>
		<!-- content -->
	</div>
	<!-- container -->
</body>
</html>