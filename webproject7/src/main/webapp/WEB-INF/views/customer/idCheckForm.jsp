<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복검사</title>
<script type="text/javascript">
function useId(searchId){
	opener.document.getElementById("id").value=searchId;
	this.close(); //jsp함수 즉 창을 닫아주는것
}
</script>
</head>
<body>
	<h2>ID 중복확인</h2>
	<form action="idSearch" method="post" onsubmit="return formCheck();">
		<input type="text" name="searchId" id="searchId" value="${searchId }">
		<input type="submit" value="검색">
	</form>


<c:if test="${search }">
	<c:if test="${searchResult == null}">
		<p>${searchId }는 사용할수 있는 ID 입니다.</p>
		<p><input type="button" value="ID 사용하기" onclick="useId('${searchId}')"></p>
	</c:if>	
	<c:if test="${searchResult != null }">
		<p>${searchId }는 사용할수 없는 ID 입니다.</p>
	</c:if>
</c:if>	
</body>
</html>