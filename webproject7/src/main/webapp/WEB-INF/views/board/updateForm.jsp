<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 글 수정 ]</title>
</head>
<body>
<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardnum" value="${board.boardnum }">
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${board.title }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="30" cols="30" name="content">
				${board.content }
			</textarea> </td>
		</tr>		
		<tr>
		<th>첨부파일</th>
		<td>
			<input value="${board.originalfile }" disabled="disabled">
			<label for="new_filename"></label>			
			<input type= "file" name="upload" id="new_filename">
		</td>			
		</tr>		
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
			</td>
		</tr>
	</table>
</form>















</body>
</html>