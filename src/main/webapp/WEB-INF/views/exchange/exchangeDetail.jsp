<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓거래 상세보기(exchangeDetail)</title>
</head>
<body>
<body>
<h1>티켓거래 상세보기</h1>
	<table>
		<tr>
			<input type="hidden" name="ex_no" value="${exdetail.ex_no}">
			<td colspan="2"><img src="/images/${exdetail.ex_upload}"/></td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${exdetail.ex_title}</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td><fmt:formatDate value="${exdetail.ex_date}" pattern="yyyy/MM/dd" /></td>
		</tr>
		<tr>
			<td>거래현황</td>
			<td>${exdetail.ex_ing}</td>
		</tr>
		<tr>
			<td></td>
		</tr>
		</table>
		<button type="button" onclick="location.href='/exchange/exchangeUpdateForm?ex_no=${exdetail.ex_no}'">수정하기</button> 		
<%-- 	<button type="button" onclick="location.href='/exchangeDelete?ex_no=${exdetail.ex_no}'">삭제하기</button>	 --%>	
		<a href="/exchangeDelete?ex_no=${exdetail.ex_no}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제하기</a>
		<button type="button" onclick="location.href='/exchange/exchangeList'">티켓 거래 목록 이동하기</button> 	
		
		<h3>댓글 목록</h3>
		<c:if test="${empty commList}">
		    <p>등록된 댓글이 없습니다.</p>
		</c:if>
		<c:forEach var="comm" items="${commList}">
		    <div style="border-bottom:1px solid #ccc; padding:10px;">
		        <b>${comm.exc_writer}</b>
		        <span style="font-size:12px; color:gray;">
		            <fmt:formatDate value="${comm.exc_date}" pattern="yyyy-MM-dd HH:mm"/>
		        </span>
		        <p>${comm.exc_detail}</p>
		        <!--  삭제 버튼 조건 -->
		        <c:if test="
		            ${pageContext.request.userPrincipal ne null &&
		              (pageContext.request.userPrincipal.name eq comm.exc_writer
		               || pageContext.request.userPrincipal.name eq 'admin')}">
		
		            <a href="/exchange/exCommDelete?exc_no=${comm.exc_no}&ex_no=${comm.ex_no}"
		               onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
		        </c:if>		        
		    </div>
		</c:forEach>
		
		<!-- 갯글 작성 -->
		<form action="/exchange/exCommWrite" method="post">
		    <!-- 게시글 번호 -->
		    <input type="hidden" name="ex_no" value="${exdetail.ex_no}">
		
		    <table>
		        <tr>
		            <td colspan="2">
		            	<input type="text" name="exc_detail" placeholder="댓글을 입력하세요" required>
		                <button type="submit">등록</button>
		            </td>
		        </tr>
		    </table>
		</form>
</body>
</html>