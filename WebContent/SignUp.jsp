<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script>
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="css/SignUp.css">
		<title>Sign up</title>
	</head>
	<body>
		<div id="topOfPage"name="topOfPage">
		<a href="https://www.usc.edu/">
				<img src="http://parents.usc.edu/wp-content/themes/usc-communications-parents/images/usc_logo.svg"/>
			</a>
			</div>
		<div id="centerOfPage"name="centerOfPage">
			<form name = "signupInfo" method = "GET" action ="SignupValidation">
				Email:<br><input type = "email" id="username" name = "username" class="email"> <label class="email" id="usernameError" name="usernameError"></label></br>
				Password:<br><input type = "password" id="password" name = "password" class="password"> <label class="password" id="passwordError" name="passwordError"></label></br>
				Confirm Password:<br><input type="password" id="passwordConfirm" name="passwordConfirm" class="passwordConfirm"> <label class="passwordConfirm" id="passwordMismatch" name="passwordMismatch"></label></br>
				<br>
				<input type = "submit" id = "signupButton" name = "submit" value = "Sign Up" onsubmit = "ValidFields()">
			</form>
		</div>
		<div id="bottomOfPage"name="bottomOfPage"></div>
	</body>
	<script>
		document.getElementById("usernameError").innerHTML = "${requestScope.usernameTaken}";
		document.getElementById("passwordMismatch").innerHTML = "${requestScope.diffPw}";
		document.getElementById("username").value = "${requestScope.username}";
		document.getElementById("password").value = "${requestScope.password}";
		document.getElementById("passwordConfirm").value = "${requestScope.passwordConfirm}";
	</script>
</html>