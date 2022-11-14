<%@page import="com.company.vo.TeacherVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<style type="text/css">
table th, table td {
	padding: 10px;
}
</style>
</head>
<body>
	<h1 style="margin-top: 30px; text-align: center;">수강신청</h1>
	<div style="text-align: center; width: 800px; margin: 20px auto;">
		<form name="addClass">
			<table border="1" style="width: 100%; border-collapse: collapse;">
				<tr>
					<th>수강월</th>
					<td align="left"> <input type="text" size="25" name="classMonth">&nbsp;&nbsp;2022년03월 예)202203 </td>
				</tr>
				
				<tr>
					<th>회원명</th>
					<td align="left"> 
						<select name="name" style="width:200px;" onchange="selectName();return false;">
						<option selected="selected">회원명</option>
							<option value="홍길동">홍길동</option>
							<option value="장발장">장발장</option>
							<option value="임꺽정">임꺽정</option>
							<option value="성춘향">성춘향</option>
							<option value="이몽룡">이몽룡</option>
						</select> 
					</td>
				</tr>
				
				<tr>
					<th>회원번호</th>
					<td align="left"> <input type="text" size="25" name="no">&nbsp;&nbsp;예)10001 </td>
				</tr>
				
				<tr>
					<th>강의장소</th>
					<td align="left"> <select name="area" style="width:200px;">
					<option selected="selected">강의장소</option>
							<option value="서울본원">서울본원</option>
							<option value="성남분원">성남분원</option>
							<option value="대전분원">대전분원</option>
							<option value="부산분원">부산분원</option>
							<option value="대구분원">대구분원</option>
						</select>  </td>
				</tr>
				
				<tr>
					<th>강의명</th>
					<td align="left"> <select name="c_name" style="width:200px;" onchange="calcPrice();return false;">
					<option selected="selected">강의신청</option>
							<option value="초급반">초급반</option>
							<option value="중급반">중급반</option>
							<option value="고급반">고급반</option>
							<option value="심화반">심화반</option>
						</select> </td>
				</tr>
				
				<tr>
					<th>수강료</th>
					<td align="left"> <input type="text" size="25" name="price">&nbsp;&nbsp;원 </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"> 
						<button onclick="formSubmit();return false;">수강신청</button> 
						<button onclick="formReset();return false;">다시쓰기</button> 
					</td>
				</tr>

			</table>
		</form>

	</div>
</body>

<script type="text/javascript">
	function selectName(){
		var name=document.addClass.name.value;
		// 이름에 따른 번호 생성..
		if(name=="회원명"){
			alert('회원이름을 선택하세요.');
			document.addClass.name.focus();
			return;
		}else if(name=="홍길동"){
			document.addClass.no.value=10001;
		}else if(name=="장발장"){
			document.addClass.no.value=10002;
		}else if(name=="임꺽정"){
			document.addClass.no.value=10003;
		}else if(name=="성춘향"){
			document.addClass.no.value=20001;
		}else if(name=="이몽룡"){
			document.addClass.no.value=20002;
		}
		
	}
	
	function formSubmit(){
		var month=document.addClass.classMonth.value;
		var name=document.addClass.name.value;
		var no=document.addClass.no.value;
		var area=document.addClass.area.value;
		var c_name=document.addClass.c_name.value;
		var price=document.addClass.price.value;
		
		if(month=="" || month.length==0){
			alert('수강월을 입력하세요.');
			document.addClass.classMonth.focus();
		}else if(name=="" || name.length==0 || name=="회원명"){
			alert('회원명을 입력하세요.');
			document.addClass.name.focus();
		}else if(no=="" || no.length==0){
			alert('회원번호를 입력하세요.');
			document.addClass.no.focus();
		}else if(area=="" || area.length==0 || area=="강의장소"){
			alert('강의장소를 입력하세요.');
			document.addClass.area.focus();
		}else if(c_name=="" || c_name.length==0 || c_name=="강의신청"){
			alert('강의명을 입력하세요.');
			document.addClass.c_name.focus();
		}else if(price=="" || price.length==0 ){
			alert('수강료를 입력하세요.');
			document.addClass.price.focus();
		}else{
			alert('수강신청이 정상적으로 완료되었습니다.');
			document.addClass.method="post";
			document.addClass.action="AddClass";
			document.addClass.submit();
		}
		
	}
	
	function formReset(){
		alert('정보를 지우고 처음부터 다시 입력합니다.');
		document.addClass.reset();
		document.addClass.classMonth.focus();
	}
	
	function calcPrice(){
		var c_name=document.addClass.c_name.value;
		var price;
		
		if(c_name=="강의신청"){
			alert('강좌를 선택하세요');
			document.addClass.c_name.focus();
			return;
		}
		
		// 초급,중급,고급에 따른 수강료 설정.
		switch(c_name){
		case "초급반":
			price=100000;
			break;
		case "중급반":
			price=200000;
			break;
		case "고급반":
			price=300000;
			break;
		case "심화반":
			price=400000;
			break;
		}
		
		// 회원번호 20000이상 50%할인 적용
		var no=parseInt(document.addClass.no.value);
		if(no>=20000)
			price=price*0.5;
		
		document.addClass.price.value=price;
	}
</script>
</html>