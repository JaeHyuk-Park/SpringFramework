<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 입력</title>
</head>
<style>
body {
	margin: 0;
	overflow-x: hidden;
}
div#createall{
	width: 800px;
	margin: 40px auto;
	text-align: center;
}
div#createall form{
	text-align:left;
}
div#createall input[type=text]{
	width:100%;
	padding : 0.5rem;
	margin-top: 10px;
}
div#createall textarea{
	width:100%;
	padding:8px;
	height:252px;
	    margin-top: 10px;
}
div#createall input[type=button], div#createall input[type=submit]{
	border: 1px solid #4374D9;
    padding: 8px 20px;
    background: #4374D9;
    color: #fff;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
} 
div#createall input[type=button]:hover, div#createall input[type=submit]:hover{
	background: #6799FF;
}

</style>
<body>
	<jsp:include page="header.jsp"/>
	<c:if test="${sessionScope.nickname == null}">
		<script>
			alert("로그인 정보가 없습니다.");
		</script>
		<c:redirect url="/" />
	</c:if>
	<div id="createall">
	<form action="/SpringFrame/insert" method="post" enctype="multipart/form-data">
		<div>제목 <span style="color:red;">*</span></div>
		<input type="text" name="title" placeholder="제목을 입력하세요." required><br><br>
		<div>내용 <span style="color:red;">*</span></div>
		<textarea name="descript" placeholder="내용을 입력하세요" required></textarea><br><br>
		<input type="file" name="file">
		<input type="hidden" name="nickname" value="<c:out value="${sessionScope.nickname}" />">
		<br><br>
		<input type="submit" value="작성하기">
		<input type="button" value="뒤로가기" onclick="location.href='info'">
	</form>
	</div>
</body>
</html>