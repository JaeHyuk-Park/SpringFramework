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
	<td>번호</td>
	<td>이름</td>
	<td>제목</td>
	<td>닉네임</td>
	<td>등록일시</td>
	<td>삭제여부</td>
	</tr>
	<c:forEach items="${item}" var="i">
	<tr>
	<td>${i.num}</td>
	<td>${i.name}</td>
	<td>${i.title}</td>
	<td>${i.nickname}</td>
	<td>${i.date}</td>
	<td><a href="/SpringFrame/delete?num=${i.num}">삭제</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<br>
	<c:if test="${sessionScope.nickname == null}">
		<script>
			alert("로그인 정보가 없습니다.");
			history.back();
		</script>
	</c:if>
	<input type="button" value="정보 입력하러 가기" onclick="location.href='ohyeahinsert'">

</body>
</html>