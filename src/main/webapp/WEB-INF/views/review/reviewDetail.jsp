<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="/css/bootstrap.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기글 상세보기</title>
<style>
.title_size{
		height: 200px;
		background-color: #F0E6DB41;
		margin-top: 85px;
		margin-bottom: 50px;
		border-bottom: 1px solid #eee;
	}
	
	.title_inner{
		text-align:center;
		padding:60px;
		height:200px;
	}
	
	.title_font{
		font-size: 50px;
		font-weight: bold;
		color: #998e8e;
		letter-spacing: 10px;
	}

.card {
    border-radius: 12px;
    padding: 20px;
}
.review-title {
    margin-bottom: 20px;
}


.review-row {
    display: flex;
    gap: 20px;
    margin-bottom: 15px;
    align-items: center;
}
.review-img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 8px;
}
.review-info {
    flex: 1;
    font-size: 14px;
    color: #555;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.review-info span {
    display: block;
    margin-bottom: 5px;
}
.star-rating i {
    color: gold;
    margin-right: 2px;
}
.card-text {
    margin-bottom: 15px;
    line-height: 1.6;
}

.like-section {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 12px;   /* ⭐ 여기 숫자 키우면 간격 넓어짐 */
}


.like-form {
    margin: 0;
}

.like-btn {
    all: unset;
    cursor: pointer;

    display: inline-flex;
    align-items: center;
    gap: 6px;
}

.like-btn i {
    font-size: 20px;
    line-height: 1;
}

.like-btn .like-count {
    font-size: 16px;
    line-height: 1;
}



.action-buttons button, .action-buttons form button {
    margin-right: 10px;
}

.action-buttons .btn {
	margin-top: 20px;
    min-width: 90px;
    height: 38px;
    padding: 6px 16px;
}


/* 퀵바 */
.quickbar {
    position: sticky;
    top: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    background-color: #f9f9f9;
    max-height: 80vh;
    overflow-y: auto;
}
.quickbar h5 {
    margin-bottom: 15px;
    font-weight: bold;
}
.quickbar li {
    margin-bottom: 10px;
}
.quickbar li a {
    display: block;
    padding: 5px;
    border-radius: 4px;
    text-decoration: none;
    color: #333;
}
.quickbar li a:hover {
    background-color: #e9ecef;
}
.quickbar .star-rating i {
    font-size: 12px;
}
.quickbar .review-preview {
    display: flex;
    gap: 10px;
    align-items: center;
}
.quickbar .review-preview img {
    width: 50px;
    height: 50px;
    object-fit: cover;
    border-radius: 4px;
}
.quickbar .review-preview .info {
    font-size: 12px;
}
</style>
</head>
<body>
<div class="title_size">
	<div class="title_inner">
		<span class="title_font">후기</span>
	</div>
</div>

<div class="container my-5">
    <div class="row">
        <!-- 후기 상세 -->
        <div class="col-lg-8">
            <div class="card shadow-sm">

                <h2 class="review-title">${reviewDetail.r_title}</h2>
				<div class="review-center">
                <div class="review-row">
                    <c:if test="${not empty reviewDetail.r_upload}">
                        <img src="/images/${reviewDetail.r_upload}" class="review-img" alt="후기 이미지" />
                    </c:if>
                    <div class="review-info">
                        <span><strong>번호:</strong> ${reviewDetail.r_no}</span>
                        <span><strong>작성자:</strong> ${reviewDetail.r_writer}</span>
                        <span><strong>조회수:</strong> ${reviewDetail.r_view}</span>
                        <span><strong>작성일:</strong> 
                            <fmt:formatDate value="${reviewDetail.r_date}" pattern="yyyy-MM-dd"/>
                        </span>
                        <span class="star-rating">
                            <c:forEach begin="1" end="5" var="i">
                                <c:choose>
                                    <c:when test="${reviewDetail.r_star >= i}">
                                        <i class="fa-solid fa-star"></i>
                                    </c:when>
                                    <c:when test="${reviewDetail.r_star >= (i - 0.5)}">
                                        <i class="fa-solid fa-star-half-stroke"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-regular fa-star" style="color:#ccc;"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </span>
                    </div>
                </div>
                </div>

                <p class="card-text" style="white-space: pre-line;">${reviewDetail.r_detail}</p>

                <div class="like-section">
    <c:choose>
        <c:when test="${empty pageContext.request.userPrincipal}">
            <i class="fa-regular fa-heart text-muted"
               style="cursor:pointer; font-size:20px;"
               onclick="alert('로그인 후 공감할 수 있습니다');"></i>
            <span class="like-count">${likeCount}</span>
        </c:when>
        <c:otherwise>
            <form action="/review/likeToggle" method="post" class="like-form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="r_no" value="${reviewDetail.r_no}" />
                <c:choose>
                    <c:when test="${likeCheck > 0}">
                        <button type="submit" class="like-btn">
                            <i class="fa-solid fa-heart text-primary" style="font-size:20px;"></i>
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="btn btn-link p-0">
                            <i class="fa-regular fa-heart text-secondary" style="font-size:20px;"></i>
                        </button>
                    </c:otherwise>
                </c:choose>
            </form>
            <span class="like-count">${likeCount}</span>
        </c:otherwise>
    </c:choose>
</div>

                <div class="action-buttons d-flex justify-content-center">

    <c:if test="${loginId == reviewDetail.r_writer}">
        <button type="button" class="btn btn-primary"
                onclick="location.href='/review/reviewUpdate?r_no=${reviewDetail.r_no}'">
            수정
        </button>

        <form action="${pageContext.request.contextPath}/review/reviewDelete"
              method="post" style="display:inline;">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="r_no" value="${reviewDetail.r_no}" />
            <button type="submit" class="btn btn-outline-primary"
                    onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
        </form>
         
    </c:if>
</div>

            </div>
        </div>

        
        <!-- 오른쪽 퀵바 -->
<div class="col-lg-4">
    <div class="quickbar">
        <h5>최근 후기 목록</h5>
        <ul class="list-unstyled">

            <c:forEach var="review" items="${r_list}">
                <li>
                    <a href="/review/reviewDetail?r_no=${review.r_no}">
                        <div class="review-preview">

                            <c:if test="${not empty review.r_upload}">
                                <img src="/images/${review.r_upload}" alt="썸네일">
                            </c:if>

                            <div class="info">
                                <strong>${review.r_title}</strong><br/>

                                <div class="star-rating">
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:choose>
                                            <c:when test="${review.r_star >= i}">
                                                <i class="fa-solid fa-star"></i>
                                            </c:when>
                                            <c:when test="${review.r_star >= (i - 0.5)}">
                                                <i class="fa-solid fa-star-half-stroke"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fa-regular fa-star" style="color:#ccc;"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </a>
                </li>
            </c:forEach>

        </ul>
    </div>
</div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
