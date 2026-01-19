<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
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
		<span class="title_font">회원목록</span>
	</div>
</div>

<div class="container py-4">

    <div class="table-responsive">
        <table class="table table-hover my-4" style="width:100%; margin:auto; text-align:center;">
            <thead class="table-light">
                <tr>
                    <th>번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>생년월일</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>가입일</th>
                    <th>권한</th>
                    <th>관리</th>
                </tr>
            </thead>

            <tbody>
            <c:forEach var="dto" items="${m_list}">
                <tr>
                    <td class="text-muted">${dto.m_no}</td>

                    <td>
                        <a class="text-decoration-none fw-semibold text-primary">
                            ${dto.m_id}
                        </a>
                    </td>

                    <td>${dto.m_name}</td>
                    <td>${dto.m_gender}</td>
                    <td>${dto.m_birth}</td>
                    <td>${dto.m_email}</td>
                    <td>${dto.m_tel}</td>

                    <td>
                        <fmt:formatDate value="${dto.m_join}" pattern="yyyy-MM-dd" />
                    </td>

                    <td>
                        <c:choose>
                            <c:when test="${dto.m_auth == 'ROLE_ADMIN'}">
                                <span class="badge bg-primary">ADMIN</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-success">USER</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <form action="/admin/member/memberDelete"
                              method="post"
                              onsubmit="return confirm('정말 이 회원을 강퇴하시겠습니까?');"
                              class="d-inline">

                            <input type="hidden"
                                   name="${_csrf.parameterName}"
                                   value="${_csrf.token}" />

                            <input type="hidden" name="m_no" value="${dto.m_no}" />

                            <button type="submit"
                                    class="btn btn-outline-primary btn-sm px-3">
                                강퇴
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
