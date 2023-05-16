<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	font-size : 20px;
}
div#head input{
	margin-top:20px;
	border: 1px solid #4374D9;
    padding: 8px 20px;
    background: #4374D9;
    color: #fff;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
}
div#head input:hover{
	background : #6799FF;
}
</style>
<body>
	<div id="head">
	<form>
		<input type="button" value="로그아웃" onclick="location.href='/SpringFrame/logout'">
	</form><br>
	<b><c:out value="${sessionScope.nickname}" /></b>님 환영합니다.
	</div>
</body>
</html>