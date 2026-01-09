<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>md 글쓰기(WriteForm)</title>
</head>
<body>
<h1>MD 게시글 작성</h1>
<form name="mdWriteForm" method="post" action="mdWrite" enctype="multipart/form-data">
<table border="0" width="700">
	<tr>
		<td>카테고리</td>
		<td><select name="md_category" id="md_category">
			<option value="">선택해주세요</option>
			<option value="mdPick">이달의 MD 추천대사</option>
		</select></td>				
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="md_title" id="md_title"></td>
	</tr>
	<tr>
		<td>파일 업로드</td>
		<td><input type="file" name="md_name" id="md_name"></td>
	</tr>
	<tr>
		<td>노출일정</td>
		<td><input type="date" name="md_start" id="md_stard"> ~ 
            <input type="date" name="md_end" id="md_end"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="md_memo" id="md_memo" rows="3" cols="50"></textarea></td>
	</tr>
</table>
   <input type="submit" value="등록">
   <input type="reset" value="다시 쓰기">
</form>			
</body>
</html>