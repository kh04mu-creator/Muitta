<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<title>${mdetail.mu_title}</title>
<script>
	function openPopup(url){
		if(!url){
			return;
		}
		window.open(url, '_blank');
	}
</script>
<style>
	.bottom{
		margin-bottom: 20;
	}
	
	.left{
		padding-left: 20;
	}
	
	.category_name{
		font-weight: bold;
		font-size: 20px;
		padding-bottom:20;
		text-center;
	}
	
	.category_gap{
		margin-bottom: 50;
	}
	
	.mudetail_contents{
		max-width: 1280px;
	    width: calc(100% - 60px);
	    margin-bottom: 90px;
	    box-sizing: border-box;
	}
	
</style>
</head>
<body>
<div class="container py-4">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<sec:authorize access="hasRole('ADMIN')">
	<div>
		<input type="button" value="수정" onclick="location.href='musicalUpdateForm?mu_no=${mdetail.mu_no}'" class="btn btn-outline-primary bottom">
		<input type="button" value="삭제" onclick="location.href='musicalDelete?mu_no=${mdetail.mu_no}'" class="btn btn-primary bottom">
	</div>
</sec:authorize>


	<div>
		<input type="button" value="목록으로" onclick="location.href='musicalList'" class="btn btn-outline-primary bottom">
	</div>

<div class="mudetail_contents">
<h2 class="category_gap">${mdetail.mu_title}</h2>
<div>
	<table>
		<tr>
			<td rowspan=5><img src="images/${mdetail.mu_pupload}" style="height:500px"></td>
			<td class="left"><b>장소</b></td>
			<td  class="left">${mdetail.mu_place}</td>
		</tr>
		<tr>
			<td  class="left"><b>공연기간</b></td>
			<td  class="left">${mdetail.mu_start} ~ ${mdetail.mu_end}</td>
		</tr>
		<tr>
			<td  class="left"><b>공연시간</b></td>
			<td  class="left">${mdetail.mu_time}</td>
		</tr>
		<tr>
			<td  class="left"><b>관람연령</b></td>
			<td  class="left">${mdetail.mu_age}</td>
		</tr>
		<tr>
			<td  class="left"><b>가격</b></td>
			<td  class="left">
				<div class="bottom">
					<div style="margin-bottom: 10;">
						<button onclick="openPopup('${mdetail.inter_link}')" class="btn btn-info btn-sm">NOL/인터파크</button>
					</div>
					${mdetail.inter_price}
				</div>
				<div class="bottom">
					<div style="margin-bottom: 10;">
						<button onclick="openPopup('${mdetail.yes_link}')" class="btn btn-info btn-sm">yes24</button>
					</div>
					${mdetail.yes_price}
				</div>
				<div>
					<div style="margin-bottom: 10;">
						<button onclick="openPopup('${mdetail.melon_link}')" class="btn btn-info btn-sm">Melon</button>
					</div>
					${mdetail.melon_price}
				</div>
			</td>
		</tr>
		<tr style="border-bottom: 1px solid #eee">
			<td style="padding-bottom: 20; padding-top: 20;">
			<c:choose>
	            
	            <c:when test="${empty pageContext.request.userPrincipal}">
	                <i class="fa-regular fa-heart"
	                   style="color:#ccc; cursor:pointer; font-size:20px;"
	                   onclick="alert('로그인 후 찜할 수 있습니다');"></i>
	                <span style="margin-left:6px;">
	                    찜하기 ${lcount}
	                </span>
	            </c:when>
	            
	            <c:otherwise>
				<form method="post" action="/mLiketoggle" style="display:inline">
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			        <input type="hidden" name="mu_no" value="${mdetail.mu_no}">
			
			        <c:choose>
	                        <c:when test="${lcheck > 0}">
	                            <button type="submit" style="border:none; background:none;">
	                                <i class="fa-solid fa-heart"
	                                   style="color:red; font-size:20px;"></i>
	                            	<span style="margin-left:6px;">찜 취소</span>
	                            </button>
	                        </c:when>
	                        <c:otherwise>
	                            <button type="submit" style="border:none; background:none;">
	                                <i class="fa-regular fa-heart"
	                                   style="color:#999; font-size:20px;"></i>
	                            	<span style="margin-left:6px;">찜하기</span>
	                            </button>
	                        </c:otherwise>
	                    </c:choose>
			    </form>
			    <span style="margin-left:6px;">
	                    ${lcount}
	            </span>
	            </c:otherwise>
	        </c:choose>
			</td>
			<td colspan="2"></td>
		</tr>
	</table>
