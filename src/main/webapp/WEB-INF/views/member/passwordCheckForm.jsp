<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>

<h3>비밀번호 확인</h3>
<p>* 회원정보 수정 및 탈퇴를 위해 비밀번호를 입력하세요.</p>

<form method="post" action="/member/passwordCheck">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}" />

    <!-- 분기용 -->
    <input type="hidden" name="mode" value="${mode}">

    비밀번호 :
    <input type="password" name="m_password" required>

    <input type="submit" value="확인">
</form>

<c:if test="${not empty msg}">
    <p style="color:red;font-weight:bold">${msg}</p>
</c:if>

</body>
</html>
