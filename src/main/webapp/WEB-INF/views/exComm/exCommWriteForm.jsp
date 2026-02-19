<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓거래 댓글쓰기(exCommWriteForm)</title>
</head>
<body>
<h1>티켓거래 댓글쓰기</h1>
<form name="exCommWriteForm" method="post" action="exCommWrite">
<table border="0" width="700">
	<input type="hidden" name="ex_no" id="ex_no">	
	<tr>
		<td>
		<input type="text" name="exc_detail" id="exc_detail" placeholder="댓글을 남겨보세요.">
		<input type="submit" value="등록">
		</td>
	</tr>
</table>
   
</form>			
</body>
</html>