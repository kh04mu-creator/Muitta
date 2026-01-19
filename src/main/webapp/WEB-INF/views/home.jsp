<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="common/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mu잇다 홈화면</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home_youtube.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home_mdPick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home_review.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home_muList.css">

<style>
.center-box {
  display: flex;
  justify-content: center; /* 가로 */
  align-items: center;     /* 세로 */
  font-weight: bold;
}
</style>

</head>
<body>

<div class="center-box" style="height:100px; font-size:1.5rem;">
  공연중인 뮤지컬
</div>
<section class="home-musical-section">  
    <div class="slider-wrapper">    
    	<button class="mu-btn prev">‹</button>    
        <div class="musical-slider">
            <c:forEach var="mu" items="${musicalList}">
                <div class="musical-card"
                     onclick="location.href='${pageContext.request.contextPath}/musicalDetail?mu_no=${mu.mu_no}'">
                    <img src="/images/${mu.mu_pupload}" class="musical-img">
                    <div class="musical-info">
                        <h6 class="musical-title">${mu.mu_title}</h6>
                        <p class="musical-date">${mu.mu_start} ~ ${mu.mu_end}</p>
                    </div>
                </div>
            </c:forEach>
        </div>        
        <button class="mu-btn next">›</button>
    </div>
</section>

<section class="home-youtube-section">
    <div class="home-container">
        <div class="center-box" style="height:100px; font-size:1.5rem;">
   Mu list 
</div>

        <div class="youtube-slider-wrap">
            <button class="slide-btn left" onclick="slideLeft()">‹</button>

            <div class="youtube-slider" id="youtubeSlider">
                <iframe src="https://www.youtube.com/embed/xAkPDUFhAd0"></iframe>
                <iframe src="https://www.youtube.com/embed/ajabjhn2k7c"></iframe>
                <iframe src="https://www.youtube.com/embed/xxfGSffuxJ8"></iframe>
                <iframe src="https://www.youtube.com/embed/D0r2aQ-M3Xs"></iframe>
                <iframe src="https://www.youtube.com/embed/kwJrrGU6jyg"></iframe>
            </div>

            <button class="slide-btn right" onclick="slideRight()">›</button>
        </div>
    </div>
</section>

<section class="home-md-section">
<div class="center-box" style="height:100px; font-size:1.5rem;">
   이달의 MD추천 뮤지컬 대사 
</div>
  
    <div class="home-container">
        <img src="/images/${md_upload}">
    </div>
</section>      
       

<section class="best-review-section">
<div class="center-box" style="height:100px; font-size:1.5rem;">
   베스트 관람후기 
</div>
   
    <div class="slider-wrapper">
        <!-- 좌우 버튼 -->
        <button class="slider-btn prev review-prev">&lt;</button>
        <div class="review-slider">
            <c:forEach var="review" items="${bestReviews}">
                <div class="review-card-small" onclick="location.href='${pageContext.request.contextPath}/review/reviewDetail?r_no=${review.r_no}'">
                    
                    <!-- 이미지 -->
                    <c:if test="${not empty review.r_upload}">
                        <img src="/images/${review.r_upload}" alt="후기 이미지" class="review-img-small">
                    </c:if>

                    <!-- 제목 + 내용 -->
                    <div class="review-info">
                        <h6 class="review-title">${review.r_title}</h6>
                        <p class="review-detail">${review.r_detail}</p>
                    </div>

                    <!-- 작성자 + 별점 -->
                    <small class="review-meta">
                        ${review.r_writer} | 
                        <span class="stars">
                            <c:set var="fullStars" value="${review.r_star.intValue()}" />
                            <c:set var="halfStar" value="${(review.r_star - fullStars) >= 0.5 ? 1 : 0}" />
                            <c:set var="emptyStars" value="${5 - fullStars - halfStar}" />

                            <c:forEach begin="1" end="${fullStars}" var="i">&#9733;</c:forEach>
                            <c:if test="${halfStar == 1}">&#9733;</c:if>
                            <c:forEach begin="1" end="${emptyStars}" var="i">&#9734;</c:forEach>
                        </span>
                    </small>
                </div>
            </c:forEach>
        </div>
        <button class="slider-btn next review-next">&gt;</button>
    </div>
</section>




<!-- 유튜브 -->
<script>
//유튜브 슬라이더 버튼
const ytSlider = document.getElementById("youtubeSlider");
const ytGap = 10; // gap

function getYTCardWidth() {
    return document.querySelector('#youtubeSlider iframe').offsetWidth + ytGap;
}

window.slideLeft = function() {
    const cardWidth = getYTCardWidth();
    if (ytSlider.scrollLeft <= 0) {
        ytSlider.scrollLeft = ytSlider.scrollWidth - ytSlider.clientWidth;
    } else {
        ytSlider.scrollBy({ left: -cardWidth, behavior: 'smooth' });
    }
};

window.slideRight = function() {
    const cardWidth = getYTCardWidth();
    if (ytSlider.scrollLeft + ytSlider.clientWidth >= ytSlider.scrollWidth) {
        ytSlider.scrollLeft = 0;
    } else {
        ytSlider.scrollBy({ left: cardWidth, behavior: 'smooth' });
    }
};


// review
// 후기 슬라이더
const reviewSlider = document.querySelector('.review-slider');
const reviewPrev = document.querySelector('.review-prev');
const reviewNext = document.querySelector('.review-next');
const reviewGap = 10;

function getReviewCardWidth() {
    return document.querySelector('.review-card-small').offsetWidth + reviewGap;
}

reviewPrev.addEventListener('click', () => {
    const w = getReviewCardWidth();
    if (reviewSlider.scrollLeft <= 0) {
        reviewSlider.scrollLeft = reviewSlider.scrollWidth - reviewSlider.clientWidth;
    } else {
        reviewSlider.scrollBy({ left: -w, behavior: 'smooth' });
    }
});

reviewNext.addEventListener('click', () => {
    const w = getReviewCardWidth();
    if (reviewSlider.scrollLeft + reviewSlider.clientWidth >= reviewSlider.scrollWidth) {
        reviewSlider.scrollLeft = 0;
    } else {
        reviewSlider.scrollBy({ left: w, behavior: 'smooth' });
    }
});


// 뮤지컬리스트 슬라이더
// 가운데 고정 회전 캐러셀
const slider = document.querySelector('.musical-slider');
let cards = Array.from(document.querySelectorAll('.musical-card'));

function render() {
    cards.forEach(card => card.classList.remove('active'));

    const centerIndex = Math.floor(cards.length / 2);
    cards[centerIndex].classList.add('active');

    slider.innerHTML = '';
    cards.forEach(card => slider.appendChild(card));
}


//초기 상태
render();

// 자동 회전
setInterval(() => {
    cards.push(cards.shift()); // 왼쪽 → 오른쪽 회전
    render();
}, 3000);

const prevBtn = document.querySelector('.mu-btn.prev');
const nextBtn = document.querySelector('.mu-btn.next');

function rotateLeft() {
    const last = cards.pop();
    cards.unshift(last);
    render();
}

function rotateRight() {
    const first = cards.shift();
    cards.push(first);
    render();
}

prevBtn.addEventListener('click', rotateLeft);
nextBtn.addEventListener('click', rotateRight);


</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>