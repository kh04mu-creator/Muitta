<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>뮤지컬 정보 수정</h3>
<form name="musicalUpdateForm" method="post" action="/musicalUpdate" enctype="multipart/form-data">
<input type="hidden" name="mu_no" value="${medit.mu_no}">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="mu_title" id="mu_title" value="${mdeit.mu_title}"></td>
		</tr>
		<tr>
			<td>장소</td>
			<td><input type="text" name="mu_place" id="mu_place" value="${mdeit.mu_place}"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="mu_addr" id="mu_addr" value="${mdeit.mu_addr}"></td>
		</tr>
		<tr>
			<td>공연시간</td>
			<td><input type="text" name="mu_time" id="mu_time" value="${mdeit.mu_time}"></td>
		</tr>
		<tr>
			<td>관람연령</td>
			<td><input type="text" name="mu_age" id="mu_age" value="${mdeit.mu_age}"></td>
		</tr>
		<tr>
			<td>
				VIP석 가격
			</td>
			<td><input type="text" name="vip_price" id="vip_price" value="${mdeit.vip_price}"></td>
		</tr>
		<tr>
			<td>R석 가격</td>
			<td><input type="text" name="r_price" id="r_price" value="${mdeit.r_price}"></td>
		</tr>
		<tr>
			<td>S석 가격</td>
			<td><input type="text" name="s_price" id="s_price" value="${mdeit.s_price}"></td>
		</tr>
		<tr>
			<td>A석 가격</td>
			<td><input type="text" name="a_price" id="a_price" value="${mdeit.a_price}"></td>
		</tr>
		<tr>
			<td>게시일</td>
			<td>
				<input type="text" name="mu_start" id="mu_start" value="${mdeit.mu_start}"> ~ 
				<input type="text" name="mu_end" id="mu_end" value="${mdeit.mu_end}">
			</td>
		</tr>
		<tr>
			<td>포스터</td>
			<td><input type="file" name="mu_pupload" id="mu_pupload" value="${mdeit.mu_pupload}"></td>
		</tr>
	</table>
	
	<input type="submit" value="수정하기">
	<input type="reset" value="취소">
</form>

</body>
</html>