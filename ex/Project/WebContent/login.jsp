<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=devide-width, initial-scal=1"> 
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	<title>로그인</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
<div class="text-center" style="padding:50px 0">
	<div class="logo">login</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form id="login-form" class="text-left" action="login.do" method = "post">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="ID" class="sr-only">ID</label>
						<input type="text" class="form-control" id="ID" name="ID" placeholder="ID">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="password">
					</div>
				</div>
				<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
		</form>
	</div>
</div>
</body>
</html>