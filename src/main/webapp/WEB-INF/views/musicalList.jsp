<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤지컬 목록</title>
</head>
<body>
<h3>뮤지컬</h3>
<sec:authorize access="hasRole('ADMIN')">
	<a href="/admin/musicalWriteForm">추가하기</a>
    <button onclick="location.href='/admin/musicalWriteForm'">추가하기</button>
</sec:authorize>

<c:forEach var="dto" items="${mlist}">
	<div>
		<div>
			<img src="images/${dto.mu_pupload}" style="height:200px"/>
		</div>
		<h4>${dto.mu_title}</h4>
		<p>${dto.mu_place}
		<p>${dto.mu_start} ~ ${dto.mu_end}
		<p><input type="button" value="상세보기" onclick="location.href='musicalDetail?mu_no=${dto.mu_no}'">
	</div>
</c:forEach>

</body>
</html>