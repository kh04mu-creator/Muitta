<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>${mdetail.mu_title}</h2>
<div>
	<table>
		<tr>
			<td rowspan=5><img src="images/${mdetail.mu_pupload}" style="height:500px"></td>
			<td>장소</td>
			<td>${mdetail.mu_place}</td>
		</tr>
		<tr>
			<td>공연기간</td>
			<td>${mdetail.mu_start} ~ ${mdetail.mu_end}</td>
		</tr>
		<tr>
			<td>공연시간</td>
			<td>${mdetail.mu_time}</td>
		</tr>
		<tr>
			<td>관람연령</td>
			<td>${mdetail.mu_age}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>
				VIP석 ${mdetail.vip_price}<br>
				R석 ${mdetail.r_price}<br>
				S석 ${mdetail.s_price}<br>
				A석 ${mdetail.a_price}<br>
			</td>
		</tr>
	</table>
</div>
<div>
	<table>
		<div>
			<tr>
				<td>인터파크가격</td>
				<td>인터파크로 가기</td>
			</tr>
		</div>
		<div>
			<tr>
				<td>예스24가격</td>
				<td>yes24로 가기</td>
			</tr>
		</div>
		<div>
			<tr>
				<td>멜론가격</td>
				<td>melon으로 가기</td>
			</tr>
		</div>
	</table>
</div>
<div>
	<table>
		<tr>
			<td>공연정보</td>
		</tr>
		<tr>
			<td>정보 이미지</td>
		</tr>
	</table>
</div>

<%-- <c:choose> --%>
<%-- 	<c:when test="${pageContext.request.userPrincipal.name == 'admin'}"> --%>
		<div>
			<input type="button" value="수정" onclick="location.href='admin/musicalUpdateForm?mu_no=${mdetail.mu_no}'">
			<input type="button" value="삭제" onclick="location.href='musicalDelete?mu_no=${mdetail.mu_no}'">
		</div>
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
		<div>
			<input type="button" value="목록으로" onclick="history.back();">
		</div>
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>
</body>
</html>