<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 1:29
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
            <h2>update.jsp</h2>
            <form action="/board/update" method="post">
                회원번호<input class="form-control mb-2" type="text" name="id" value="${board.id}" readonly>
                작성자<input class="form-control mb-2" type="text" name="boardWriter" value="${board.boardWriter}"
                          readonly>
                제목<input class="form-control mb-2" type="text" name="boardTitle" value="${board.boardTitle}">
                내용<textarea class="form-control" name="boardContents" id="boardContents" cols="30"
                            rows="10">${board.boardContents}</textarea><br>
                <input class="btn btn-primary" type="submit" value="정보수정">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
