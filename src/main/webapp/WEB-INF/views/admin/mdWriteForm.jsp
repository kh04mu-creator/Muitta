<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>md 글쓰기(WriteForm)</title>
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
		<span class="title_font">MD 게시글 작성</span>
	</div>
</div>

<div class="container mt-5">

<form name="mdWriteForm" method="post" action="/admin/mdWrite" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div class="container-fluid">
		<table class="table table-hover my-4" style="width:70%; margin: auto; ">
			<tr>
				<td colspan="2" style="font-weight: bold;">이달의 MD 추천대사</td>				
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="md_title" id="md_title" class="form-control"></td>
			</tr>
			<tr>
				<td>파일 업로드</td>
				<td><input type="file" name="file1" id="file1" class="form-control"></td>
			</tr>
			<tr>
				<td>노출일정</td>
				<td>
					<div class="row g-2 align-items-center">
				        <div class="col-3">
				            <input type="text"
				                   name="md_start"
				                   id="md_start"
				                   class="form-control">
				        </div>
				
				        <div class="col-auto text-center">
				            ~
				        </div>
				
				        <div class="col-3">
				            <input type="text"
				                   name="md_end"
				                   id="md_end"
				                   class="form-control">
				        </div>
				    </div>
	    		</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="md_memo" id="md_memo" rows="3" cols="50" class="form-control"></textarea></td>
			</tr>
		</table>
	</div>
	<div class="text-center">
	   <input type="submit" value="등록" class="btn btn-primary">
	   <input type="reset" value="다시 쓰기" class="btn btn-outline-primary">
	</div>
</form>			
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>