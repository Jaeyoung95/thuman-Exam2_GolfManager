<%@page import="com.company.vo.MemberVO"%>
<%@page import="com.company.vo.TeacherVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<MemberVO> list=(ArrayList<MemberVO>)request.getAttribute("memberList");
%>
<!-- 정보처리 산업기사 실기 시험때는 인터넷이 끊어지고 JSTL라이브러리 사용 불가므로 list값을 받아서 처리하는 구문을 넣어준다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<style type="text/css">
table th,table td{
	padding: 10px;
}
</style>
</head>
<body>
<h1 style="margin-top:30px;text-align:center;">회원정보조회</h1>
<div style="text-align: center;width:800px;margin:20px auto;">
<table border="1" style="width:100%;border-collapse: collapse;">
	<tr>
		<th>수강월</th>
		<th>회원번호</th>
		<th>회원명</th>
		<th>강의명</th>
		<th>강의장소</th>
		<th>수강료</th>
		<th>등급</th>
	</tr>
	<%for(int i=0;i<list.size();i++) {
		MemberVO vo=list.get(i);
	%>
	<tr>
		<td> <%=vo.getTeacher_regist_date() %> </td>
		<td> <%=vo.getC_no() %> </td>
		<td> <%=vo.getC_name()%> </td>
		<td> <%=vo.getClass_name()%> </td>
		<td> <%=vo.getClass_area()%> </td>
		<td> <%=vo.getTuition()%> </td>
		<td> <%=vo.getGrade()%> </td>
		
	</tr>
	<%} %>
</table>
</div>
</body>
</html>