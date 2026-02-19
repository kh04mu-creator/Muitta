<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MD 게시글 수정하기(mdUpdate)</title>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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
		<span class="title_font">MD 게시글 수정하기</span>
	</div>
</div>

<div class="container py-4">
<form name="mdUpdateForm" method="post" action="/admin/mdUpdate" enctype="multipart/form-data">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <input type="hidden" name="md_no" value="${mdedit.md_no}">

    <div class="row justify-content-center">
      <div class="col-12 col-lg-10">
      	<h4 class="fw-bold text-center mb-4">이달의 MD 추천대사</h4>
		<table class="table table-hover align-middle my-4" style="width:80%; margin:auto;">
            <tbody>
              <tr>
                <th style="width: 140px;">제목</th>
                <td>
                  <input type="text" name="md_title" id="md_title"
                         value="${mdedit.md_title}" class="form-control">
                </td>
              </tr>

              <tr>
                <th>파일 업로드</th>
                <td>
                  <div class="mb-2 small text-muted">
                    현재 파일 : ${mdedit.md_upload}
                  </div>
                  <input type="file" name="file1" id="file1" class="form-control">
                </td>
              </tr>

              <tr>
                <th>노출일정</th>
                <td>
                  <div class="row g-2 align-items-center">
                    <div class="col-12 col-md-4">
                      <input type="text" name="md_start" id="md_start"
                             value="${mdedit.md_start}" class="form-control" placeholder="YYYY-MM-DD">
                    </div>

                    <div class="col-auto text-center text-muted">~</div>

                    <div class="col-12 col-md-4">
                      <input type="text" name="md_end" id="md_end"
                             value="${mdedit.md_end}" class="form-control" placeholder="YYYY-MM-DD">
                    </div>
                  </div>
                </td>
              </tr>

              <tr>
                <th>내용</th>
                <td>
                  <textarea name="md_memo" id="md_memo" rows="5"
                            class="form-control">${mdedit.md_memo}</textarea>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- 버튼 -->
        <div class="d-flex justify-content-center gap-2 mt-3">
			<button type="button"
                  onclick="location.href='/admin/mdDetail?md_no=${mdedit.md_no}'"
                  class="btn btn-outline-primary"> 뒤로 </button>
			<input type="submit" value=" 수정 " class="btn btn-primary">
      </div>
    </div>
  </form>		
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>