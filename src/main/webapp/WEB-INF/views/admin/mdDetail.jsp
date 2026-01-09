<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MD 상세보기(mdDetail)</title>
</head>
<body>
<body>
<h1>MD 상세보기</h1>
	<table>
		<tr>
			<td rowspan="4"><img src="/images/${detail.md_upload}"/></td>
			<td>카테고리</td>
			<td>${detail.md_category}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${detail.md_title}</td>
		</tr>
		<tr>
			<td>노출일정</td>
			<td>${detail.md_start} ~ ${detail.md_end}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${detail.md_memo}</td>
		</tr>
		</table>
 		<button type="button" onclick="location.href='/admin/mdUpdateForm'">수정하기</button> 		
		<button type="button" onclick="location.href='/mdDelete?md_no=${detail.md_no}'">삭제하기</button>
		<input type="hidden" name="md_no" value="${md_no}">
		<a href="/mdDelete?md_no=${detail.md_no}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
		<button type="button" onclick="location.href='/admin/mdPickList'">리스트로 가기</button> 	

</body>
</html>