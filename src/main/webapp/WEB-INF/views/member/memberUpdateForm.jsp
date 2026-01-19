<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script>
function mupdate(){
	   let expPassword = /^[A-Za-z0-9!@#$%_]{8,12}$/; // 비밀번호는 영문대소문자, 숫자, !@#$%_, 비밀번호는 8자리 이상 12자리 이하
	   let expMtel = /^\d{2,3}-\d{3,4}-\d{4}$/;
	   let expMname = /^[가-힣]+$/;
	   let expMemail = /^([a-z0-9A-Z_\.-]+)@([a-z0-9A-Z_\.-]+)\.([a-zA-Z\.]{2,6})$/;
	   
	   let m_password = document.memberUpdateForm.m_password.value;
	   let m_name = document.memberUpdateForm.m_name.value;
	   let m_tel = document.memberUpdateForm.m_tel.value;
	   let m_email = document.memberUpdateForm.m_email.value;
	   
	   
	   if(!expPassword.test(m_password)){
	      alert("비밀번호는 영문대소문자,숫자, 특수기호(!,@,#,$,%,_)로 작성해야 합니다.\n8자리 이상 12자리 이하로 입력하십시오.");
	      document.memberUpdateForm.m_password.focus();
	      return false;
	   }
	   
	   if(!m_name || !expMname.test(m_name)){
	      alert("이름을 입력하지 않았거나 한글이 아닌 문자가 있습니다.");
	      document.memberUpdateForm.m_name.value="";
	      document.memberUpdateForm.m_name.focus();
	      return false;
	   }
	   
	   if(!m_email || !expMemail.test(m_email)){
	      alert("이메일 주소를 입력하지 않았거나 입력 형태가 올바르지 않습니다.");
	      document.memberUpdateForm.m_email.focus();
	      return false;
	   }
	   
	   if(!expMtel.test(m_tel)){
	      alert("연락처는 숫자와 -으로만 입력하십시오. 예)010-0000-0000");
	      document.memberUpdateForm.m_tel.value="";
	      document.memberUpdateForm.m_tel.focus();
	      return false;
	   }
	         
	   document.memberUpdateForm.submit();
	}
</script>
</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">

      <!-- 회원정보수정 카드 -->
      <div class="card shadow-sm">
        <div class="card-body p-4">

          <h4 class="text-center mb-4">회원정보 수정</h4>

          <form name="memberUpdateForm"
                method="post"
                action="/member/memberUpdate"
                enctype="multipart/form-data">

            <!-- CSRF -->
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}" />

            <!-- 회원 번호 -->
            <input type="hidden" name="m_no" value="${memberUpdate.m_no}">

            <!-- 아이디 (수정 불가) -->
            <div class="mb-3">
              <label class="form-label">아이디</label>
              <input type="text"
                     class="form-control"
                     value="${memberUpdate.m_id}"
                     readonly>
            </div>

            <!-- 비밀번호 -->
            <div class="mb-3">
              <label class="form-label">비밀번호</label>
              <input type="password"
                     name="m_password"
                     class="form-control"
                     placeholder="변경 시에만 입력">
              <div class="form-text">
                8자리 이상 12자리 이하로 입력하십시오.
              </div>
            </div>

            <!-- 이름 -->
            <div class="mb-3">
              <label class="form-label">이름</label>
              <input type="text"
                     name="m_name"
                     class="form-control"
                     value="${memberUpdate.m_name}">
            </div>

            <!-- 성별 (수정 불가) -->
            <div class="mb-3">
              <label class="form-label d-block">성별</label>

              <div class="form-check form-check-inline">
                <input class="form-check-input"
                       type="radio"
                       disabled
                       <c:if test="${memberUpdate.m_gender eq '남'}">checked</c:if>>
                <label class="form-check-label">남</label>
              </div>

              <div class="form-check form-check-inline">
                <input class="form-check-input"
                       type="radio"
                       disabled
                       <c:if test="${memberUpdate.m_gender eq '여'}">checked</c:if>>
                <label class="form-check-label">여</label>
              </div>
            </div>

            <!-- 생년월일 (수정 불가) -->
            <div class="mb-3">
              <label class="form-label">생년월일</label>
              <input type="text"
                     class="form-control"
                     value="${memberUpdate.m_birth}"
                     readonly>
            </div>

            <!-- 이메일 -->
            <div class="mb-3">
              <label class="form-label">이메일</label>
              <input type="text"
                     name="m_email"
                     class="form-control"
                     value="${memberUpdate.m_email}">
            </div>

            <!-- 전화번호 -->
            <div class="mb-3">
              <label class="form-label">전화번호</label>
              <input type="text"
                     name="m_tel"
                     class="form-control"
                     value="${memberUpdate.m_tel}">
            </div>

            <!-- 버튼 -->
            <div class="d-grid gap-2 mt-4">
              <input type="button" value="수정하기" onclick="mupdate();" class="btn btn-primary">
              <input type="reset" value="다시쓰기" class="btn btn-outline-secondary">
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
