<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="text-center">
        <h2 class="display-4 fw-normal">pagingList.jsp</h2>
    </div>
</div>
<div class="container mt-3">
    <%--    mt: margintop--%>
    <form action="/board/search" method="get">
        <select name="searchType" id="">
            <option value="boardTitle">제목</option>
            <option value="boardWriter">작성자</option>
        </select>
        <input type="text" name="q" placeholder="검색어입력..">
        <input type="submit" value="검색">
    </form>
</div>
<div class="container">
    <table class="table table-hover">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr href="/board/detail?id=${board.id}">
                <td>${board.id}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardWriter}</td>
                <td><fmt:formatDate pattern="yy-MM-dd hh:mm"
                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="container">
    <ul class="pagination justify-content-center">
        <%--        이전--%>
        <c:choose>
            <%--            현재 페이지가 1페이지면 이전 글자만 보여줌--%>
            <c:when test="${paging.page<=1}">
                <%--                page=1이면--%>
                <%--            if 역할--%>
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <%--            1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청--%>
            <c:otherwise>
                <%--                else 역할--%>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <%--            begin: 시작값, end: 끝값, var: 반복변수, step: 증감--%>
            <%--            java로 보면 -> for(int i = startPage; i = endPage; i++)--%>
            <c:choose>
                <%--                현재 내가 있는 페이지는 그냥 text로 표현--%>
                <c:when test="${i eq paging.page}">
                    <%--                    jsp문법은 '=='대신 eq(equals)로 표현--%>
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <%--                    다른 페이지는 링크로 표현--%>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <%--        다음--%>
        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
    <button onclick="save()">글쓰기</button>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    const save = () => {
        location.href = "/board/save";
    }
</script>
</html>
