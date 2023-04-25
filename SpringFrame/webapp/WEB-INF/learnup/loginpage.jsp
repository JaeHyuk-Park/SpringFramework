<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<script>
	var error = "${param.error}";
	if (error == "email") {
		alert("존재하지 않는 아이디입니다. 다시 시도해주세요.");
	}if(error == "password"){
		alert("비밀번호를 확인해주세요.");
	}
</script>
<body>
	<h2>로그인 페이지</h2>
	<form action="/SpringFrame/logincheck" method="post">
		아이디 : <input type="text" name="email"><br><br>
		비밀번호 : <input type="password" name="password"><br><br>
		<input type="submit" value="로그인">
	</form>
	
</body>
</html>