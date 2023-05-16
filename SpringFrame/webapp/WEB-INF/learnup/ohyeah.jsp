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
	width: 800px;
	margin: 40px auto;
	text-align: center;
}
div#allitem form{
	text-align: right;
}
div#allitem table {
	width: 100%;
	margin: 20px auto;
	border-collapse: collapse;
}

td {
	border: 1px solid #EAEAEA;
    padding: 5px 20px;
}

.pages a {
	text-decoration: none;
	padding: 10px;
	color: black;
}
.no {width: 15%;}
.title {}
.writer {width: 15%;}
.date {width: 25%;}

th{
	background: #4374D9;
    color: #fff;
    font-size: 16px;
    padding: 10px 10px;
    border: 1px solid #EAEAEA;
    font-weight: bold;
}
tr td:nth-child(1){text-align:center;}
tr td:nth-child(2){text-align:left;}
tr td:nth-child(3){text-align:center;}
tr td:nth-child(4){text-align:center;}
tr:nth-of-type(odd) { 
    background: #D9E5FF; 
}
td a{    
	color: black;
    text-decoration: none;
}
div#allitem input{
	border: 1px solid #4374D9;
    padding: 8px 20px;
    background: #4374D9;
    color: #fff;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
}
div#allitem input[type="text"]{
	height: 20px;
}
div#allitem input:hover{
	background : #6799FF;
}

</style>

<body>
	<jsp:include page="header.jsp" />

	<div id="allitem">
		<h2>정보 확인</h2>

		<form name="search" method="post" action="info">
			<div>
				<input type="text" name="searchtext">
				<input type="submit" value="검색">
			</div>
		</form>

		<table border="1" cellspacing="0">
			<colgroup>
				<col class="no">
				<col class="title">
				<col class="writer">
				<col class="date">
			</colgroup>
			<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${item}" var="i">
				<tr>
					<td>${i.num}</td>
					<td><a href="/SpringFrame/ohyeahdetail?num=${i.num}">${i.title}</a></td>
					<td>${i.nickname}</td>
					<td>${i.date}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>


		<c:set var="listCount" value="${pageInfo.listCount}" />
		<c:set var="nowPage" value="${pageInfo.page}" />
		<c:set var="maxPage" value="${pageInfo.maxPage}" />
		<c:set var="startPage" value="${pageInfo.startPage}" />
		<c:set var="endPage" value="${pageInfo.endPage}" />

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
						<a><b>${a}</b></a>
					</c:if>
					<c:if test="${a != nowPage}">
						<a href="info?page=${a}&searchtext=${search}">${a}</a>
					</c:if>
				</c:forEach>
				<c:if test="${nowPage >= maxPage}">
					<a>></a>
				</c:if>
				<c:if test="${nowPage < maxPage}">
					<a href="info?page=${nowPage + 1}&searchtext=${search}">></a>
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
						<a><b>${a}</b></a>
					</c:if>
					<c:if test="${a != nowPage}">
						<a href="info?page=${a}">${a}</a>
					</c:if>
				</c:forEach>
				<c:if test="${nowPage >= maxPage}">
					<a>></a>
				</c:if>
				<c:if test="${nowPage < maxPage}">
					<a href="info?page=${nowPage + 1}">></a>
				</c:if>
			</c:if>
		</div>


		<br> <br>
		<c:if test="${sessionScope.nickname == null}">
			<script>
				alert("로그인 정보가 없습니다.");
			</script>
			<c:redirect url="/" />
		</c:if>

		<input type="button" value="게시글 작성"
			onclick="location.href='ohyeahinsert'">
	</div>

</body>
</html>