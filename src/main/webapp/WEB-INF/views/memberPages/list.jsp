<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>list.jsp</h2>
    <table class="table">
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>프로필사진</th>
            <th>상세조회</th>
            <th>회원삭제</th>
        </tr>
        <c:forEach var="member" items="${memberList}">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td><img src="${pageContext.request.contextPath}/upload/${member.memberProfile}"
                         alt="${member.memberProfile}" height="100" width="100"></td>
                <td><a href="/member/detail?id=${member.id}">상세조회</a></td>
                <td><a href="/member/delete?id=${member.id}">회원삭제</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
