<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">
<c:if test="${errorMsg != null}"> alert('${errorMsg}');</c:if>

function idCheckOpen(){
// id중복체크 클릭시
	window.open("idCheck","newWindow","top=300,left=300,width=500,height=500"); 
}
function formCheck(){
	//submit 클릭시	
	var password1 = document.getElementById("password");
	var password2 = document.getElementById("password2");
	
	if(password1.value ==""){
		alert("비밀번호를 입력해 주세요")
		password1.focus();
		return false;
	} //else if 사용시 둘중에 하나 맞는걸루 검사
	else if(password1.value != password2.value){
		alert("동일한 비밀번호를 입력해주세요")		
		password2.focus();
		return false;
	}
	return true;		
}
</script>
</head>
<body>
<h1>[회원가입]</h1>
<form action="join" method="post" onsubmit="return formCheck();">
<table border="3">
	<tr>
		<th>
			ID
		</th>
		<td>
			<input type="text" name="id" id="id" readonly="readonly" value=${customer.id }>
			<input type="button" value="ID중복확인" onclick="idCheckOpen()">
		</td>
	</tr>
	<tr>
		<th>
			비밀번호
		</th>
		<td>
			<input type="password" name="password" id="password"><br>
			<input type="password" id="password2">
		</td>	
	</tr>
	<tr>
		<th>
			이름
		</th>
		<td>
			<input type="text" name="name" id="name" value="${customer.name }">
		</td>	
	</tr>
	<tr>
		<th>
			이메일
		</th>
		<td>
			<input type="text" name="email" id="email" value="${customer.email }">
		</td>	
	</tr>
	<tr>
		<th>
			연락처(휴대폰)
		</th>
		<td>
			<input type="text" name="phonenum" id="phonenum" value="${customer.phonenum }">
		</td>	
	</tr>	
	<tr>
		<th>
			주소
		</th>
		<td>
			<input type="text" name="address" value="${customer.address }">
		</td>	
	</tr>		
</table>
	<input type="submit" value="가입하기">
	<input type="reset" value="다시쓰기">
</form>
</body>
</html>