<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String filePath=request.getParameter("filePath");
	if(filePath==null){
		filePath="home";
	} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리 프로그램 ver 1.0</title>
<link href="css/design.css" rel="stylesheet">
</head>
<body>
	<header>
		<h1 style="text-align: center;padding-top:30px;padding-bottom:30px;">골프연습장 회원관리 프로그램 ver 1.0</h1>
	</header>
	<nav>
		<ul>
			<li> <a href="GetTeacherList">강사조회</a> </li>
			<li> <a href="index.jsp?filePath=addClass">수강신청</a> </li>
			<li> <a href="GetMemberList">회원정보조회</a> </li>
			<li> <a href="GetTeacherPrices">강사매출현황</a> </li>
			<li> <a href="index.jsp?filePath=home">홈으로</a> </li>
		</ul>
	</nav>
	<section>
		<jsp:include page='<%=filePath + ".jsp"%>'></jsp:include>
	</section>
	<footer>
	<p>HRDKOREA Copyright@2015.All rights reserved.....</p>
	</footer>
</body>
</html>