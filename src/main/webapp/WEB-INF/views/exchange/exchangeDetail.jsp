<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- Bootstrap -->
<link rel="stylesheet" href="/css/bootstrap.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓거래 상세보기</title>
<style>
/* 전체 컨테이너 중앙 */
.exchange-wrapper {
    max-width: 900px;
    margin: 0 auto;
}

/* 카드 */
.card {
    border-radius: 14px;
}
.card-body {
    padding: 30px;    
}

/* 제목 */
.card-title {
    margin-bottom: 25px;
    font-weight: 600;
}

/* 이미지 + 정보 */
.exchange-info {
    display: flex;
    justify-content: center;
    align-items: center;   /* 세로 중앙 */
    gap: 30px;
    margin-bottom: 25px;
}

.exchange-img {
    width: 500px;
    height: 360px;
    object-fit: cover;
    border-radius: 10px;
}
.exchange-text {
    display: flex;
    flex-direction: column;
    justify-content: center;   /* 세로 중앙 */
}

.exchange-text p {
    margin-bottom: 8px;
}

/* 본문 */
.card-text {
    margin: 30px 0;
    line-height: 1.7;
}

/* 버튼 중앙 */
.action-buttons {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin-top: 25px;
}

/* 댓글 영역 */
.comment-area {
    margin-top: 50px;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.comment-area .card {
    width: 100%;
    max-width: 700px;
}

/* 댓글 입력 */
.comment-form {
    width: 100%;
    max-width: 680px;
    margin-top: 20px;
}
.comment-form .mb-2 {
    display: flex;
    gap: 10px;
}


/* 상단 타이틀 */
.title_size {
    height: 200px;
    background-color: #F0E6DB41;
    margin-top: 85px;
    margin-bottom: 60px;
    border-bottom: 1px solid #eee;
}
.title_inner {
    text-align: center;
    padding: 60px;
}
.title_font {
    font-size: 50px;
    font-weight: bold;
    color: #998e8e;
    letter-spacing: 10px;
}
</style>
</head>

<body>

<div class="title_size">
    <div class="title_inner">
        <span class="title_font">티켓거래</span>
    </div>
</div>

<div class="container py-4">
    <div class="exchange-wrapper">

        <!-- 거래 상세 카드 -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">

                <h3 class="card-title text-center">
                    ${exdetail.ex_title}
                </h3>

                <!-- 이미지 + 정보 -->
                <div class="exchange-info">
                    <img src="/images/${exdetail.ex_upload}" class="exchange-img">
                    <div class="exchange-text">
                        <p><strong>거래번호 :</strong> ${exdetail.ex_no}</p>
                        <p><strong>작성자 :</strong> ${exdetail.ex_writer}</p>
                        <p><strong>작성일 :</strong>
                            <fmt:formatDate value="${exdetail.ex_date}" pattern="yyyy-MM-dd"/>
                        </p>
                        <p><strong>거래현황 :</strong> ${exdetail.ex_ing}</p>
                    </div>
                </div>

                <!-- 상세 내용 -->
                <p class="card-text text-center">
				    ${exdetail.ex_detail}
				</p>


                <!-- 버튼 -->
                <div class="action-buttons">
                    <button class="btn btn-primary"
                            onclick="location.href='/exchange/exchangeList'">
                        목록
                    </button>

                    <c:if test="${pageContext.request.userPrincipal ne null &&
                                 (pageContext.request.userPrincipal.name eq exdetail.ex_writer
                                  || pageContext.request.userPrincipal.name eq 'admin')}">

                        <button class="btn btn-outline-primary"
                                onclick="location.href='/exchange/exchangeUpdateForm?ex_no=${exdetail.ex_no}'">
                            수정
                        </button>

                        <a class="btn btn-outline-primary"
                           href="/exchangeDelete?ex_no=${exdetail.ex_no}"
                           onclick="return confirm('정말 삭제하시겠습니까?');">
                            삭제
                        </a>
                    </c:if>
                </div>

                <!-- 댓글 영역 -->
                <div class="comment-area">
                    <c:forEach var="comm" items="${commList}">
    <div class="card border-secondary mb-2">

        <!-- 헤더 세로폭 줄이기 -->
        <div class="card-header d-flex justify-content-between align-items-center py-1 px-2">
    <div>
        <b>${comm.exc_writer}</b>
        <small class="text-muted ms-1">
            <fmt:formatDate value="${comm.exc_date}" pattern="yyyy-MM-dd"/>
        </small>
    </div>

    <c:if test="${pageContext.request.userPrincipal ne null &&
                 (pageContext.request.userPrincipal.name eq comm.exc_writer
                  || pageContext.request.userPrincipal.name eq 'admin')}">

        <form action="/exchange/exCommDelete"
              method="post"
              class="mb-0 d-flex align-items-center"
              onsubmit="return confirm('댓글을 삭제하시겠습니까?');">

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input type="hidden" name="exc_no" value="${comm.exc_no}">
            <input type="hidden" name="ex_no" value="${comm.ex_no}">

            <button class="btn btn-sm btn-outline-primary py-0 px-2">
                삭제
            </button>
        </form>
    </c:if>
</div>

        <!-- 바디 세로폭 줄이기 -->
        <div class="card-body py-2 px-2 lh-sm">
            ${comm.exc_detail}
        </div>

    </div>
</c:forEach>


                    <!-- 댓글 작성 -->
                    <form class="comment-form" method="post" action="/exchange/exCommWrite">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <input type="hidden" name="ex_no" value="${exdetail.ex_no}">
                        <div class="mb-2">
                            <input type="text" class="form-control" name="exc_detail"
                                   placeholder="댓글을 입력해주세요.">                                   
                            <button class="btn btn-primary btn-sm px-4 text-nowrap">등록</button>
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

