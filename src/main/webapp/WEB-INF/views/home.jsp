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
.center-box{
  display:flex;
  justify-content:center;
  align-items:center;
  font-weight:bold;
  margin-top:50px;
  height:100px;
  font-size:1.8rem;
  letter-spacing:2px;
  color:#444;
}

/* ⭐ 양옆 선 */
.center-box::before,
.center-box::after{
  content:"";
  width:80px;      /* ⭐ 선 길이 */
  height:3px;
  align-items:flex-end; 
  background:#d9230f;
  transform: translateY(8px);
}

.center-box::before{
  margin-right:15px;
}

.center-box::after{
  margin-left:15px;
}

</style>

</head>
<body>

<div class="center-box">
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
        <div class="center-box">
 		  뮤지컬 예고편 
		</div>
        <div class="youtube-slider-wrap">
            <button class="slide-btn left" onclick="slideLeft()">&lt;</button>
            <div id="youtubeSlider" class="youtube-slider" id="youtubeSlider">
                <iframe src="https://www.youtube.com/embed/xAkPDUFhAd0"></iframe>
                <iframe src="https://www.youtube.com/embed/ajabjhn2k7c"></iframe>
                <iframe src="https://www.youtube.com/embed/xxfGSffuxJ8"></iframe>
                <iframe src="https://www.youtube.com/embed/D0r2aQ-M3Xs"></iframe>
                <iframe src="https://www.youtube.com/embed/kwJrrGU6jyg"></iframe>
            </div>
            <button class="slide-btn right" onclick="slideRight()">&gt;</button>
        </div>
    </div>
</section>

<section class="home-md-section">
<div class="center-box">
   이달의 MD추천 뮤지컬 대사 
</div>
  
    <div class="home-container">
        <img src="/images/${md_upload}">
    </div>
</section>      
       

<section class="best-review-section">
	<div class="center-box">
	   베스트 관람후기 
	</div>
<div class="review-container"> 
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
</div>	
    
</section>


<!-- 유튜브 -->
<script>
const ytSlider = document.getElementById("youtubeSlider");
const ytGap = 10;

let cardWidth = 0;
let cloneCount = 0;
let index = 0;
let isJumping = false;

function calcCardWidth(){
  const first = ytSlider.querySelector("iframe");
  if(!first) return 0;

  // iframe이 0으로 나올 때 대비: getBoundingClientRect 사용
  const w = first.getBoundingClientRect().width;
  return Math.round(w + ytGap);
}

function initInfinite(){
  if(!ytSlider) return;

  // 카드가 최소 1개 있어야 함
  const originals = Array.from(ytSlider.querySelectorAll("iframe"));
  if(originals.length === 0) return;

  // 너비 계산 (0이면 잠깐 뒤에 다시 시도)
  cardWidth = calcCardWidth();
  if(cardWidth <= ytGap){
    setTimeout(initInfinite, 200);
    return;
  }

  // 화면에 몇 개 보이는지 기반으로 cloneCount 결정(최소 1)
  const visibleCount = Math.max(1, Math.round(ytSlider.getBoundingClientRect().width / cardWidth));
  cloneCount = Math.min(visibleCount, originals.length);

  // 앞/뒤 클론 붙이기
  const headClones = originals.slice(-cloneCount).map(n => n.cloneNode(true));
  const tailClones = originals.slice(0, cloneCount).map(n => n.cloneNode(true));

  headClones.forEach(n => ytSlider.prepend(n));
  tailClones.forEach(n => ytSlider.append(n));

  // 시작 위치를 “진짜 첫 카드”로 이동
  index = cloneCount;
  ytSlider.scrollLeft = index * cardWidth;

  // 스냅(선택) - 흔들림 줄이기
  ytSlider.style.scrollBehavior = "smooth";
}

// 버튼 이동
function go(newIndex){
  if(!cardWidth) return;

  index = newIndex;
  ytSlider.scrollTo({ left: index * cardWidth, behavior: "smooth" });
}

window.slideLeft = function(){
  go(index - 1);
};

window.slideRight = function(){
  go(index + 1);
};

// 무한 점프 보정: 스크롤이 끝 클론 영역으로 가면 즉시 진짜 영역으로 점프
ytSlider.addEventListener("scroll", () => {
  if(isJumping || !cardWidth) return;

  const maxIndex = ytSlider.children.length - cloneCount - 1; // 마지막 "진짜" 끝쪽 위치에 근접한 인덱스

  // 왼쪽 클론 영역으로 넘어감
  if(index <= cloneCount - 1 && ytSlider.scrollLeft <= (cloneCount - 1) * cardWidth + 2){
    isJumping = true;
    index = ytSlider.children.length - (cloneCount * 2);
    ytSlider.style.scrollBehavior = "auto";
    ytSlider.scrollLeft = index * cardWidth;
    ytSlider.style.scrollBehavior = "smooth";
    setTimeout(() => isJumping = false, 50);
  }

  // 오른쪽 클론 영역으로 넘어감
  const rightLimit = (ytSlider.children.length - cloneCount) * cardWidth;
  if(index >= ytSlider.children.length - cloneCount && ytSlider.scrollLeft >= rightLimit - 2){
    isJumping = true;
    index = cloneCount;
    ytSlider.style.scrollBehavior = "auto";
    ytSlider.scrollLeft = index * cardWidth;
    ytSlider.style.scrollBehavior = "smooth";
    setTimeout(() => isJumping = false, 50);
  }
});

// ✅ 로딩 타이밍 안정화: DOM 준비 + 약간 지연
document.addEventListener("DOMContentLoaded", () => {
  setTimeout(initInfinite, 150);
});

// ✅ 창 크기 변하면 다시 계산(필요하면 새로고침 대신 재로드)
window.addEventListener("resize", () => {
  // 간단히 새로고침이 가장 확실(원하면 더 정교하게 재초기화도 가능)
  // location.reload();
});



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