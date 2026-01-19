<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script>
function mcheck(){
   let expId = /^[A-Za-z0-9]+$/;
   let expPassword = /^[A-Za-z0-9!@#$%_]{8,12}$/;
   let expMtel = /^\d{2,3}-\d{3,4}-\d{4}$/;
   let expMname = /^[가-힣]+$/;
   let expMemail = /^([a-z0-9A-Z_\.-]+)@([a-z0-9A-Z_\.-]+)\.([a-zA-Z\.]{2,6})$/;
   let expBirth = /^[0-9]{8}$/;

   let f = document.memberWriteForm;

   if(!f.m_id.value || !expId.test(f.m_id.value)){
      alert("아이디는 영문대소문자, 숫자만 가능합니다.");
      f.m_id.focus(); return false;
   }
   if(!f.m_password.value || !expPassword.test(f.m_password.value)){
      alert("비밀번호는 8~12자리 영문, 숫자, 특수문자(!@#$%_)만 가능합니다.");
      f.m_password.focus(); return false;
   }
   if(!f.m_name.value || !expMname.test(f.m_name.value)){
      alert("이름은 한글만 입력하세요.");
      f.m_name.focus(); return false;
   }
   if(!f.m_birth.value || !expBirth.test(f.m_birth.value)){
      alert("생년월일은 8자리 숫자로 입력하세요.");
      f.m_birth.focus(); return false;
   }
   if(!f.m_email.value || !expMemail.test(f.m_email.value)){
      alert("이메일 형식이 올바르지 않습니다.");
      f.m_email.focus(); return false;
   }
   if(!expMtel.test(f.m_tel.value)){
      alert("전화번호 형식: 010-0000-0000");
      f.m_tel.focus(); return false;
   }

   f.submit();
}
</script>
</head>

<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">

      <!-- 회원가입 카드 -->
      <div class="card shadow-sm">
        <div class="card-body p-4">

          <h3 class="text-center mb-4">회원가입</h3>

          <form name="memberWriteForm" method="post" action="/memberWrite">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

            <!-- 아이디 -->
            <div class="mb-3">
              <label class="form-label">아이디</label>
              <input type="text" class="form-control" name="m_id" placeholder="영문, 숫자">
            </div>

            <!-- 비밀번호 -->
            <div class="mb-3">
              <label class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="m_password" placeholder="8~12자리">
            </div>

            <!-- 이름 -->
            <div class="mb-3">
              <label class="form-label">이름</label>
              <input type="text" class="form-control" name="m_name" placeholder="한글만 가능">
            </div>

            <!-- 성별 -->
            <div class="mb-3">
              <label class="form-label d-block">성별</label>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="m_gender" value="남">
                <label class="form-check-label">남</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="m_gender" value="여">
                <label class="form-check-label">여</label>
              </div>
            </div>

            <!-- 생년월일 -->
            <div class="mb-3">
              <label class="form-label">생년월일</label>
              <input type="text" class="form-control" name="m_birth" placeholder="YYYYMMDD">
            </div>

            <!-- 이메일 -->
            <div class="mb-3">
              <label class="form-label">이메일</label>
              <input type="text" class="form-control" name="m_email">
            </div>

            <!-- 전화 -->
            <div class="mb-3">
              <label class="form-label">전화번호</label>
              <input type="text" class="form-control" name="m_tel" placeholder="010-0000-0000">
            </div>

            <!-- 버튼 -->
            <div class="d-grid gap-2 mt-4">
              <button type="button" class="btn btn-primary" onclick="mcheck()">가입하기</button>
              <button type="reset" class="btn btn-outline-secondary">다시쓰기</button>
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
