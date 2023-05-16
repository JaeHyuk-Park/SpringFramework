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

td {
	text-align: center;
	padding: 10px;
}

div#detailall {
	width: 800px;
	margin: 40px auto;
	text-align: center;
}

table {
	width: 100%;
	max-width: 100%;
	table-layout: fixed;
	margin-bottom: 0;
	border: none;
	border-spacing: 0;
}

th#topth {
	margin-left: 5px;
	border-top: 1px solid #D9E5FF;
	font-size: 20px;
	vertical-align: middle;
}

thead {
	border-bottom: 1px solid #D9E5FF;
}

th {
	background: #4374D9;
	color: #fff;
}

th, td {
	text-align: left;
	border-top: 1px solid #D9E5FF;
	padding: 8px 14px;
}

td#tbo {
	height: 100%;
	padding: 8px 14px;
	border: none;
	border-top: 1px solid #D9E5FF;
	font-size: 14px;
	color: #393939;
	text-align: center;
	vertical-align: middle;
	border-bottom: 1px solid #D9E5FF;
}

td div#boardcontents {
	padding: 18px 12px;
	font-size: 15px;
	text-align: left;
}
div#detailall form{
	text-align: right;
}
div#detailall input[type="submit"], div#detailall input[type="button"]{
	margin-top:20px;
	border: 1px solid #4374D9;
    padding: 8px 20px;
    background: #4374D9;
    color: #fff;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
}
div#detailall input[type="submit"]:hover, div#detailall input[type="button"]:hover{
	background : #6799FF;
}
#fileimage img{
	max-width:300px;
}
</style>
<body>
	<jsp:include page="header.jsp" />

	<div id="detailall">
		<h2>정보 확인</h2>

		<table border="1" cellspacing="0">
			<colgroup>
				<col style="width: 15%;" />
				<col />
				<col style="width: 15%;" />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th colspan="4" id="topth">${item.title}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>등록자명</th>
					<td>${item.nickname}</td>
					<th>등록일시</th>
					<td>${item.date}</td>
				</tr>
				<tr>
					<th>게시글 번호</th>
					<td colspan="3">${item.num}</td>
				</tr>
				<tr>
					<td colspan="4" id="tbo">
						<div id="boardcontents">
						${item.descript}
						<br>
						<br>
						<c:if test="${item.savefile != null}">
						<div id="fileimage"><img src="Springitem/${item.savefile}"></div>
						</c:if>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<c:if test="${sessionScope.nickname == null}">
			<script>
				alert("로그인 정보가 없습니다.");
			</script>
			<c:redirect url="/" />
		</c:if>

		
			<form action="/SpringFrame/delete" method="post">
				<c:if test="${sessionScope.nickname eq item.nickname}">
					<input type="hidden" name="num" value="${item.num}"> 
					<input type="submit" value="게시글 삭제">
				</c:if>
				<input type="button" value="메인 화면으로" onclick="location.href='info'">
			</form>
		
	</div>

</body>
</html>