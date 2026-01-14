<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authorize access="hasRole('ADMIN')">
	<div>
		<input type="button" value="수정" onclick="location.href='admin/musicalUpdateForm?mu_no=${mdetail.mu_no}'">
		<input type="button" value="삭제" onclick="location.href='musicalDelete?mu_no=${mdetail.mu_no}'">
	</div>
</sec:authorize>


	<div>
		<input type="button" value="목록으로" onclick="history.back();">
	</div>


<h2>${mdetail.mu_title}</h2>
<div>
	<table>
		<tr>
			<td rowspan=5><img src="images/${mdetail.mu_pupload}" style="height:500px"></td>
			<td>장소</td>
			<td>${mdetail.mu_place}</td>
		</tr>
		<tr>
			<td>공연기간</td>
			<td>${mdetail.mu_start} ~ ${mdetail.mu_end}</td>
		</tr>
		<tr>
			<td>공연시간</td>
			<td>${mdetail.mu_time}</td>
		</tr>
		<tr>
			<td>관람연령</td>
			<td>${mdetail.mu_age}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>
				<div>
					<div>
						<button onclick="openPopup('${mdetail.inter_link}')">NOL/인터파크</button>
					</div>
					${mdetail.inter_price}
				</div>
				<div>
					<div>
						<button onclick="openPopup('${mdetail.yes_link}')">yes24</button>
					</div>
					${mdetail.yes_price}
				</div>
				<div>
					<div>
						<button onclick="openPopup('${mdetail.melon_link}')">Melon</button>
					</div>
					${mdetail.melon_price}
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<form method="post" action="/mLiketoggle" style="display:inline">
			        <input type="hidden" name="mu_no" value="${mdetail.mu_no}">
			
			        <c:choose>
			            <c:when test="${isFav > 0}">
			                <button type="submit">💖 찜 해제</button>
			            </c:when>
			            <c:otherwise>
			                <button type="submit">🤍 찜하기</button>
			            </c:otherwise>
			        </c:choose>
			    </form>
			</td>
			<td colspan="2"></td>
		</tr>
	</table>
</div>
<div id="map" style="width:500px;height:400px;"></div>

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

<div>
	<table>
		<tr>
			<td>캐스팅 정보</td>
		</tr>
		<tr>
			<td><img src="images/${cadetail.ca_upload}"></td>
		</tr>
	
		<tr>
			<td>공연정보</td>
		</tr>
		<tr>
			<td style="white-space: pre-line;">
    			<c:out value="${midetail.mi_detail}" />
			</td>
		</tr>
		<tr>
			<td><img src="images/${midetail.mi_upload}"></td>
		</tr>
	</table>
</div>

<h3>한줄평</h3>
<div>
	<form name="muCommWriteForm" method="post" action="/muCommWrite">
	<input type="hidden" id="mu_no" value=${mdetail.mu_no}>
		<table>
		<tr>
			<td>한줄평 입력</td>
			<td>
			<textarea id="mc_detail" rows="5" cols="40"></textarea>
			</td>
			<td><input type="button" value="등록"></td>
		</tr>	
		</table>
	</form>
	
	<table>
		<c:forEach var="mc" items="${mclist}">
			<tr>
				<td>${mc.mc_writer}</td>
				<td>
				<fmt:formatDate value="${mc.mc_date}" pattern="yyyy-MM-dd"/>
				</td>
				
				<sec:authorize access="authenication.name == mc.mu_writer">
					<input type="hidden" name="mc_no" value="${mc.mc_no}">
					<input type="hidden" name="mu_no" value="${mdetail.mu_no}">
					<td><button onclick="">삭제</button></td>
				</sec:authorize>
			</tr>
			<tr>
				<td colspan="2">${mc.mc_detail}</td>
			</tr>
		</c:forEach>
	</table>
</div>


</body>
</html>