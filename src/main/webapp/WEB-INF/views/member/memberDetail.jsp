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
<style>
	
	.title_size{
		height: 100px;
		background-color: #F0E6DB41;
		margin-top: 15px;
		margin-bottom: 50px;
		border-bottom: 1px solid #eee;
	}
	
	.title_inner{
		text-align:center;
		padding:20px;
		height:200px;
	}
	
	.title_font{
		font-size: 50px;
		font-weight: bold;
		color: #998e8e;
		letter-spacing: 10px;
	}
</style>
</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-7">

      <!-- 내정보 카드 -->
      <div class="card shadow-sm" style="margin-top: 80px; margin-bottom: 130px; padding-top: 20px; padding-bottom: 50px;">
        <div class="card-body p-4">
		
		<p class="title_font text-center">내 정보</p>
		<div class="title_size">
		<div class="title_inner">
          <div class="text-center" style="margin-bottom:40px;">
          	<img src="../css/person.png">
		  </div>
		 </div>
		</div>
		
          <table class="table table-bordered align-middle" style="margin-bottom: 50px;">
            <tbody>
              <tr>
                <th class="table-light" style="width:20%">번호</th>
                <td style="width:30%">${memberDetail.m_no}</td>
                <th class="table-light" style="width:20%">아이디</th>
                <td style="width:30%">${memberDetail.m_id}</td>
              </tr>
              <tr>
                <th class="table-light">성명</th>
                <td>${memberDetail.m_name}</td>
                <th class="table-light">생일</th>
                <td>${memberDetail.m_birth}</td>
              </tr>
              <tr>
                <th class="table-light">전화번호</th>
                <td>${memberDetail.m_tel}</td>
                <th class="table-light">가입일</th>
                <td>
                  <fmt:formatDate value="${memberDetail.m_join}" pattern="yyyy-MM-dd" />
                </td>
              </tr>
              <tr>
                <th class="table-light">이메일</th>
                <td colspan="3">${memberDetail.m_email}</td>
              </tr>
            </tbody>
          </table>

          <!-- 버튼 영역 -->
          <c:if test="${loginUser.m_id == memberDetail.m_id || loginUser.m_auth == 'ROLE_ADMIN'}">
            <div class="d-flex justify-content-center gap-3 mt-4">
              <button class="btn btn-primary"
                      onclick="location.href='/member/passwordCheckForm?mode=update'">
                정보 수정
              </button>
              <button class="btn btn-outline-primary"
                      onclick="location.href='/member/passwordCheckForm?mode=delete'">
                회원 탈퇴
              </button>
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
