<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MD 게시글 수정하기(mdUpdate)</title>
</head>
<body>
<h1>MD 게시글 수정하기</h1>
<form name="mdUpdateForm" method="post" action="mdUpdate" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<table border="0" width="700">
	<tr>
		<td>카테고리</td>
		<input type="hidden" name="md_no" value="${mdedit.md_no}">
		<td><select name="md_category" id="md_category">
			<option value="">선택해주세요</option>
			<option value="mdPick">이달의 MD 추천대사</option>
		</select></td>				
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="md_title" id="md_title" value="${mdedit.md_title}"></td>
	</tr>
	<tr>
		<td>파일 업로드</td>
		<td><input type="file" name="file1" id="file1" value="${mdedit.md_upload}"></td>
	</tr>
	<tr>
		<td>노출일정</td>
		<td><input type="date" name="md_start" id="md_start" value="${mdedit.md_start}"> ~ 
            <input type="date" name="md_end" id="md_end" value="${mdedit.md_end}"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="md_memo" id="md_memo" rows="3" cols="50" value="${mdedit.md_memo}"></textarea></td>
	</tr>
</table>
   <input type="submit" value="수정하기">
   <input type="reset" value="다시 쓰기">
   <p><a href="/admin/mdPickList">MD 리스트</a>로 이동
   
</form>			
</body>
</html>