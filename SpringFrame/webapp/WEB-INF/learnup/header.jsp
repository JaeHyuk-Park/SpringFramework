<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<style>
body {
	margin: 0;
	overflow-x: hidden;
}
div#head{
	width:400px;
	margin : 20px auto;
	text-align: center;
}
</style>
<body>
	<div id="head">
	<form>
		<input type="button" value="로그아웃" onclick="location.href='/SpringFrame/logout'">
	</form><br>
	<%= (String)session.getAttribute("nickname") %>님 환영합니다.
	</div>
</body>
</html>