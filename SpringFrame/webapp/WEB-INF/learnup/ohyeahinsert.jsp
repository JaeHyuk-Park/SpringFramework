<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 입력</title>
</head>
<body>
	<form action="/SpringFrame/insert" method="post">
		이름 : <input type="text" name="name" placeholder="이름을 입력하세요."><br><br>
		제목 : <input type="text" name="title" placeholder="제목을 입력하세요."><br><br>
		<input type="submit" value="제출하기">
	</form>
</body>
</html>