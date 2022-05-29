<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 2:03
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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2 class="display-4 fw-normal">update.jsp</h2>
            <form action="/member/update" method="post" name="updateForm">
                아이디<input class="form-control mb-2" type="text" name="memberId" id="memberId"
                          value="${updateMember.memberId}" readonly>
                비밀번호<input class="form-control mb-2" type="password" name="memberPassword" id="pwConfirm"
                           placeholder="비밀번호를 입력하세요">
                이름<input class="form-control mb-2" type="text" name="memberName" value="${updateMember.memberName}">
                이메일<input class="form-control mb-2" type="text" name="memberEmail" value="${updateMember.memberEmail}">
                전화번호<input class="form-control mb-2" type="text" name="memberMobile"
                           value="${updateMember.memberMobile}">
                <input class="btn btn-primary" onclick="update()" type="button" value="정보수정">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    const update = () => {
        console.log("update함수 호출")
        const pw = document.getElementById("pwConfirm").value;
        const pwDB = '${updateMember.memberPassword}';
        if (pw == pwDB) {
            updateForm.submit(); // 노란줄 있지만 잘됨
        } else {
            alert("비밀번호 불일치")
        }
    }
</script>
</html>
