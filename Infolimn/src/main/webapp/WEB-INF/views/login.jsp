<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pictter: Login</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/styles/bootstrap.min.css">
<link href="resources/styles/main.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="resources/images/pictter_icon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
body {
	font-style: calibri;
}
</style>
</head>
<body>
	<!-----start-main---->
	<div class="main">
		<div class="login-form">
			<div class="head">
				<img src="resources/images/pictter_logo.png" alt="Pictter-Icon">
			</div>
			<form action="javascript:openHomePage();">
				<input type="text" class="text" value="USERNAME"
					onfocus="this.value = &#39;&#39;;"
					onblur="if (this.value == &#39;&#39;) {this.value = &#39;USERNAME&#39;;}">
				<input type="password" value="Password"
					onfocus="this.value = &#39;&#39;;"
					onblur="if (this.value == &#39;&#39;) {this.value = &#39;Password&#39;;}">
				<div class="submit">
					<input type="submit" value="LOGIN">
				</div>
				<p>
					<a href="#">Forgot Password ?</a>
				</p>
			</form>
		</div>
		<!--//End-login-form-->
	</div>
</body>
<script src="resources/scripts/jquery-1.11.3.min.js"></script>
<script src="resources/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/scripts/main.js"></script>

</html>
