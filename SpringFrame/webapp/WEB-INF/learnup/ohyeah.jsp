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
	<td>작성자</td>
	<td>작성일</td>
	</tr>
	<c:forEach items="${item}" var="i">
	<tr>
	<td>${i.num}</td>
	<td><a href="/SpringFrame/ohyeahdetail?num=${i.num}">${i.title}</a></td>
	<td>${i.nickname}</td>
	<td>${i.date}</td>
	</tr>
	</c:forEach>
	</table>
	
	<br>
	<c:if test="${sessionScope.nickname == null}">
		<script>
			alert("로그인 정보가 없습니다.");
		</script>
		<% response.sendRedirect("/SpringFrame/"); %>
	</c:if>
	
	<input type="button" value="정보 입력하러 가기" onclick="location.href='ohyeahinsert'">

</body>
</html>