<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-5">

      <!-- 회원탈퇴 카드 (primary 테두리) -->
      <div class="card border-primary shadow-sm" style="margin-top: 80px; margin-bottom: 130px;">
        <div class="card-body p-4">

          <h4 class="text-center mb-3">회원 탈퇴</h4>

          <!-- 🔵 Primary 강조 경고 -->
          <div class="alert alert-primary text-center fw-bold mb-4">
            탈퇴 시 모든 정보가 삭제되며<br>
            <span class="fs-6">복구할 수 없습니다.</span>
          </div>

          <form method="post" action="/member/memberDelete">
            <!-- CSRF -->
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}" />

            <!-- 회원 번호 -->
            <input type="hidden" name="m_no" value="${loginUser.m_no}">

            <!-- 버튼 -->
            <div class="d-grid gap-2 mt-4">
              <button type="submit" class="btn btn-primary">
                탈퇴하기
              </button>
              <button type="button"
                      class="btn btn-outline-secondary"
                      onclick="history.back()">
                취소
              </button>
            </div>

          </form>

        </div>
      </div>

    </div>
  </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
