<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 리스트</title>
</head>
<style>
	.category_name{
		font-weight: bold;
		font-size: 18px;
		padding-bottom:18;
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
<body>

<div class="title_size">
	<div class="title_inner">
		<span class="title_font">마이 리스트</span>
	</div>
</div>

<div class="container py-4">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<div class="container-fluid">
        <table class="table table-hover my-4"
               style="width:90%; margin:auto; text-align:center;">
	
		<thead class="table-light">
			<tr>
				<td></td>
				<td class="category_name">제목</td>
				<td class="category_name">공연장</td>
				<td class="category_name">공연기간</td>
				<td></td>
			</tr>	
		</thead>	
			<c:forEach var="m" items="${mlist}">
				<tr onclick="location.href='musicalDetail?mu_no=${m.mu_no}'" style="cursor:pointer;">
					<td class="align-middle"><img src="images/${m.mu_pupload}" width="100"></td>
					<td class="align-middle">${m.mu_title}</td>
					<td class="align-middle">${m.mu_place}</td>
					<td class="align-middle">${m.mu_start} ~ ${m.mu_end}</td>
					<td class="align-middle">
						<form action="/mLikeDelete" method="post">
							<input type="hidden" name="mu_no" value="${m.mu_no}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<button type="submit" class="btn btn-outline-primary btn-sm">삭제</button>
							
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
 	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>