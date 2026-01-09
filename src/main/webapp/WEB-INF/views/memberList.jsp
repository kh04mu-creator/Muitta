<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원목록</title>
</head>
<body>

<h3>회원목록</h3>
<table>
    <tr>
        <th>번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>생년월일</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>수정/삭제</th>
    </tr>

    <c:forEach var="m" items="${mlist}">
        <tr>
            <td>${m.m_no}</td>
            <td>${m.m_id}</td>
            <td>${m.m_name}</td>
            <td>${m.m_birth}</td>
            <td>${m.m_email}</td>
            <td>${m.m_tel}</td>
            <td>${m.m_join}</td>
            <td>
                <a href="/memberUpdateForm?m_no=${m.m_no}" class="action-link">수정</a>
                |
                <a href="/memberDelete?m_no=${m.m_no}" class="action-link">삭제</a>
            </td>
        </tr>
    </c:forEach>
</table>

<a href="/member/writeForm" class="register-btn">회원 등록</a>


</body>
</html>