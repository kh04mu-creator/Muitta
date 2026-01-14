<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 리스트</title>
</head>
<body>
	<h3>마이 리스트</h3>
	<table>
		<tr>
			<td>제목</td>
			<td>공연장</td>
			<td>공연기간</td>
			<td></td>
		</tr>		
		<c:forEach var="m" items="mlist">
			<tr>
					<td onclick="location href='musicalDetail?mu_no=${m.mu_no}'">${m.mu_title}</td>
					<td>${m.mu_place}</td>
					<td>${m.mu_start} ~ ${m.mu_end}</td>
				<td><button onclick="location href='mLikeDelete?l_no=${llist.l_no}'">삭제</button></td>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>