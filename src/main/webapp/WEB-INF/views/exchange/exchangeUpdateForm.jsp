<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓거래 게시글 수정하기(exchangeUpdateForm)</title>
</head>
<body>
<h1>티켓거래 게시물 수정하기</h1>
<form name="exchangeUpdateForm" method="post" action="exchangeUpdate" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="ex_writer" id="ex_writer">
<table border="0" width="700">
	<tr>
		<td>제목</td>
		<td><input type="text" name="ex_title" id="ex_title" value="${exedit.ex_title}"></td>				
	</tr>

	<tr>
		<td>내용</td>
		<td><textarea  name="ex_detail" id="ex_detail" rows="3" cols="50" value="${exedit.ex_detail}"></textarea></td>
	</tr>	
	<tr>
		<td>사진 업로드</td>
		<td><input type="file" name="file1" id="file1"></td>
	</tr>
	<tr>
		<td>거래현황</td>
		<td>
			<select name="ex_ing" id="ex_ing" value="${exedit.ex_ing}">
				<option value="선택해주세요">선택해주세요</option>
				<option value="거래중">거래중</option>
				<option value="거래완료">거래완료</option>
			</select>
		</td>
	</tr>
</table>
   <input type="submit" value="수정하기">
   <input type="reset" value="다시 쓰기">
   <p><a href="/exchange/exchangeList">티켓교환 리스트</a>로 이동
   
</form>			
</body>
</html>