<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 20px;
    border-bottom: 1px solid #ddd;
    margin-bottom: 20px;
}

header a {
    margin-left: 10px;
    text-decoration: none;
    color: #333;
    font-weight: 500;
}

header a:hover {
    color: #007bff;
}
</style>

<header>
    <!-- 로고 / 홈 -->
    <div>
        <a href="/">Mu잇다</a>
    </div>

    <!-- 로그인 영역 -->
    <div>
        <!-- 로그인 상태 -->
        <c:if test="${not empty sessionScope.loginId}">
            <span>
                ${sessionScope.loginName}님 환영합니다
            </span>
            <a href="/logout">로그아웃</a>
        </c:if>

        <!-- 비로그인 상태 -->
        <c:if test="${empty sessionScope.loginId}">
            <a href="/loginForm">로그인</a>
            <a href="/memberWriteForm">회원가입</a>
        </c:if>
    </div>
</header>
