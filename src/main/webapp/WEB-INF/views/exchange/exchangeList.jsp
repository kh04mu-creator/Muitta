<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓중고거래 리스트(exchangeList)</title>
</head>
<body>
 <h1>티켓거래 목록</h1>
 	<table>
 		<tr>
 			<td>번호</td>
 			<td>등록 이미지</td>
 			<td>제목</td>
 			<td>작성날짜</td>
 			<td>거래현황</td>
 		</tr>
 	<c:forEach var="exlist" items="${exlist}">	
 		<tr>
 			<td>${exlist.ex_no}</td>
 			<td><img src="/images/${exlist.ex_upload}" /></td>
 			<td>${exlist.ex_title}</td>
 			<td><fmf:formatDate value="${exlist.ex_date}" pattern="yyyy/MM/dd" /></td>
 			<td>${exlist.ex_ing}</td>
 		</tr>
 		<a href="/exchange/exchangeDetail?ex_no=${exlist.ex_no}">자세히보기</a>
 	</c:forEach>
 	</table>
	<p><a href="/exchange/exchangeWriteForm">거래등록</a> 하기
	
</body>
</html>