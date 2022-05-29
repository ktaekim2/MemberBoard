<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        button {
            display: block;
        }
    </style>
    <script>
        function save() {
            location.href = "/member/save";
        }

        function login() {
            location.href = "/member/login";
        }

        function paging() {
            location.href = "/board/paging";
        }
    </script>
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2 class="display-4 fw-normal">index.jsp</h2>
<%--            <button class="btn btn-outline-success" onclick="save()">회원가입</button>--%>
<%--            <button class="btn btn-outline-success" onclick="login()">로그인</button>--%>
            <button class="btn btn-outline-success" onclick="paging()">글목록</button>
        </div>
    </div>
</div>
<jsp:include page="./layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