</div>

<div id="map" style="width:1000px;height:400px;left:50px; margin-bottom: 50; margin-top: 50;"></div>

<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=5a128c1fae100ec246f65cb0390ad9f3&libraries=services,clusterer"></script>
<script>
kakao.maps.load(function () {
	var map = new kakao.maps.Map(
	        document.getElementById('map'),
	        {
	            center: new kakao.maps.LatLng(37.5665, 126.9780), // 기본값
	            level: 3
	        }
	    );

	    // 주소 (DB에서 받은 값)
	    var address = "${mdetail.mu_addr}";

	    // 주소 → 좌표 변환 객체
	    var geocoder = new kakao.maps.services.Geocoder();

	    geocoder.addressSearch(address, function(result, status) {

	        if (status === kakao.maps.services.Status.OK) {

	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	            // 지도 중심 이동
	            map.setCenter(coords);

	            // 마커 생성
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });

	            // 인포윈도우 (선택)
	            var infowindow = new kakao.maps.InfoWindow({
	                content: '<div style="padding:5px;font-size:12px;">${mdetail.mu_place}</div>'
	            });
	            infowindow.open(map, marker);

	        } else {
	            console.error("주소 변환 실패:", status);
	        }
	    });
	});

</script>

<div class="d-flex justify-content-center">
	<table class="bottom" style="border-bottom: 1px solid #eee">
		<tr>
			<td class="category_name">캐스팅 정보</td>
		</tr>
		<tr>
			<td><img src="images/${cadetail.ca_upload}"  class="category_gap"></td>
		</tr>
	
		<tr>
			<td class="category_name">공연정보</td>
		</tr>
		<tr>
			<td style="white-space: pre-line;">
    			<c:out value="${midetail.mi_detail}" />
			</td>
		</tr>
		<tr>
			<td><img src="images/${midetail.mi_upload}"  class="category_gap"></td>
		</tr>
	</table>
</div>

<div class="d-flex flex-column align-items-center">
	<form name="muCommWriteForm" method="post" action="/muCommWrite" class="mb-4 w-100" style="max-width:700px;">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" id="mu_no" name="mu_no" value=${mdetail.mu_no}>
		
		<div class="mb-2">
            <label for="mc_detail" class="form-label"><b>한줄평 작성</b></label>
            <textarea id="mc_detail" name="mc_detail" rows="3" class="form-control"></textarea>
        </div>
        
        <div class="text-end">
            <button type="submit" class="btn btn-primary btn-sm">등록</button>
        </div>
	</form>
	
		<c:forEach var="mc" items="${mclist}">
			<div class="card border-secondary mb-3 w-100" style="max-width: 700px;">
			  <div class="card-header d-flex justify-content-between align-items-center">
				  
				  <div>
				  	<b>${mc.mc_writer}</b>
					<small class="text-muted">
						<fmt:formatDate value="${mc.mc_date}" pattern="yyyy-MM-dd"/>
					</small>
					</div>
					
					<c:if test="${loginId == mc.mc_writer}">
						<form action="/muCommDelete" method="post" class="m-0">
							<input type="hidden" name="mc_no" value="${mc.mc_no}">
							<input type="hidden" name="mu_no" value="${mc.mu_no}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<button type="submit" class="btn btn-outline-primary btn-sm">삭제</button>
						</form>
					</c:if>
			  </div>
			  <div class="card-body">		  	
				<p class="card-text">${mc.mc_detail}
			 </div>
			</div>
		</c:forEach>
</div>

</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>