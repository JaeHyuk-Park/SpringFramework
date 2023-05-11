<%@page import="learnup_pm_model.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
body {
	margin: 0;
	overflow-x: hidden;
}

div#allitem {
	width: 600px;
	margin: 40px auto;
	text-align: center;
}

div#allitem table {
	width: 100%;
	margin-bottom: 30px;
}

td {
	text-align: center;
	padding: 10px;
}

.pages a {
	text-decoration: none;
	padding: 10px;
	color: black;
}
</style>

<body>
	<jsp:include page="header.jsp" />

	<div id="allitem">
		<h2>정보 확인</h2>

		<form name="search" method="post" action="info">
			<input type="text" name="searchtext" placeholder="검색 제목을 입력하세요.">
			<input type="submit" value="검색">
		</form>
	
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
		
		
		<c:set var="listCount" value="${pageInfo.listCount}" />
		<c:set var="nowPage" value="${pageInfo.page}"/>
		<c:set var="maxPage" value="${pageInfo.maxPage}"/>
		<c:set var="startPage" value="${pageInfo.startPage}"/>
		<c:set var="endPage" value="${pageInfo.endPage}"/>
		
		<div class="pages">
		
		<c:if test="${search != null}">
			<c:if test="${nowPage <= 1}">
				<a><</a>
			</c:if>
			<c:if test="${nowPage > 1}">
				<a href="info?page=${nowPage - 1}&searchtext=${search}"><</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" step="1" var="a">
				<c:if test="${a == nowPage}">
					<a>${a}</a>
				</c:if>
				<c:if test="${a != nowPage}">
					<a href="info?page=${a}&searchtext=${search}">${a}</a>
				</c:if>
			</c:forEach>
			<c:if test="${nowPage >= maxPage}">
				<a>></a>
			</c:if>
			<c:if test="${nowPage < maxPage}">
				<a href="info?page=${nowPage + 1}&searchtext=${search}>">></a>
			</c:if>
		</c:if>			
		<c:if test="${search == null}">
			<c:if test="${nowPage <= 1}">
				<a><</a>
			</c:if>
			<c:if test="${nowPage > 1}">
				<a href="info?page=${nowPage - 1}"><</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" step="1" var="a">
				<c:if test="${a == nowPage}">
					<a>${a}</a>
				</c:if>
				<c:if test="${a != nowPage}">
					<a href="info?page=${a}">${a}</a>
				</c:if>
			</c:forEach>
			<c:if test="${nowPage >= maxPage}">
				<a>></a>
			</c:if>
			<c:if test="${nowPage < maxPage}">
				<a href="info?page=${nowPage + 1}>">></a>
			</c:if>
		</c:if>	
		</div>
		

		<br>
		<br>
		<c:if test="${sessionScope.nickname == null}">
			<script>
				alert("로그인 정보가 없습니다.");
			</script>
			<c:redirect url="/" />
		</c:if>

		<input type="button" value="정보 입력하러 가기"
			onclick="location.href='ohyeahinsert'">
	</div>

</body>
</html>