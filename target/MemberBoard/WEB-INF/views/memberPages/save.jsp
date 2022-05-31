<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 2:24
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
            <h2 class="display-4 fw-normal">save.jsp</h2>
            <form action="/member/save" method="post" enctype="multipart/form-data">
                아이디<input type="text" name="memberId" id="memberId" onblur="duplicateCheck()">
                <span id="dup-check-result"></span><br>
                비밀번호<input type="password" name="memberPassword" id="memberPassword" onblur="passwordCheck()"
                           placeholder="8~16, 영문대소문자" >
                <p id="passwordCheckResult"></p>
                이름<input type="text" name="memberName">
                이메일<input type="text" name="memberEmail">
                전화번호<input type="text" name="memberMobile" id="memberMobile" onblur="mobileCheck()"
                           placeholder="000-0000-0000">
                <p id="mobileCheckResult"></p>
                프로필사진<input type="file" name="memberProfileFile"><br>
                <input class="btn btn-primary" type="submit" value="회원가입">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    function passwordCheck() {
        const memberPassword = document.getElementById("memberPassword").value;
        const passwordCheckResult = document.getElementById("passwordCheckResult");
        const exp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[A-Za-z\d]{8,16}$/;
        if (memberPassword.match(exp)) {
            passwordCheckResult.innerHTML = "올바른 비밀번호 형식";
            passwordCheckResult.style.color = "green";
        } else {
            passwordCheckResult.innerHTML = "잘못된 비밀번호 형식";
            passwordCheckResult.style.color = "red";
        }
    }

    function mobileCheck() {
        const memberMobile = document.getElementById("memberMobile").value;
        const mobileCheckResult = document.getElementById("mobileCheckResult");
        const exp = /^\d{3}-\d{4}-\d{4}$/;
        if (memberMobile.match(exp)) {
            mobileCheckResult.innerHTML = "올바른 전화번호 형식";
            mobileCheckResult.style.color = "green";
        } else {
            mobileCheckResult.innerHTML = "잘못된 전화번호 형식";
            mobileCheckResult.style.color = "red";
        }
    }

    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post",
            url: "duplicate-check",
            data: {"memberId": memberId},
            dataType: "text",
            success: function (result) {
                if (result == "ok") {
                    checkResult.innerHTML = "사용가능한 아이디";
                    checkResult.style.color = "green";
                } else {
                    checkResult.innerHTML = "이미 사용중인 아이디";
                    checkResult.style.color = "red";
                }
            },
            error: function () {
            }
        });
    }
</script>
</html>
