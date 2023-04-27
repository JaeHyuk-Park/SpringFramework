<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
</head>
<style>
	input[value="로그아웃"]{
		margin-top : 30px;
		margin-bottom: 30px;
	}
</style>
<body>
	<form>
		<input type="button" value="로그아웃" onclick="location.href='/SpringFrame/logout'">
	</form>
	<%= (String)session.getAttribute("nickname") %>님 환영합니다.
</body>
</html>