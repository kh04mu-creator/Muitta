<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- Bootstrap CSS (header에 이미 있으면 중복 제거 가능) -->
<link rel="stylesheet" href="/css/bootstrap.css" />

</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-5">

      <!-- 로그인 카드 -->
      <div class="card shadow-sm" style="margin-top: 80px; margin-bottom: 130px;">
        <div class="card-body p-4">

          <h3 class="text-center mb-4">로그인</h3>

          <!-- 로그인 에러 -->
          <c:if test="${param.error != null}">
            <div class="alert alert-primary text-center">
              아이디 또는 비밀번호가 틀렸습니다.
            </div>
          </c:if>

          <form method="post" action="/login">

            <!-- CSRF 토큰 -->
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}" />

            <!-- 아이디 -->
            <div class="mb-3">
              <label class="form-label">아이디</label>
              <input type="text"
                     name="userId"
                     class="form-control"
                     placeholder="아이디를 입력하세요"
                     required>
            </div>

            <!-- 비밀번호 -->
            <div class="mb-3">
              <label class="form-label">비밀번호</label>
              <input type="password"
                     name="userPw"
                     class="form-control"
                     placeholder="비밀번호를 입력하세요"
                     required>
            </div>

            <!-- 버튼 -->
            <div class="d-grid gap-2 mt-4">
              <button type="submit" class="btn btn-primary">
                로그인
              </button>
              <button type="button"
                      class="btn btn-outline-secondary"
                      onclick="location.href='/memberWriteForm'">
                회원가입
              </button>
            </div>

          </form>

        </div>
      </div>

    </div>
  </div>
</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>
