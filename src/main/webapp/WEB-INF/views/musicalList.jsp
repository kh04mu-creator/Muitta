<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>뮤지컬 목록</title>
<style>
	.mulist_contents{
		max-width: 1280px;
    width: calc(100% - 60px);
    margin-bottom: 90px;
    box-sizing: border-box;
	}
	.gap{
		gap: 60px 20px
	}
	
	.list_column{
		grid-template-columns: repeat(5,1fr)
	}

	.itemlist{
		display: flex;
	    flex-direction: column;
	    width: 100%;
	    text-decoration: none;
	    cursor: pointer;
	    flex-direction:row;
	    padding-bottom: 20px;
    	border-bottom: 1px solid #eee
	}
	.imagewrap{
		position: relative;
	    width: 100%;
	    padding-top: 133%;
	    border-radius: 20% 20% 55% 20%;
	    box-sizing: border-box;
	    overflow: hidden
	}
	.contentWrap{
		display: flex;
    flex-direction: column;
    width: 100%;
    margin: 0;
    padding: 16px 0 0;
    font-size: 13px;
    font-weight: 400;
    line-height: 150%
	}
	
	
</style>
</head>
<body>
<div class="container py-4">
<h3>뮤지컬</h3>

<sec:authorize access="hasRole('ADMIN')">
	<a href="/admin/musicalWriteForm">추가하기</a>
    <button onclick="location.href='/admin/musicalWriteForm'">추가하기</button>
</sec:authorize>

<div class="mulist_contents gap">
<div class="row align-items-md-stretch text-center itemlist mulist_contents">
<c:forEach var="dto" items="${mlist}">
	<div class="col-md-4" onclick="location.href='musicalDetail?mu_no=${dto.mu_no}'">
			<div class="p-2 list_column">
				<div class="p-2 imagewrap">
					<img src="images/${dto.mu_pupload}" style="height:200px"/>
				</div>
			<ul type="none" class="contentWrap">
				<li><strong>${dto.mu_title}</strong>
				<li>${dto.mu_place}
				<li>${dto.mu_start} ~ ${dto.mu_end}
			</ul>
		</div>
	</div>
</c:forEach>
</div>
</div>
</div>
</body>
</html>