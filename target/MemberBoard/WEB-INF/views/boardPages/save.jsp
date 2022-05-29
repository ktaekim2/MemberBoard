<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 4:27
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
    <div class="text-center">
        <h2>save.jsp</h2>
    </div>
</div>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <form action="/board/save" method="post">
                <div class="row">
                        작성자<input class="form-control mb-2" type="text" id="boardWriter" name="boardWriter"
                                  placeholder="${sessionScope.loginMemberId}">
                </div>
                <div class="row">
                    제목<input class="form-control mb-2" type="text" id="boardTitle" name="boardTitle">
                    내용<textarea class="form-control" name="boardContents" id="boardContents" cols="30"
                                rows="10"></textarea><br>
                    <input class="btn btn-primary" type="submit" value="글쓰기">
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
