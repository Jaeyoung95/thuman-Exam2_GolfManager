<%@page import="com.company.vo.TeacherVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<TeacherVO> list=(ArrayList<TeacherVO>)request.getAttribute("list");
%>
<!-- 정보처리 산업기사 실기 시험때는 인터넷이 끊어지고 JSTL라이브러리 사용 불가므로 list값을 받아서 처리하는 구문을 넣어준다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사조회</title>
<style type="text/css">
table th,table td{
	padding: 10px;
}
</style>
</head>
<body>
<h1 style="margin-top:30px;text-align:center;">강사조회</h1>
<div style="text-align: center;width:800px;margin:20px auto;">
<table border="1" style="width:100%;border-collapse: collapse;">
	<tr>
		<th>강사코드</th>
		<th>강사명</th>
		<th>강의명</th>
		<th>수강료</th>
		<th>강사자격취득일</th>
	</tr>
	<%for(int i=0;i<list.size();i++) {
		TeacherVO vo=list.get(i);
	%>
	<tr>
		<td> <%=vo.getTeacher_code() %> </td>
		<td> <%=vo.getTeacher_name() %> </td>
		<td> <%=vo.getClass_name() %> </td>
		<td> <%=vo.getClass_price() %> </td>
		<td> <%=vo.getTeacher_regist_date() %> </td>
		
	</tr>
	<%} %>
</table>
</div>
</body>
</html>