<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MD 상세보기(mdDetail)</title>
<style>
/* .review-img {
    width: 100%;
    max-width: 200px;
    height: auto;
    border-radius: 8px;
} */
.star-rating i {
    font-size: 20px;
}

/* 이미지 + 정보 */
.md-info {
    display: flex;
    justify-content: center;
    align-items: center;   /* 세로 중앙 */
    gap: 30px;
    margin-bottom: 25px;
}


.md-text {
    display: flex;
    flex-direction: column;
    justify-content: center;   /* 세로 중앙 */
}

.md-text p {
    margin-bottom: 8px;
}

/* 본문 */
.card-text {
    margin: 30px 0;
    line-height: 1.7;
}

/* 버튼 중앙 */
.action-buttons {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin-top: 25px;
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
<body>

<div class="title_size">
	<div class="title_inner">
		<span class="title_font">MD 상세보기</span>
	</div>
</div>

<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-9">
			
		
		<div class="card shadow-sm" style="margin-top: 50px; margin-bottom: 130px; padding-top: 50px; padding-bottom: 50px;">
          <div class="card-body">
             <div class="md-info">
                <img src="/images/${detail.md_upload}" style="height:260px; margin-right: 20px;"/>
                	<div>
                		<p><strong>카테고리 : </strong>${detail.md_category}</p>
                		<p><strong>제목 : </strong>${detail.md_title}</p>
                		<p><strong>노출일정 : </strong>${detail.md_start} ~ ${detail.md_end}</p>
                		<p><strong>내용 : </strong>${detail.md_memo}</p>
                	</div>
		        
             </div>
             <!-- 위 줄: 수정 / 삭제 -->
             
		        <div class="d-flex mb-3 action-buttons" style="margin-left: 20px;">
		            <button type="button"
		                    onclick="location.href='/admin/mdUpdateForm?md_no=${detail.md_no}'"
		                    class="btn btn-primary btn-sm me-2">
		                수정하기
		            </button>
		
		            <form action="/mdDelete" method="post" class="m-0">
		            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                <input type="hidden" name="md_no" value="${detail.md_no}">
		                <button type="submit"
		                        class="btn btn-outline-primary btn-sm"
		                        onclick="return confirm('진짜로 삭제하실 건가요?');">
		                    삭제
		                </button>
		            </form>
		        </div>
		
		        <!-- 아래 줄: 리스트로 가기 -->
		        <div style="margin-right: 50px; text-align: right;">
		            <button type="button"
		                    onclick="location.href='/admin/mdPickList'"
		                    class="btn btn-primary btn-sm">
		                MD 리스트로 가기
		            </button>
		        </div>
          </div>
        </div>
        </div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>