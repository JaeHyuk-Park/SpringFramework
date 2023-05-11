<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 확인</title>
</head>
<style>
td{
	text-align:center;
	padding:10px;
}

</style>
<body>
	<jsp:include page="header.jsp"/>
	<h2>정보 확인</h2>

	<table border="1" cellspacing="0">
	<tr>
	<td>글 번호</td>
	<td>제목</td>
	<td>내용</td>
	<td>작성자</td>
	<td>작성일시</td>
	</tr>
	<td>${item.num}</td>
	<td>${item.title}</td>
	<td>${item.descript}</td>
	<td>${item.nickname}</td>
	<td>${item.date}</td>
	</table>
	<img src="Springitem/${item.savefile}">
	
	<br>
	<c:if test="${sessionScope.nickname == null}">
		<script>
			alert("로그인 정보가 없습니다.");
		</script>
		<c:redirect url="/" />
	</c:if>

	<c:if test="${sessionScope.nickname eq item.nickname}">
		<form action="/SpringFrame/delete" method="post">
			<input type="hidden" name="num" value="${item.num}"> 
			<input type="submit" value="게시글 삭제">
		</form>
	</c:if>
	<br>

	<input type="button" value="메인 화면으로" onclick="location.href='info'">

</body>
</html>