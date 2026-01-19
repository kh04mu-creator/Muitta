<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓거래 목록</title>
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
</style>
</head>
<body>
<div class="title_size">
	<div class="title_inner">
		<span class="title_font">티켓거래 목록</span>
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
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>거래현황</th>
                </tr>
            </thead>

            <tbody>
            <c:forEach var="exlist" items="${exlist}">
                <tr>
                    <td>${exlist.ex_no}</td>

                    <td class="text-start">
                        <a href="/exchange/exchangeDetail?ex_no=${exlist.ex_no}"
                           class="text-decoration-none">
                            ${exlist.ex_title}
                        </a>
                    </td>

                    <td>${exlist.ex_writer}</td>

                    <td>
                        <fmt:formatDate value="${exlist.ex_date}" pattern="yyyy-MM-dd" />
                    </td>

                    <td>
                        <c:choose>
                            <c:when test="${exlist.ex_ing == '거래중'}">
                                <span class="badge bg-success">거래중</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-primary">거래완료</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 거래 등록 버튼 -->
    <div class="d-flex justify-content-center mt-3">
        <button class="btn btn-primary"
                onclick="location.href='/exchange/exchangeWriteForm'">
            거래 등록
        </button>
    </div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
