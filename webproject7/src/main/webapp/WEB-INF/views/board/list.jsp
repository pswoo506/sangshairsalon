<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 게시판 ]</title>
<script type="text/javascript">
	function writeForm(){
		location.href = "writeForm";
	}	
	function home(){
		location.href = "../";
	}
	function pagingFormSubmit(currentPage){
		var form=document.getElementById("pagingForm");
		var page= document.getElementById("page");
		page.value=currentPage;
		form.submit();
	}
</script>

</head>
<body>
<h1 align="center">이용후기 게시판</h1>
<div align="center">
<c:if test="${sessionScope.loginId != null }">
	<input type="button" value="글쓰기" onclick="writeForm()">
	<input type="button" value="홈화면으로" onclick="home()">
</c:if>
</div>
<div align="center">
<table border="3" >
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
<c:forEach var="board" items="${boardlist }">
	<tr>	
		<td align="center">
			${board.boardnum }
		</td>
		<td>
			<a href="readForm?boardnum=${board.boardnum }">
				${board.title }
			</a>
		</td>
		<td align="center">${board.id }</td>
		<td align="center">${board.hits }</td>
		<td align="center">${board.inputdate }</td>
	</tr>
</c:forEach>
</table>
</div>
<div align="center">
	<c:if test="${navi.currentGroup != 0}">
	<a href="javascript:pagingFormSubmit(${navi.startPageGroup-1})">◁◁</a>
    <a href="javascript:pagingFormSubmit(${navi.currentPage-1})">◀</a>
	</c:if>
	<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="counter">
		<c:choose>
			<c:when test="${counter == navi.currentPage }">
				<a href="javascript:pagingFormSubmit(${counter})"><b>${counter}</b></a>
			</c:when>		
			<c:otherwise>
				<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>
			</c:otherwise>
		</c:choose>		
	</c:forEach>
	<c:if test="${navi.currentGroup != lastGroup}">
	<a href="javascript:pagingFormSubmit(${navi.currentPage+1})">▶</a>	
	<a href="javascript:pagingFormSubmit(${navi.endPageGroup+1})">▷▷</a>
	</c:if>
</div>

<div align="center">
<form action="list" method="get" id="pagingForm">
	<input type="hidden" name="page" id="page">
	<select name="searchSelect">
		<option selected value="title">제목</option>		
		<option selected value="content">본문</option>
		<option selected value="id">작성자</option>
	</select>
	제목 : <input type="text" name="searchText" value="${searchText}">
	<input type="button" value="검색" onclick="pagingFormSubmit(1)">

</form>
</div>
</body>
</html>