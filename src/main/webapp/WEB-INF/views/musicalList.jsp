<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@include file="common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

	.itemlist{
		display: flex;
	    flex-direction: column;
	    width: 100%;
	    text-decoration: none;
	    cursor: pointer;
	    flex-direction:row;
	    padding-bottom: 20px;
	}
	
	.imagewrap{
		position: relative;
	    width: 100%;
	    padding-top: 133%;
	    box-sizing: border-box;
	    overflow: hidden
	}
	.contentWrap{
	    flex-direction: column;
	    width: 100%;
	    margin-bottom: 90;
	    padding: 16px 0 0;
	    font-size: 13px;
	    font-weight: 400;
	    line-height: 150%
	}
	
	.img-grid {
    display: grid;
    width: 20%;
	}
	
	.bottom{
		margin-bottom: 20;
	}
		
	.title_size{
		height: 200px;
		background-color: #F0E6DB41;
		margin-top: 85px;
		margin-bottom: 50px;
		border-bottom: 1px solid #eee;
	}
	
	.title_inner{
		text-align:center;
		padding:60px;
		height:200px;
	}
	
	.title_font{
		font-size: 50px;
		font-weight: bold;
		color: #998e8e;
		letter-spacing: 10px;
	}
		
</style>
</head>
<body>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

<div class="title_size" >
	<div class="title_inner">
		<span class="title_font">뮤지컬</span>
	</div>
</div>

<div class="container py-4">


<sec:authorize access="hasRole('ADMIN')">
    <button onclick="location.href='/admin/musicalWriteForm'" class="btn btn-outline-primary float-end bottom">추가하기</button>
</sec:authorize>

<div class="mulist_contents gap">
<div class="row align-items-md-stretch text-center itemlist mulist_contents">
<c:forEach var="dto" items="${mlist}">
	<div class="img-grid col-md-4" onclick="location.href='musicalDetail?mu_no=${dto.mu_no}'">
			<div>
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
<%@ include file="common/footer.jsp" %>
</body>
</html>