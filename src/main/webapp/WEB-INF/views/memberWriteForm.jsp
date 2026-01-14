<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<script>
function mcheck(){
   let expId = /^[A-Za-z0-9]+$/; // 아이디는 영문대소문자, 숫자가 한 번 이상 반복
   let expPassword = /^[A-Za-z0-9!@#$%_]{8,12}$/; // 비밀번호는 영문대소문자, 숫자, !@#$%_, 비밀번호는 8자리 이상 12자리 이하
   let expMtel = /^\d{2,3}-\d{3,4}-\d{4}$/;
   let expMname = /^[가-힣]+$/;
   let expMemail = /^([a-z0-9A-Z_\.-]+)@([a-z0-9A-Z_\.-]+)\.([a-zA-Z\.]{2,6})$/;
   let expBirth = /^[0-9]{8}$/; // 생년월일은 숫자만 가능, 생년월일은 8자리
   
   let m_id = document.memberWriteForm.m_id.value;
   let m_password = document.memberWriteForm.m_password.value;
   let m_name = document.memberWriteForm.m_name.value;
   let m_birth = document.memberWriteForm.m_birth.value;
   let m_tel = document.memberWriteForm.m_tel.value;
   let m_email = document.memberWriteForm.m_email.value;
   
   if(!m_id || !expId.test(m_id)){
      alert("아이디는 영문대소문자, 숫자로만 작성해야 합니다.");
      document.memberWriteForm.m_id.focus();
      return false;
   }
   
   if(!m_password || !expPassword.test(m_password)){
      alert("비밀번호는 영문대소문자,숫자, 특수기호(!,@,#,$,%,_)로 작성해야 합니다.\n8자리 이상 12자리 이하로 입력하십시오.");
      document.memberWriteForm.m_password.focus();
      return false;
   }
   
   if(!m_name || !expMname.test(m_name)){
      alert("이름을 입력하지 않았거나 한글이 아닌 문자가 있습니다.");
      document.memberWriteForm.m_name.value="";
      document.memberWriteForm.m_name.focus();
      return false;
   }
   
   if(!m_birth || !expBirth.test(m_birth)){
      alert("생년월일을 입력하지 않았거나 숫자가 아닌 문자가 있습니다.\n생년월일은 8자리로 입력하세요!");
      document.memberWriteForm.m_birth.value = "";
      document.memberWriteForm.m_birth.focus();
      return false;
   }
   
   if(!m_email || !expMemail.test(m_email)){
      alert("이메일 주소를 입력하지 않았거나 입력 형태가 올바르지 않습니다.");
      document.memberWriteForm.m_email.focus();
      return false;
   }
   
   if(!expMtel.test(m_tel)){
      alert("연락처는 숫자와 -으로만 입력하십시오. 예)010-0000-0000");
      document.memberWriteForm.m_tel.value="";
      document.memberWriteForm.m_tel.focus();
      return false;
   }
         
   document.memberWriteForm.submit();
}
</script>

</head>
<body>

	<h3>회원가입</h3>
<form name="memberWriteForm" method="post" action="/memberWrite">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   <table>
	   	<tr>
	   		<td>아이디</td>
	   		<td><input type="text" name="m_id" id="m_id"></td>
	   	</tr>
	   	<tr>
	   		<td>비밀번호</td>
	   		<td><input type="password" name="m_password" id="m_password" placeholder="8~12자리"></td>
	   	</tr>
	   	<tr>
	   		<td>이름</td>
	   		<td><input type="text" name="m_name" id="m_name" placeholder="한글만 가능"></td>
	   	</tr>
	   	<tr>
	   		<td>성별</td>
	   		<td><input type="radio" name="m_gender" id="gender_m" value="남">남
	   			<input type="radio" name="m_gender" id="gender_f" value="여">여
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>생년월일</td>
	   		<td><input type="text" name="m_birth" id="m_birth" placeholder="ex)20001010"></td>
	   	</tr>
	   	<tr>
	   		<td>이메일</td>
	   		<td><input type="text" name="m_email" id="m_email"></td>
	   	</tr>
	   	<tr>
	   		<td>전화</td>
	   		<td><input type="text" name="m_tel" id="m_tel" placeholder="ex)010-0000-0000"></td>
	   	</tr>
	   	<tr>
	   		<td>권한</td>
	   		<td>
	   		<input type="radio" name="m_auth" id="m_auth_admin" value="ADMIN">관리자
			<input type="radio" name="m_auth" id="m_auth_user" value="USER">회원
			</td>
	   	</tr>
   </table>

   <input type="button" onclick="mcheck()" value="가입 하기">
   <input type="reset" value="다시 쓰기">
</form>
</body>
</html>