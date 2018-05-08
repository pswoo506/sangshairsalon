<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[예약 신청]</title>
</script>
<link href="resources/css/homeStyle.css" type="text/css"
		   rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.js"/>">
</script>
</head>
<body>
<h1 align="center">[예약]</h1>
<form action="reserve" method="post">
<div align="center">
<table border="3">
	<tr>
		<th>
			예약날짜 선택
		</th>
		<td>
			<input type="date" name="reservedate" id="reservedate" value=${reserve.reservedate }>			
		</td>
	</tr>
	<tr>
		<th>
			시술항목 선택
		</th>
		<td>
			<input type="radio" name="hairstyle" value="dye">염색<br> 
			<input type="radio" name="hairstyle" value="perm">일반펌<br>
			<input type="radio" name="hairstyle" value="specialperm">특수펌<br>
			<input type="radio" name="hairstyle" value="magic">매직<br>
			<input type="radio" name="hairstyle" value="cut">커트
		</td>	
	</tr>
	<tr>
		<th>
			담당 디자이너 선택
		</th>
		<td>			
			<input type="radio" name="designer" value="현아">현아<br> 
			<input type="radio" name="designer" value="태희">태희<br>
			<input type="radio" name="designer" value="수지">수지<br>
			<input type="radio" name="designer" value="우성">우성<br>
			<input type="radio" name="designer" value="동건">동건
		</td>	
	</tr>
	<tr>
		<th>
			연락처
		</th>
		<td>
			<input type="text" name="phonenum" id="phonenum" value="${sessionScope.phoneNum }">
		</td>	
	</tr>
	<tr>
		<th>
			예약시간 :
		</th>
		<td>
			<select name="reservetime" id="reservetime">
				<option value="" selected="">시</option>
				<option value="09">09시</option>
				<option value="10">10시</option>
				<option value="11">11시</option>
				<option value="12">12시</option>
				<option value="13">13시</option>
				<option value="14">14시</option>
				<option value="15">15시</option>
				<option value="16">16시</option>
				<option value="17">17시</option>
				<option value="18">18시</option>
				<option value="19">19시</option>
				<option value="20">20시</option>
				<option value="21">21시</option>					
			</select>
			<select name="reservetime" id="reservetime">
				<option value="" selected="">분</option>
				<option value="00">00분</option>
				<option value="30">30분</option>
			</select>
			
		</td>	
	</tr>
	<tr>		
		<th>
			요청사항
		</th>		
		<td>
			<textarea id="requesttext" name=requesttext></textarea>
		</td>	
	</tr>			
</table>
	<input type="submit" value="예약하기">	
</div>
</form> 
<!--<img alt="" src="../resources/trend/1.jpg">-->		
</body>
</html>