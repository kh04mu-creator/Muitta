<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/bootstrap.css" />

<nav class="navbar bg-primary navbar-dark mb-4">
  <div class="container-fluid d-flex align-items-center">

    <!-- 🔹 로고 + 메뉴 묶음 -->
    <div class="d-flex align-items-center">

      <!-- 로고 -->
      <a class="navbar-brand me-4" href="/">Mu잇다</a>

      <!-- 메뉴 -->
      <ul class="navbar-nav flex-row mb-0">
        <li class="nav-item">
          <a class="nav-link px-3" href="/musicalList">뮤지컬</a>
        </li>
        <li class="nav-item">
          <a class="nav-link px-3" href="/review/reviewList">후기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link px-3" href="/exchange/exchangeList">거래</a>
        </li>

        <sec:authorize access="hasRole('ADMIN')">
          <li class="nav-item">
            <a class="nav-link px-3" href="/admin/memberList">회원목록</a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-3" href="/admin/mdPickList">MD</a>
          </li>
        </sec:authorize>

        <sec:authorize access="hasRole('USER')">
          <li class="nav-item">
            <a class="nav-link px-3" href="/member/memberDetail">내정보</a>
          </li>
        </sec:authorize>
      </ul>
    </div>

    <!-- 🔹 오른쪽 로그인 영역 -->
    <div class="d-flex align-items-center text-white ms-auto">

      <sec:authorize access="isAuthenticated()">
        <span class="me-3">
          <sec:authentication property="principal.username"/>님
        </span>

        <form action="/logout" method="post" class="mb-0">
          <input type="hidden"
                 name="${_csrf.parameterName}"
                 value="${_csrf.token}" />
          <button type="submit" class="btn btn-outline-light btn-sm">
            로그아웃
          </button>
        </form>
      </sec:authorize>

      <sec:authorize access="isAnonymous()">
        <a href="/loginForm" class="btn btn-outline-light btn-sm me-2">
          로그인
        </a>
        <a href="/memberWriteForm" class="btn btn-light btn-sm">
          회원가입
        </a>
      </sec:authorize>

    </div>
  </div>
</nav>

