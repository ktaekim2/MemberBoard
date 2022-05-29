<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2 class="display-4 fw-normal">main.jsp</h2>
            <%--            <button class="btn btn-outline-success" onclick="save()">회원가입</button>--%>
            <%--            <button class="btn btn-outline-success" onclick="login()">로그인</button>--%>
            <a href="/member/update">회원정보 수정</a>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
