<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 뮤지컬 등록</title>
</head>
<body>
<h3>뮤지컬 등록</h3>
<form name="musicalWriteForm" method="post" action="/musicalWrite" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="mu_title" id="mu_title"></td>
		</tr>
		<tr>
			<td>장소</td>
			<td><input type="text" name="mu_place" id="mu_place"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="mu_addr" id="mu_addr"></td>
		</tr>
		<tr>
			<td>공연시간</td>
			<td><input type="text" name="mu_time" id="mu_time"></td>
		</tr>
		<tr>
			<td>관람연령</td>
			<td><input type="text" name="mu_age" id="mu_age"></td>
		</tr>
		<tr>
			<td>
				VIP석 가격
			</td>
			<td><input type="text" name="vip_price" id="vip_price"></td>
		</tr>
		<tr>
			<td>R석 가격</td>
			<td><input type="text" name="r_price" id="r_price"></td>
		</tr>
		<tr>
			<td>S석 가격</td>
			<td><input type="text" name="s_price" id="s_price"></td>
		</tr>
		<tr>
			<td>A석 가격</td>
			<td><input type="text" name="a_price" id="a_price"></td>
		</tr>
		<tr>
			<td>공연정보</td>
			<td><textarea name="mi_detail" id="mi_detail" rows="15" cols="80" wrap="hard"></textarea></td>
		</tr>
		<tr>
			<td>게시일</td>
			<td>
				<input type="text" name="mu_start" id="mu_start"> ~ 
				<input type="text" name="mu_end" id="mu_end">
			</td>
		</tr>
		<tr>
			<td>포스터</td>
			<td><input type="file" name="file1" id="file1"></td>
		</tr>
		<tr>
			<td>공연정보 이미지</td>
			<td><input type="file" name="file2" id="file2"></td>
		</tr>
		<tr>
			<td>캐스팅 정보</td>
			<td><input type="file" name="file3" id="file3"></td>
		</tr>
	</table>
	
	<input type="submit" value="등록">
	<input type="reset" value="다시 쓰기">
</form>
</body>
</html>