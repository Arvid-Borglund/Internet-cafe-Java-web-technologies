<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to the Internet Cafe Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div class="homepage">
        <%@ include file="../common/header.jsp"%>

        <div class="main-content">
            <h1 class="welcome-message">Welcome to the Internet Cafe Management System!!</h1>
        </div>

        <%@ include file="../common/footer.jsp"%>
    </div>
</body>
</html>
