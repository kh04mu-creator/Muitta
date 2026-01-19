<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 목록</title>

<style>
.star-view {
  font-size: 18px;
}

.star-view i {
  color: #FFD700; /* ⭐ 노란색 (gold) */
}

.star-view .empty {
  color: #ddd; /* 빈 별 */
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

</head>

<body>
<div class="title_size">
	<div class="title_inner">
		<span class="title_font">후기 목록</span>
	</div>
</div>

<div class="container py-4">

    <div class="container-fluid">
        <table class="table table-hover my-4"
               style="width:90%; margin:auto; text-align:center;">

            <thead class="table-light">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>별점</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                </tr>
            </thead>

            <tbody>
            <c:forEach var="dto" items="${r_list}">
                <tr>
                    <td>${dto.r_no}</td>

                    <td class="text-start">
                        <a href="/review/reviewDetail?r_no=${dto.r_no}"
                           class="text-decoration-none">
                            ${dto.r_title}
                        </a>
                    </td>

                    <td class="star-view">
                        <c:forEach begin="1" end="5" var="i">
                            <c:choose>
                                <c:when test="${dto.r_star >= i}">
                                    <i class="fa-solid fa-star"></i>
                                </c:when>
                                <c:when test="${dto.r_star >= i - 0.5 && dto.r_star < i}">
                                    <i class="fa-solid fa-star-half-stroke"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="fa-regular fa-star empty"></i>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </td>

                    <td>${dto.r_writer}</td>
                    <td>${dto.r_view}</td>
                    <td>
                        <fmt:formatDate value="${dto.r_date}"
                                        pattern="yyyy-MM-dd(E)" />
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
    
    <!-- 가운데 아래 글쓰기 버튼 -->
<div class="d-flex justify-content-center"
     style="width:90%; margin:auto;">
    <button onclick="location.href='/review/reviewWriteForm'"
            class="btn btn-primary">
        글쓰기
    </button>
</div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
