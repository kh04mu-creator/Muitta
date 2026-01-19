<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>

</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-5">

      <!-- 비밀번호 확인 카드 -->
      <div class="card shadow-sm" style="margin-top: 80px; margin-bottom: 130px;">
        <div class="card-body p-4">

          <h4 class="text-center mb-3">비밀번호 확인</h4>

          <p class="text-center text-muted mb-4">
            회원정보 수정 및 탈퇴를 위해<br>
            비밀번호를 입력하세요.
          </p>

          <form method="post" action="/member/passwordCheck">
            <!-- CSRF -->
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}" />

            <!-- 분기용 -->
            <input type="hidden" name="mode" value="${mode}">

            <!-- 비밀번호 -->
            <div class="mb-3">
              <label class="form-label">비밀번호</label>
              <input type="password"
                     name="m_password"
                     class="form-control"
                     placeholder="비밀번호를 입력하세요"
                     required>
            </div>

            <!-- 버튼 -->
            <div class="d-grid mt-4">
              <button type="submit" class="btn btn-primary">
                확인
              </button>
            </div>
          </form>

          <!-- 에러 메시지 -->
          <c:if test="${not empty msg}">
            <div class="alert alert-danger text-center mt-3">
              ${msg}
            </div>
          </c:if>

        </div>
      </div>

    </div>
  </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
