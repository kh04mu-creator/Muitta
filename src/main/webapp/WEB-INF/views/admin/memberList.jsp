<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원목록</title>
</head>
<body>

<h3>회원목록</h3>
<table border="1" width="800">
    <tr>
        <td>번호</td>
        <td>아이디</td>
        <td>이름</td>
        <td>성별</td>
        <td>생년월일</td>
        <td>이메일</td>
        <td>전화번호</td>
        <td>가입일</td>
        <td>권한</td>
        <td>회원강퇴</td>
    </tr>

    <c:forEach var="dto" items="${m_list}">
        <tr>
            <td>${dto.m_no}</td>
            <td><a href="memberDetail?m_no=${dto.m_no}">${dto.m_id}</a></td>
            <td>${dto.m_name}</td>
            <td>${dto.m_gender}</td>
            <td>${dto.m_birth}</td>
            <td>${dto.m_email}</td>
            <td>${dto.m_tel}</td>
            <td><fmt:formatDate value="${dto.m_join}" pattern="yyyy-MM-dd(E)" /></td>
            <td>${dto.m_auth}</td>
            <td>
            	<a href="member/memberDelete?m_no=${dto.m_no}">강퇴</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>