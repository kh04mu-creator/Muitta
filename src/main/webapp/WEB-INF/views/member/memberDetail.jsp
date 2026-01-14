<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
</head>
<body>

<h3>내정보</h3>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<table border="1" width="500">
    <tr>
        <td>번호</td>
        <td>${memberDetail.m_no}</td>
        <td>아이디</td>
        <td>${memberDetail.m_id}</td>
    </tr>
    <tr>
        <td>성명</td>
        <td>${memberDetail.m_name}</td>
        <td>생일</td>
        <td>${memberDetail.m_birth}</td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td>${memberDetail.m_tel}</td>
        <td>가입일</td>
        <td><fmt:formatDate value="${memberDetail.m_join}" pattern="yyyy-MM-dd" /></td>
    </tr>
    <tr>
        <td>이메일</td>
        <td colspan="3">${memberDetail.m_email}</td>
    </tr>
</table>

<!-- 🔐 본인 or 관리자만 -->
<c:if test="${loginUser.m_id == memberDetail.m_id || loginUser.m_auth == 'ROLE_ADMIN'}">

    <button onclick="location.href='/member/passwordCheckForm?mode=update'">
    	수정
	</button>
    <button onclick="location.href='/member/passwordCheckForm?mode=delete'">
	    회원탈퇴
	</button>

</c:if>

</body>
</html>
