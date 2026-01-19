<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>   
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MD목록(mdList)</title>
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
	
	.bottom{
		margin-bottom: 20;
	}
	
	.item {
    margin-bottom: 40px;
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
		padding:30px;
		height:200px;
	}
	
	.title_font{
		font-size: 50px;
		font-weight: bold;
		color: #998e8e;
		letter-spacing: 10px;
	}
	
	.title_sub_font{
		font-size: 30px;
		font-weight: bold;
		color: #998e8e;
		letter-spacing: 5px;
	}
	
</style>
</head>
<body>

<div class="title_size">
	<div class="title_inner">
		<p class="title_font">MD목록</p>
		<p class="title_sub_font">이달의 MD 추천 명대사</p>
	</div>
</div>

<div class="container py-4">
 
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

<div class="mulist_contents gap">
	<div class="row align-items-md-stretch text-center g-4">
		<c:forEach var="dto" items="${list}">
			<div class="col-md-4">
				<div class="item">
					<div class="p-2 imagewrap">
						<img src="/images/${dto.md_upload}" style="height:200px"/>
					</div>
					<ul type="none" class="contentWrap">
						<li><strong>${dto.md_title}</strong>
						<li>${dto.md_start} ~ ${dto.md_end}
						<li><button onclick="location.href='/admin/mdDetail?md_no=${dto.md_no}'" class="btn btn-outline-primary btn-sm">
						자세히보기</button>	
					</ul>
				</div>
			</div>
		</c:forEach>
		
	</div>
</div>
	
	<div class="text-center">
		<button onclick="location.href='/admin/mdWriteForm'" class="btn btn-primary">MD 등록하기</button>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>