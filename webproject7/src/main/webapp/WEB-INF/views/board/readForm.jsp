<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 글 읽기 ]</title>
<script type="text/javascript">
	function deleteBoard(boardnum){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="deleteBoard?boardnum="+boardnum;
		}
	}
	function deleteReply(replynum,boardnum){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="deleteReply?replynum="+replynum+"&boardnum="+boardnum;
		}
	}
	function updateReplyForm(replynum,boardnum,replyText){
		var div=document.getElementById("div"+replynum);
		
		var str =  '<form action="updateReply" method="post" id="editForm'+replynum+'" >';
			str += '<input type = "hidden" name="replynum" value="'+replynum+'">';
			str += '<input type = "hidden" name="boardnum" value="'+boardnum+'">';
			str += '<input type="text" name="text" value="'+replyText+'">';		
			str += '<a href="javascript:replyUpdate('+replynum+')">[수정하기]</a>';
			str	+= '<a href="javascript:replyCancel(div'+replynum+')">[취소]</a>';	
			str	+= '</form>';
		div.innerHTML=str;
	}
	function replyCancel(div){
		div.innerHTML="";
	}
	function replyUpdate(replynum){
		var form = document.getElementById("editForm"+replynum);
		form.submit();
	}
</script>	
</head>
<body>

<h1 style="background-color: yellow" align="center">[ 게시판 글읽기 ]</h1>

<table border="1" style="border-collapse:collapse;">
	<tr>
		<th>작성자</th>
		<td>${board.id }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${board.inputdate }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${board.hits }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${board.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${board.content }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
			<a	href="download?boardnum=${board.boardnum }">
				${board.originalfile }
			</a>
			<img alt="" src="download?boardnum=${board.boardnum }">
		</td>
	</tr>
</table>
<c:if test="${sessionScope.loginId==board.id}">
<a href="javascript:deleteBoard(${board.boardnum})">삭제</a>
<a href="updateBoardForm?boardnum=${board.boardnum}">수정</a>
</c:if>
<a href="list">목록으로</a>

<form action="insertReply" method="post">
	<input type="hidden" name="boardnum" value="${board.boardnum}">
	리플내용<input type="text" name="text">
	<input type= "submit" value="확인">
</form>
	
	<table border="1" style="border-collapse:collapse;">
		<c:forEach var="reply" items="${replyList }">
			<tr>
				<td>${reply.id } </td>
				<td>${reply.text } </td>
			<td>
				<c:if test="${sessionScope.loginId == reply.id }">
				<a href="javascript:updateReplyForm('${reply.replynum }','${reply.boardnum }','${reply.text }')">[수정]</a>
				</c:if>
			</td>
			<td>
				<c:if test="${sessionScope.loginId == reply.id }">
				<a href="javascript:deleteReply('${reply.replynum}','${reply.boardnum}')">[삭제]</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<div id="div${reply.replynum }"></div>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>