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
  /* ===== 타이틀 영역(네 원래 스타일 유지) ===== */
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
    margin: 0;
  }
  .title_sub_font{
    font-size: 30px;
    font-weight: bold;
    color: #998e8e;
    letter-spacing: 5px;
    margin: 0;
  }

  .mulist_contents{
    max-width: 1280px;
    width: calc(100% - 60px);
    margin: 0 auto 90px;
    box-sizing: border-box;
  }

  .md-card{
    border: 1px solid #eee;
    border-radius: 14px;
    overflow: hidden;
    background: #fff;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    display: flex;
    flex-direction: column;   /* ⭐ 세로 스택 */
    height: 100%;
    text-align: center;
  }

  /* 썸네일 */
  .md-thumb{
    height: 200px;           /* ⭐ 이미지 크기 고정 */
    background: #f6f6f6;
  }
  .md-thumb img{
    width: 100%;
    height: 100%;
    object-fit: cover;       /* ⭐ 비율 유지 + 꽉 채움 */
    display: block;
  }

  /* 본문 */
  .md-body{
    padding: 14px 14px 8px;
    flex: 1;                 /* ⭐ 남은 공간 먹어서 버튼 아래로 정리 */
  }
  .md-title{
    font-weight: 800;
    font-size: 16px;
    margin-bottom: 6px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }
  .md-date{
    font-size: 13px;
    color: #666;
    margin-bottom: 10px;
  }

  /* 내용 3줄 제한(카드 높이 통일) */
  .md-memo{
    font-size: 13px;
    color: #333;
    line-height: 1.5;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
    overflow: hidden;
  }

  /* 버튼 영역 */
  .md-footer{
    padding: 12px 14px 14px;
  }
  .md-footer .btn{
    width: 140px;            /* 버튼 폭 통일 */
  }

  /* hover */
  .md-card:hover{
    transform: translateY(-3px);
    transition: transform .2s ease, box-shadow .2s ease;
    box-shadow: 0 10px 22px rgba(0,0,0,0.12);
  }
</style>
</head>

<body>

<div class="title_size">
  <div class="title_inner">
    <p class="title_font">MD목록</p>
    <p class="title_sub_font">: 이달의 MD 추천 명대사</p>
  </div>
</div>

<div class="container py-4">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

  <div class="mulist_contents">
    <div class="row g-4">
      <c:forEach var="dto" items="${list}">
        <div class="col-12 col-md-4">

          <div class="md-card">
            <div class="md-thumb">
              <img src="/images/${dto.md_upload}" alt="${dto.md_title}">
            </div>

            <div class="md-body">
              <div class="md-title">${dto.md_title}</div>
              <div class="md-date">${dto.md_start} ~ ${dto.md_end}</div>
              <div class="md-memo">${dto.md_memo}</div>
            </div>

            <div class="md-footer">
              <button type="button"
                      onclick="location.href='/admin/mdDetail?md_no=${dto.md_no}'"
                      class="btn btn-outline-primary btn-sm">
                자세히보기
              </button>
            </div>
          </div>

        </div>
      </c:forEach>
    </div>
  </div>

  <div class="text-center">
    <button type="button" onclick="location.href='/admin/mdWriteForm'" class="btn btn-primary">
      MD 등록하기
    </button>
  </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
