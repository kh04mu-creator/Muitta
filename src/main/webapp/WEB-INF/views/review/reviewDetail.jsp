<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기글 상세보기</title>
</head>
<body>
	<h3>후기글 상세보기</h3>
	<table border="1" width="700">
    <tr>
        <td rowspan="4"><img src="/images/${reviewDetail.r_upload}" class="reviewDetail" /></td>
        <td>번호</td>
        <td> ${reviewDetail.r_no}</td>
        <td>조회수</td>
        <td> ${reviewDetail.r_view}</td>
    </tr>
    <tr>
        <td>작성자</td>
        <td>${reviewDetail.r_writer}</td>
        <td>작성일</td>
        <td>
            <fmt:formatDate value="${reviewDetail.r_date}" pattern="yyyy-MM-dd" />
        </td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${reviewDetail.r_title}</td>
    </tr>
    <tr>
        <td>별점</td>
        <td colspan="3">
		    <c:forEach begin="1" end="5" var="i">
		        <c:choose>
		            <c:when test="${reviewDetail.r_star >= i}">
		                <i class="fa-solid fa-star" style="color:gold;"></i>
		            </c:when>
		            <c:when test="${reviewDetail.r_star >= (i - 0.5)}">
		                <i class="fa-solid fa-star-half-stroke" style="color:gold;"></i>
		            </c:when>
		            <c:otherwise>
		                <i class="fa-regular fa-star" style="color:#ccc;"></i>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		    <span style="margin-left:8px; color:#555;">
		        (${reviewDetail.r_star})
		    </span>
		</td>
    </tr>
    <tr>
        <td colspan="5">${reviewDetail.r_detail}</td>
    </tr>
    <tr>
	    <td colspan="5" align="center">
	        <c:choose>
	            
	            <c:when test="${empty sessionScope.loginMno}">
	                <i class="fa-regular fa-heart"
	                   style="color:#ccc; cursor:pointer; font-size:20px;"
	                   onclick="alert('로그인 후 공감할 수 있습니다');"></i>
	                <span style="margin-left:6px;">
	                    ${likeCount}
	                </span>
	            </c:when>
	
	            <c:otherwise>
	                <form action="/review/likeToggle" method="post" style="display:inline;">
	                    <input type="hidden" name="r_no" value="${reviewDetail.r_no}" />
	
	                    <c:choose>
	                        <c:when test="${likeCheck > 0}">
	                            <button type="submit" style="border:none; background:none;">
	                                <i class="fa-solid fa-heart"
	                                   style="color:red; font-size:20px;"></i>
	                            </button>
	                        </c:when>
	                        <c:otherwise>
	                            <button type="submit" style="border:none; background:none;">
	                                <i class="fa-regular fa-heart"
	                                   style="color:#999; font-size:20px;"></i>
	                            </button>
	                        </c:otherwise>
	                    </c:choose>
	                </form>
	
	                <span style="margin-left:6px;">
	                    ${likeCount}
	                </span>
	            </c:otherwise>
	        </c:choose>
	
	    </td>
	</tr>

    
</table>
	<button onclick="location.href='/review/reviewList'">목록</button>
<c:if test="${sessionScope.loginId == reviewDetail.r_writer}">
    <button onclick="location.href='/review/reviewUpdate?r_no=${reviewDetail.r_no}'">
        수정
    </button>
    <button onclick="location.href='/review/reviewDelete?r_no=${reviewDetail.r_no}'">
        삭제
    </button>
</c:if>


    
	
</body>
</html>