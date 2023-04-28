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
<style>
body{
	margin:0;
	overflow-x : hidden;
}
div#login{
	width:400px;
	margin: 300px auto 200px auto;
    text-align: center;
}
div#login input.text{
	width:98%;
	height: 40px;
	padding: 1px 5px;
    border-radius: 5px;
    background: center;
    border: 2px solid #A6A6A6;
    font-weight: bold;
}
input[value="로그인"]{
	cursor:pointer;
	width:406px;
	height: 44px;
    border-radius: 5px;
    background: center;
    border: 2px solid #A6A6A6;
    font-weight: bold;
}
</style>
<body>
	<div id="login">
	<h2>로그인 페이지</h2>
	<form action="/SpringFrame/logincheck" method="post">
		<input type="text" name="email" placeholder="아이디를 입력해주세요." class="text"><br><br>
		<input type="password" name="password" placeholder="비밀번호를 입력해주세요." class="text"><br><br>
		<input type="submit" value="로그인">
	</form>
	</div>
	
</body>
</html>