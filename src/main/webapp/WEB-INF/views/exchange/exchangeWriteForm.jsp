<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓중고거래(exchangeWriteForm)</title>
</head>
<body>
<h1>티켓중고거래 게시판</h1>
<form name="exchangeWriteForm" method="post" action="exchangeWrite" enctype="multipart/form-data">
<table border="0" width="700">
	<tr>
		<td>제목</td>
		<td><input type="text" name="ex_title" id="ex_title"></td>				
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="ex_writer" id="ex_writer"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea  name="ex_detail" id="ex_detail" rows="3" cols="50"></textarea></td>
	</tr>	
	<tr>
		<td>사진 업로드</td>
		<td><input type="file" name="file" id="file"></td>
	</tr>
	<tr>
		<td>거래현황</td>
		<td>
			<select name="ex_ing" id="ex_ing">
				<option value="">선택해주세요</option>
				<option value="거래중">거래중</option>
				<option value="거래완료">거래완료</option>
			</select>
		</td>
	</tr>
</table>
   <input type="submit" value="등록">
   <input type="reset" value="다시 쓰기">
</form>			
</body>
</html>