<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="css/Login.css">
		<title>Login</title>
	</head>
	<body>
		<div id="topOfPage">
		<a href="https://www.usc.edu/">
			<img src="http://parents.usc.edu/wp-content/themes/usc-communications-parents/images/usc_logo.svg"/>
		</a>
		</div>
		<div id="centerOfPage">
			<form name = "login" method = "GET" action = "LoginValidation">
				Name(use your USC email):<br><input type = "text" id="username" name = "username" value ="required"><label id="loginError"></label><br>
				Password:<br><input type = "password" id="password" name = "password" value = "required"><br><br>
				<button type = "submit" id="loginButton" name="loginButton"><span>Login</span></button>
			</form>
		</div>
		<div id="bottomOfPage"></div>
	</body>
	<script> 
		document.getElementById("loginError").innerHTML = "${requestScope.error}";
		document.getElementById("username").value = "${requestScope.username}";
		document.getElementById("password").value = "${requestScope.password}";
	</script>
</html>