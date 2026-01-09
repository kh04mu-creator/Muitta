<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MD목록(mdList)</title>
</head>
<body>
 <h1>MD목록</h1>
 <h3>이달의 MD 추천 명대사</h3>
	<c:forEach var="dto" items="${list}">
	<p><img src="/images/${dto.md_name}" /></p>	
	<p>${dto.md_title}</p>	
	<p>${dto.md_start} ~ ${dto.md_end}</p>
	<a href="/admin/mdDetail?md_no=${dto.md_no}">자세히보기</a>	
	</c:forEach>
	<p><a href="/admin/mdWriteForm">MD 등록</a> 하기
</body>
</html>