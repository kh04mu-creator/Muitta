<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MD 상세보기(mdDetail)</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* .review-img {
    width: 100%;
    max-width: 200px;
    height: auto;
    border-radius: 8px;
} */


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
	.zoom-img {
        width: 100%;       /* 가로를 칸에 꽉 채움 */
        height: 350px;     /* 높이를 강제로 키움 (원하는 수치로 조절) */
        object-fit: contain; /* 이미지가 비율대로 꽉 차게 */
        cursor: pointer;
        transition: transform 0.2s;
    }
    
    .zoom-img:hover {
        transform: scale(1.02); /* 마우스 올리면 살짝 더 커짐 */
        opacity: 0.9;
    }
	

    /* 모달 배경을 어둡게 */
    .modal-content.bg-transparent {
        border: none;
    }
    
    /* 제목 */
.card-title {
    margin-bottom: 25px;
    font-weight: 600;
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
        <div class="col-lg-10 col-xl-9">
            
           <div class="card shadow-sm mb-4">
			    <div class="card-body p-4">
			
			        <div class="row align-items-center">
						<h3 class="card-title text-center">
						${detail.md_category} - [ ${detail.md_title} ]</h3>
						<sec:authorize access="hasRole('ADMIN')">
						  <div class="d-flex justify-content-end">
						    <form action="/admin/mdSetHome" method="post" class="d-inline">
						      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						      <input type="hidden" name="md_no" value="${detail.md_no}">
						      <button type="submit" class="btn btn-outline-primary">메인 등록</button>
						    </form>
						  </div>
						</sec:authorize>
			            <!-- 이미지 -->
			            <div class="col-md-8 mb-3 mb-md-0 text-center">
			                <img src="/images/${detail.md_upload}" 
			                     class="img-fluid rounded border zoom-img" 
			                     alt="MD추천이미지"
			                     data-bs-toggle="modal" 
			                     data-bs-target="#imageZoomModal">
			                <p class="mt-2 text-muted">
			                    <small>🔍 이미지를 클릭하면 확대됩니다.</small>
			                </p>
			            </div>
			            <div class="col-md-4 d-flex flex-column justify-content-center">
			        	    <p><strong>제목 :</strong> ${detail.md_title}</p>
			                <p><strong>카테고리 :</strong> ${detail.md_category}</p>
			                <p><strong>일정 :</strong> ${detail.md_start} ~ ${detail.md_end}</p>
			            </div>
			        </div>
			        <hr>
			
			        <div class="bg-light p-3 rounded d-flex align-items-center justify-content-center"
			             style="min-height:150px; white-space:pre-wrap; text-align:center;">${detail.md_memo}
			        </div>
			
			    </div>
			</div>

            <!-- 버튼 -->
            <div class="d-flex justify-content-center gap-2">
                <button type="button" onclick="location.href='/admin/mdPickList'" class="btn btn-primary">
                     목록 
                </button>

                <button type="button" 
                        onclick="location.href='/admin/mdUpdateForm?md_no=${detail.md_no}'" 
                        class="btn btn-outline-primary">
                     수정
                </button>

                <form action="/mdDelete" method="post" class="m-0">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="md_no" value="${detail.md_no}">
                    <button type="submit" class="btn btn-primary" onclick="return confirm('진짜로 삭제하시겠습니까?');">
                         삭제
                    </button>
                </form>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="imageZoomModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl"> <div class="modal-content bg-transparent">
            <div class="modal-header border-0">
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-0 text-center">
                <img src="/images/${detail.md_upload}" class="img-fluid rounded shadow-lg" style="max-height: 90vh;">
            </div>
        </div>
    </div>
</div>
<c:if test="${not empty msg}">
<script>
  alert("${msg}");
</script>
</c:if>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>