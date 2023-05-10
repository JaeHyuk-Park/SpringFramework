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

		<%
			PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
			int listCount = pageInfo.getListCount();
			int nowPage = pageInfo.getPage();
			int maxPage = pageInfo.getMaxPage();
			int startPage = pageInfo.getStartPage();
			int endPage = pageInfo.getEndPage();
		%>

		<div class="pages">
			<%
				if (nowPage <= 1) {
			%>
			<a><</a>
			<%
				} else {
			%>
			<a href="info?page=<%=nowPage - 1%>"><</a>
			<%
				}
			%>

			<%
				for (int a = startPage; a <= endPage; a++) {
					if (a == nowPage) {
			%>
			<a><%=a%></a>
			<%
				} else {
			%>
			<a href="info?page=<%=a%>"><%=a%> </a>
			<%
				}
			%>
			<%
				}
			%>

			<%
				if (nowPage >= maxPage) {
			%>
			<a>></a>
			<%
				} else {
			%>
			<a href="info?page=<%=nowPage + 1%>">></a>
			<%
				}
			%>
		</div>

		<br>
		<br>
		<c:if test="${sessionScope.nickname == null}">
			<script>
				alert("로그인 정보가 없습니다.");
			</script>
			<%
				response.sendRedirect("/SpringFrame/");
			%>
		</c:if>

		<input type="button" value="정보 입력하러 가기"
			onclick="location.href='ohyeahinsert'">
	</div>

</body>
</html>