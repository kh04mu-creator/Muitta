<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐스팅 정보 입력</title>
</head>
<body>
<form name="musicalCaWriteForm" method="post" action="/musicalCaWrite" enctype="multipart/form-data">
<input type="hidden" name="mu_no" id="mu_no">
	<table>
		<tr>
			<td>배우명</td>
			<td><input type="text" name="ca_name" id="ca_name"></td>
		</tr>
		<tr>
			<td>역할</td>
			<td><input type="text" name="ca_role" id="ca_role"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="ca_upload" id="ca_upload"></td>
		</tr>
	</table>
	<input type="submit" value="저장">
	<input type="reset" value="다시 쓰기">
	<input type="button" value="완료">
</form>
</body>
</html>