<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>회원정보수정</title>
</head>
<body>

	<h3>회원정보수정</h3>
	<form name="memberUpdateForm" method="post" action="/member/memberUpdate" enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="m_no" value="${memberUpdate.m_no}">
    <table>
	   	<tr>
	   		<td>아이디</td>
	   		<td>${memberUpdate.m_id}</td>
	   	</tr>
	   	<tr>
	   		<td>비밀번호</td>
	   		<td><input type="password" name="m_password" placeholder="새 비밀번호 입력"></td>
	   	</tr>
	   	<tr>
	   		<td>이름</td>
	   		<td><input type="text" name="m_name" id="m_name" value="${memberUpdate.m_name}"></td>
	   	</tr>
	   	<tr>
		    <td>성별</td>
		    <td>
		        <input type="radio" disabled name="m_gender" value="남"
		            <c:if test="${memberUpdate.m_gender eq '남'}">checked</c:if>> 남
		
		        <input type="radio" disabled name="m_gender" value="여"
		            <c:if test="${memberUpdate.m_gender eq '여'}">checked</c:if>> 여
		    </td>
		</tr>

	   	<tr>
	   		<td>생년월일</td>
	   		<td>${memberUpdate.m_birth}</td>
	   	</tr>
	   	<tr>
	   		<td>이메일</td>
	   		<td><input type="text" name="m_email" id="m_email" value="${memberUpdate.m_email}"></td>
	   	</tr>
	   	<tr>
	   		<td>전화</td>
	   		<td><input type="text" name="m_tel" id="m_tel" value="${memberUpdate.m_tel}"></td>
	   	</tr>
    </table>

    <input type="submit" value="수정 하기">
    <input type="reset" value="다시 쓰기">
	</form>
</body>
</html>