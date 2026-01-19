<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓거래 게시글 수정</title>

<style>
.width60 {
    width: 60%;
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
<div class="title_size">
	<div class="title_inner">
		<span class="title_font">티켓 중고거래 수정</span>
	</div>
</div>


<div class="container py-4">


    <form name="exchangeUpdateForm"
          method="post"
          action="/exchange/exchangeUpdate"
          enctype="multipart/form-data">

        <!-- CSRF -->
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}">
        
        <input type="hidden" name="ex_no" value="${exedit.ex_no}">
		<input type="hidden" name="ex_writer" value="${exedit.ex_writer}">
		<input type="hidden" name="m_no" value="${exedit.m_no}">



        <div class="container-fluid">
            <table class="table table-hover my-4"
                   style="width:70%; margin:auto;">

                <tr>
                    <td>제목</td>
                    <td>
                        <input type="text"
                               name="ex_title"
                               id="ex_title"
                               class="form-control width60"
                               value="${exedit.ex_title}"
                               required>
                    </td>
                </tr>

                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="ex_detail"
                                  id="ex_detail"
                                  rows="6"
                                  class="form-control width60"
                                  required>${exedit.ex_detail}</textarea>
                    </td>
                </tr>

                <tr>
                    <td>사진 업로드</td>
                    <td>
                        <input type="file"
                               name="file1"
                               id="file1"
                               class="form-control width60">
                    </td>
                </tr>

                <tr>
                    <td>거래현황</td>
                    <td>
                        <select name="ex_ing"
                                id="ex_ing"
                                class="form-select width60"
                                required>
                            <option value="">선택해주세요</option>
                            <option value="거래중"
                                <c:if test="${exedit.ex_ing eq '거래중'}">selected</c:if>>
                                거래중
                            </option>
                            <option value="거래완료"
                                <c:if test="${exedit.ex_ing eq '거래완료'}">selected</c:if>>
                                거래완료
                            </option>
                        </select>
                    </td>
                </tr>

            </table>
        </div>

        <div class="text-center">
            <input type="submit" value="수정하기" class="btn btn-primary">
            <input type="reset" value="다시 쓰기" class="btn btn-outline-primary">
        </div>

        <p class="text-center mt-3">
            <a href="/exchange/exchangeList" class="text-decoration-none">
                티켓거래 리스트로 이동
            </a>
        </p>

    </form>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
