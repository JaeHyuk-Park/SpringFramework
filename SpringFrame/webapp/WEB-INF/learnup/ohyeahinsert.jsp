<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 입력</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<c:if test="${sessionScope.nickname == null}">
		<script>
			alert("로그인 정보가 없습니다.");
		</script>
		<% response.sendRedirect("/SpringFrame/"); %>
	</c:if>
	<form action="/SpringFrame/insert" method="post">
		제목 : <input type="text" name="title" placeholder="이름을 입력하세요."><br><br>
		내용 : <input type="text" name="descript" placeholder="제목을 입력하세요."><br><br>
		<!-- 파일첨부<br>
		<input type="file" name="file"-->
		<input type="hidden" name="nickname" value="<%= (String)session.getAttribute("nickname")%>">
		<input type="submit" value="제출하기">
	</form>
</body>
</html>