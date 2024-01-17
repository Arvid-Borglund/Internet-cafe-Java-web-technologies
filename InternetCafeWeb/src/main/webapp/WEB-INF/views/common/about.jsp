
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div class="homepage">
        <%@ include file="../common/header.jsp"%>

        <div class="main-content">
            <h1 class="ProjectInfo">This app was developed by student Arvid Borglund, in the Spring of 2023 for the course Software Architecture
            at ics LU. It's a scaled down web-version of a more comprehensive system for managing all business processes at an internet-cafe.
            Full-scale version is
            present in prior course, with full login/ user functionality, personal profiles, game-management, different accessroles and UIs (gameportal for customers etc), it's a full-scale
            system with aim to be a production-ready deployable product.
            This scaled down web-version is not meant to be a production-ready product, it's just a showcase of some of the reservation functionality and "automatic" relationship
            functionality for entities relating to reservations. 
              </h1>
        </div>

        <%@ include file="../common/footer.jsp"%>
    </div>
</body>
</html>