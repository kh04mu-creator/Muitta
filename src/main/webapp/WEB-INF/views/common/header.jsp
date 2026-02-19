<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="/css/bootstrap.css" />
<link rel="stylesheet" href="/css/common.css" />
<link href="https://fonts.googleapis.com/css2?family=Chiron+GoRound+TC:wght@200..900&family=IBM+Plex+Sans+KR:wght@400;500&family=Tangerine:wght@400;700&display=swap" rel="stylesheet">


<!-- 상단 슬로건 바 -->
<div style="padding: 0.15rem; background-color: #F0E6DB; text-align: center;">
  <p style="color:#6E0808; margin:0;">
  <span class="tangerine-regular">Mu</span><span style="font-size:0.7rem;">잇다 : 뮤지컬과 관객을 잇다</span>
  </p>

</div>

<nav class="navbar bg-primary navbar-dark mb-4">
  <div class="container-fluid d-flex align-items-center">

    <!-- 로고 + 메뉴 -->
    <div class="d-flex align-items-center">

      <!-- 로고: 작은 화면에서 간격 줄이기 -->
      <a class="navbar-brand me-2 me-lg-4" href="/">
        <img src="/css/muittaLogo.png" alt="Mu잇다" class="navbar-logo">
      </a>

      <!-- 메뉴: 작은 화면에서 padding/간격 줄이기 -->
	<c:set var="uri" value="${pageContext.request.requestURI}" />
	
	<ul class="navbar-nav flex-row mb-0 gap-1 gap-lg-2">
	
	  <li class="nav-item">
	    <a class="nav-link px-2 px-lg-3 
	       ${fn:contains(uri,'musical') ? 'active fw-bold' : ''}"
	       href="/musicalList">뮤지컬</a>
	  </li>
	
	  <li class="nav-item">
	    <a class="nav-link px-2 px-lg-3
	       ${fn:contains(uri,'review') ? 'active fw-bold' : ''}"
	       href="/review/reviewList">후기</a>
	  </li>
	
	  <li class="nav-item">
	    <a class="nav-link px-2 px-lg-3
	       ${fn:contains(uri,'exchange') ? 'active fw-bold' : ''}"
	       href="/exchange/exchangeList">거래</a>
	  </li>
	
	  <sec:authorize access="hasRole('ADMIN')">
	    <li class="nav-item">
	      <a class="nav-link px-2 px-lg-3
	         ${fn:contains(uri,'memberList') ? 'active fw-bold' : ''}"
	         href="/admin/memberList">회원목록</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link px-2 px-lg-3
	         ${fn:contains(uri,'md') ? 'active fw-bold' : ''}"
	         href="/admin/mdPickList">MD</a>
	    </li>
	  </sec:authorize>
	
	  <sec:authorize access="hasAnyRole('USER','ADMIN')">
	    <li class="nav-item">
	      <a class="nav-link px-2 px-lg-3
	         ${fn:contains(uri,'memberDetail') ? 'active fw-bold' : ''}"
	         href="/member/memberDetail">내정보</a>
	    </li>
	  </sec:authorize>
	
	</ul>
	
	    </div>
	
	    <!-- 오른쪽 로그인 영역 -->
	    <div class="d-flex align-items-center text-white">
	
	      <sec:authorize access="isAuthenticated()">
	        
	        <a href="/mLikeList"
			   class="nav-link ${fn:contains(uri,'mLikeList') ? 'active fw-bold' : ''}"
			   style="margin-right:20px;">
			   ♡찜목록
			</a>
	
	        <span class="me-2 me-lg-3">
	          <sec:authentication property="principal.username"/>님
	        </span>
	
	        <form action="/logout" method="post" class="mb-0">
	          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	          <button type="submit" class="btn btn-outline-light btn-sm me-2 me-lg-4">로그아웃</button>
	        </form>
	      </sec:authorize>
	
	      <sec:authorize access="isAnonymous()">
	        <a href="/mLikeList"
			   class="nav-link px-2 px-lg-3 ${fn:contains(uri,'mLikeList') ? 'active fw-bold' : ''}">
			   ♡찜목록
			</a>
	        <img src="/css/register.png" alt="" style="height:18px; margin:0 6px;">
	        <a href="/loginForm" class="btn btn-outline-light btn-sm me-2">로그인</a>
	      </sec:authorize>
	
	    </div>
	
	  </div>
	</nav>
