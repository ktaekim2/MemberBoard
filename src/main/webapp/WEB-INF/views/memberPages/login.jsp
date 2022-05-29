<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        input {
            display: block;
        }
    </style>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2>login.jsp</h2>
            <form action="/member/login" method="post">
                <input type="text" name="memberId" placeholder="아이디"><br>
                <input type="password" name="memberPassword" placeholder="비밀번호"><br>
                <input type="submit" value="로그인">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
