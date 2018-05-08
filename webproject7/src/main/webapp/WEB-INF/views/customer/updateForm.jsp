<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[회원정보수정]</title>
<script type="text/javascript">

	<c:if test="${errorMsg != null }">alert('${errorMsg }');</c:if>
	function formCheck(){
		//submit 버튼 클릭시	
		var password1 = document.getElementById("password1");
		var password2 = document.getElementById("password2");
		
		if(password1.value != password2.value){
			alert("동일한 비밀번호를 입력해 주세요");
			password2.focus();
			return false;
			}		
		return true;		
		}
	
</script>
</head>
<body>

<h1>[마이 페이지]</h1>

<form action="update" method="post" onsubmit="return formCheck();">
<table>
	<tr>
		<th>
			ID
		</th>
		<td>
			${customer.id }
			<input type="hidden" name="custid" value="${customer.id }">
		</td>
	</tr>
	<tr>
		<th>
			비밀번호
		</th>
		<td>
			<input type="password" name="password" id="password1"><br>
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
			<input type="text" name="email" value="${customer.email }">
		</td>
	</tr>
	<tr>
		<th>
			연락처(휴대폰)
		</th>
		<td>
			<input type="text" name="phonenum" value="${customer.phonenum }">
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
	<input type="submit" value="수정">
	<input type="reset" value="다시쓰기">
</form>
</body>
</html>