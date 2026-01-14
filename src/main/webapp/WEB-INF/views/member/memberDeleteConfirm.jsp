<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<h3>회원 탈퇴</h3>

<p style="color:red">
    * 탈퇴 시 모든 정보가 삭제되며 복구할 수 없습니다.
</p>

<form method="post" action="/member/memberDelete">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}" />

    <input type="hidden" name="m_no" value="${loginUser.m_no}">

    <button type="submit">탈퇴하기</button>
    <button type="button" onclick="history.back()">취소</button>
</form>
</body>
</html>
