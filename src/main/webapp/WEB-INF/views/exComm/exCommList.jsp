<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓거래 댓글 리스트(exCommList)</title>
</head>
<body>
	<h1>티켓거래 댓글 목록</h1>
	<table>
		<tr>
			<td><fmt:formatDate value="${dto.exc_date}" pattern="yyyy-MM-dd(E)"/></td>
		</tr>
		
	</table>	
	

</body>
</html>