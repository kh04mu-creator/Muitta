<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤지컬 정보 수정</title>
<style>
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

<div class="title_size">
	<div class="title_inner">
		<span class="title_font">뮤지컬 정보 수정</span>
	</div>
</div>

<div class="container mt-5">
<form name="musicalUpdateForm" method="post" action="/musicalUpdate" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="mu_no" value="${medit.mu_no}">
	<div class="container-fluid">
	<table class="table table-hover my-4" style="width:70%; margin: auto; ">
		<tr>
			<td>제목</td>
			<td><input type="text" name="mu_title" id="mu_title" value="${medit.mu_title}" class="form-control"></td>
		</tr>
		<tr>
			<td>장소</td>
			<td><input type="text" name="mu_place" id="mu_place" value="${medit.mu_place}" class="form-control"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="mu_addr" id="mu_addr" value="${medit.mu_addr}" class="form-control"></td>
		</tr>
		<tr>
			<td>공연기간</td>
			<td>
				<div class="row g-2 align-items-center">
			        <div class="col-3">
			            <input type="text"
			                   name="mu_start"
			                   id="mu_start"
			                   value="${medit.mu_start}"
			                   class="form-control">
			        </div>
			
			        <div class="col-auto text-center">
			            ~
			        </div>
			
			        <div class="col-3">
			            <input type="text"
			                   name="mu_end"
			                   id="mu_end"
			                   value="${medit.mu_end}"
			                   class="form-control">
			        </div>
			    </div>
			</td>
		</tr>
		
		<tr>
			<td>공연시간</td>
			<td><input type="text" name="mu_time" id="mu_time" value="${medit.mu_time}" class="form-control"></td>
		</tr>
		<tr>
			<td>관람연령</td>
			<td><input type="text" name="mu_age" id="mu_age" value="${medit.mu_age}" class="form-control"></td>
		</tr>
		<tr>
			<td>NOl/인터파크 가격</td>
			<td><input type="text" name="inter_price" id="inter_price" value="${medit.inter_price}" class="form-control"></td>
		</tr>
		<tr>
			<td>NOl/인터파크 링크</td>
			<td><input type="text" name="inter_link" id="inter_link" value="${medit.inter_link}" class="form-control"></td>
		</tr>
		<tr>
			<td>yes24 가격</td>
			<td><input type="text" name="yes_price" id="yes_price" value="${medit.yes_price}" class="form-control"></td>
		</tr>
		<tr>
			<td>yes24 링크</td>
			<td><input type="text" name="yes_link" id="yes_link" value="${medit.yes_link}" class="form-control"></td>
		</tr>
		<tr>
			<td>Melon 가격</td>
			<td><input type="text" name="melon_price" id="melon_price" value="${medit.melon_price}" class="form-control"></td>
		</tr>
		<tr>
			<td>Melon 링크</td>
			<td><input type="text" name="melon_link" id="melon_link" value="${medit.melon_link}" class="form-control"></td>
		</tr>

		<tr>
			<td>공연정보</td>
			<td><textarea name="mi_detail" id="mi_detail" rows="15" cols="80" class="form-control">${miedit.mi_detail}</textarea></td>
		</tr>
		<tr>
			<td>포스터</td>
			<td><input type="file" name="file1" id="file1" class="form-control"></td>
		</tr>
		<tr>
			<td>공연정보 이미지</td>
			<td><input type="file" name="file2" id="file2" class="form-control"></td>
		</tr>
		<tr>
			<td>캐스팅 정보</td>
			<td><input type="file" name="file3" id="file3" class="form-control"></td>
		</tr>
	</table>
	<div class="text-center">
		<input type="submit" value="수정하기" class="btn btn-primary">
		<input type="button" value="취소" onclick="history.back();" class="btn btn-outline-primary">
	</div>
	</div>
</form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>