<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 등록</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
.width60 {
    width: 60%;
}

/* ⭐ 별점 */
.star-rating {
  font-size: 32px;
  display: flex;
}

.star {
  width: 32px;
  cursor: pointer;
}

.star i {
  color: #ddd;
}

.star i.full,
.star i.half {
  color: gold;
}

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


</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const stars = document.querySelectorAll('.star');
  const starInput = document.getElementById('r_star');

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
<div class="title_size">
	<div class="title_inner">
		<span class="title_font">후기 등록</span>
	</div>
</div>


<div class="container py-4">

    <form method="post"
          action="/review/reviewWrite"
          enctype="multipart/form-data">

        <!-- CSRF -->
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}" />

        <div class="container-fluid">
            <table class="table table-hover my-4"
                   style="width:70%; margin:auto;">

                <tr>
                    <td>제목</td>
                    <td>
                        <input type="text"
                               name="r_title"
                               class="form-control width60"
                               required>
                    </td>
                </tr>

                <tr>
                    <td>작성자</td>
                    <td>
                        ${pageContext.request.userPrincipal.name}
                    </td>
                </tr>

                <tr>
                    <td>별점</td>
                    <td>
                        <div class="star-rating">
                            <span class="star"><i class="fa-regular fa-star"></i></span>
                            <span class="star"><i class="fa-regular fa-star"></i></span>
                            <span class="star"><i class="fa-regular fa-star"></i></span>
                            <span class="star"><i class="fa-regular fa-star"></i></span>
                            <span class="star"><i class="fa-regular fa-star"></i></span>
                        </div>
                        <input type="hidden" name="r_star" id="r_star" value="5">
                    </td>
                </tr>

                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="r_detail"
                                  rows="8"
                                  class="form-control width60"
                                  required></textarea>
                    </td>
                </tr>

                <tr>
                    <td>파일</td>
                    <td>
                        <input type="file"
                               name="file"
                               class="form-control width60">
                    </td>
                </tr>

            </table>
        </div>

        <div class="text-center">
            <input type="submit" value="후기 등록" class="btn btn-primary">
            <input type="reset" value="다시 쓰기" class="btn btn-outline-primary">
        </div>

    </form>

</div>

</body>
</html>
