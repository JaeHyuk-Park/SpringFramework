<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
td{
	text-align:center;
	padding:10px;
}

</style>
<body>
	<form action="/SpringFrame/insert" method="post">
		이름 : <input type="text" name="name" placeholder="이름을 입력하세요."><br><br>
		제목 : <input type="text" name="title" placeholder="제목을 입력하세요."><br><br>
		<input type="submit" value="제출하기">
	</form>
	<br><br>
	
	<table border="1" cellspacing="0">
	<tr>
	<td>번호</td>
	<td>이름</td>
	<td>제목</td>
	<td>등록일시</td>
	<td>삭제여부</td>
	</tr>
	<c:forEach items="${item}" var="i">
	<tr>
	<td>${i.num}</td>
	<td>${i.name}</td>
	<td>${i.title}</td>
	<td>${i.date}</td>
	<td><a href="/SpringFrame/delete?num=${i.num}">삭제</a></td>
	</tr>
	</c:forEach>
	</table>
	
	
</body>
</html>