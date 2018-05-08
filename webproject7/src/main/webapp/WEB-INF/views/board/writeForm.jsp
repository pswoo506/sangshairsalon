<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[글 쓰기 ]</title>
</head>
<body>
<form action="write" method="post" enctype="multipart/form-data">
	<table border="3">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="30" cols="30" name="content"></textarea> </td>
		</tr>
		<tr>
			<th>첨부파일</th>
			
			
			<td>
				<input type="file" name="upload">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="저장">
			</td>
		</tr>
	</table>
</form>
</body>
</html>