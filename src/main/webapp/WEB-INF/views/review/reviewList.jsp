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
<title>후기목록</title>
<style>
.star-view {
  font-size: 18px;
}

.star-view .full,
.star-view .half {
  color: gold;
}

.star-view .empty {
  color: #ddd;
}
</style>



</head>
<body>
	<h3>후기목록</h3>
	<table border="1" width="500">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>별점</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
	<c:forEach var="dto" items="${r_list}">
		<tr>
			<td>${dto.r_no}</td>
			<td>
    			<a href="/review/reviewDetail?r_no=${dto.r_no}">
        			${dto.r_title}
    			</a>
			</td>
			<td>
			  <c:forEach begin="1" end="5" var="i">
			    <c:choose>
			      <c:when test="${dto.r_star >= i}">
			        <i class="fa-solid fa-star" style="color:gold;"></i>
			      </c:when>
			      <c:when test="${dto.r_star >= i - 0.5 && dto.r_star < i}">
			        <i class="fa-solid fa-star-half-stroke" style="color:gold;"></i>
			      </c:when>
			      <c:otherwise>
			        <i class="fa-regular fa-star" style="color:#ccc;"></i>
			      </c:otherwise>
			    </c:choose>
			  </c:forEach>
			</td>
			<td>${dto.r_writer}</td>
			<td>${dto.r_view}</td>
			<td><fmt:formatDate value="${dto.r_date}" pattern="yyyy-MM-dd(E)"/></td>
		</tr>
	</c:forEach>	
	</table>
	<button onclick="location.href='/review/reviewWriteForm'">
        글쓰기
    </button>
</body>
</html>