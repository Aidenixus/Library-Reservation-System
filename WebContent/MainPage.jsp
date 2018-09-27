<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Room Reservation - Homepage</title>
		<link rel="stylesheet" href="css/MainPageStyle.css">
	<script type="text/javascript">
		window.onload = function(){
			//var xhttp = new XMLHttpRequest();
			//xhttp.open("POST", "ParseUserInformation", true);
			//xhttp.send();
		}
	</script>
	</head>
	<body>
		<div id="topOfPage" name="topOfPage">
			<a href="https://www.usc.edu/">
				<img src="http://parents.usc.edu/wp-content/themes/usc-communications-parents/images/usc_logo.svg"/>
			</a>
		</div>
		<div id="centerOfPage" name="centerOfPage">
			<h1 id="Title"><span style="color: #900">USC</span> Study Room Notification System</h1>
			<form name="SignUpForm" method="POST" action= "SignUp.jsp">
				<button type="submit" id= "SignUpButton" name = "SignUpButton"><span>Sign Up</span></button> <br /><br />
			</form>
			<form name="LoginForm" method="POST" action="Login.jsp">
				<button type = "submit" id="LoginButton" name="LoginButton"><span>Login</span></button>
			</form>
		</div>
		<div id="bottomOfPage" name="bottomOfPage"></div>
	</body>
</html>