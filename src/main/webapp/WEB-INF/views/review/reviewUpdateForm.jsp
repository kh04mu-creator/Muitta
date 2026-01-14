<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<meta charset="UTF-8">
<title>후기 내용 수정</title>

<style>
.star-rating {
  font-size: 32px;
  display: flex;
}

.star {
  position: relative;
  width: 32px;
  cursor: pointer;
}

.star::before {
  content: '';
  position: absolute;
  left: 0;
  width: 50%;
  height: 100%;
  z-index: 2;
}

.star::after {
  content: '';
  position: absolute;
  right: 0;
  width: 50%;
  height: 100%;
  z-index: 2;
}

.star i {
  color: #ddd;
}

.star i.full {
  color: gold;
}

.star i.half {
  color: gold;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const stars = document.querySelectorAll('.star');
  const starInput = document.getElementById('r_star');
  const currentRating = ${reviewUpdate.r_star}; // 기존 별점

  // ⭐ 기존 별점 세팅
  starInput.value = currentRating;

  stars.forEach((s, i) => {
    const icon = s.querySelector('i');
    icon.className = 'fa-regular fa-star';

    if (i + 1 <= currentRating) {
      icon.className = 'fa-solid fa-star full';
    } else if (i + 0.5 === currentRating) {
      icon.className = 'fa-solid fa-star-half-stroke half';
    }
  });

  // ⭐ 클릭 이벤트
  stars.forEach((star, index) => {
    star.addEventListener('click', (e) => {
      const rect = star.getBoundingClientRect();
      const isHalf = (e.clientX - rect.left) < rect.width / 2;

      let rating = index + 1;
      if (isHalf) rating -= 0.5;

      starInput.value = rating;

      stars.forEach((s, i) => {
        const icon = s.querySelector('i');
        icon.className = 'fa-regular fa-star';

        if (i + 1 <= rating) {
          icon.className = 'fa-solid fa-star full';
        } else if (i + 0.5 === rating) {
          icon.className = 'fa-solid fa-star-half-stroke half';
        }
      });
    });
  });
});
</script>




</head>
<body>
	<h3>후기 내용 수정</h3>
	<form name="reviewUpdateForm" method="post" action="/review/reviewUpdate" enctype="multipart/form-data">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" name="r_no" value="${reviewUpdate.r_no}">
    <table>
      <tr>
         <td>제목</td>
         <td><input type="text" name="r_title" id="r_title" value="${reviewUpdate.r_title}"></td>
      </tr>
      <tr>
         <td>작성자</td>
         <td>${reviewUpdate.r_writer}</td>
      </tr>
      <tr>
         <td>별점</td>
         <td>
		  <div class="star-rating" value="${reviewUpdate.r_star}">
		    <span class="star" data-value="1">
		      <i class="fa-regular fa-star"></i>
		    </span>
		    <span class="star" data-value="2">
		      <i class="fa-regular fa-star"></i>
		    </span>
		    <span class="star" data-value="3">
		      <i class="fa-regular fa-star"></i>
		    </span>
		    <span class="star" data-value="4">
		      <i class="fa-regular fa-star"></i>
		    </span>
		    <span class="star" data-value="5">
		      <i class="fa-regular fa-star"></i>
		    </span>
		  </div>
		  <input type="hidden" name="r_star" id="r_star">
		</td>
         
      </tr>
      <tr>
         <td>내용</td>
         <td><textarea rows="10" cols="60" name="r_detail" id="r_detail">${reviewUpdate.r_detail}</textarea></td>
      </tr>
      <tr>
		  <td>파일</td>
		  <td>
		    현재 파일: ${reviewUpdate.r_upload}<br>
		    <input type="file" name="uploadFile" >
		  </td>
		</tr>
    </table>
   
    <input type="submit" value="수정">
    <input type="reset" value="다시 쓰기">
	</form>
</body>
</html>