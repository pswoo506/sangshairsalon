<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[예약확인]</title>
</head>
<body>
<h1 align="center">[예약확인]</h1>
<div align="center">
<c:forEach items="${reserveList }" var="reserve" varStatus="status">
<c:if test="${status.count <2 }">
<table border="3">
	
	
	<tr>
		<th>
			예약날짜 
		</th>
		<td>
			${reserve.reservedate }			
		</td>
	</tr>
	<tr>
		<th>
			시술항목 선택
		</th>
		<td>
			${reserve.hairstyle }
		</td>	
	</tr>
	<tr>
		<th>
			담당 디자이너 선택
		</th>
		<td>			
			${reserve.designer }
		</td>	
	</tr>
	<tr>
		<th>
			연락처
		</th>
		<td>
			${sessionScope.phoneNum }"
		</td>	
	</tr>
	<tr>
		<th>
			예약시간 
		</th>
		<td>
			${reserve.reservetime }	
		</td>	
	</tr>
	<tr>		
		<th>
			요청사항
		</th>		
		<td>
			${reserve.requesttext }
		</td>	
	</tr>
				
</table>
</c:if>
</c:forEach>
</div>
</body>
</html>