<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
</head>
<body>
    <div class="header">
        <div class="dropdown">
            <span>Menu</span>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/InternetCafeController?action=default">Home</a>
                <a href="${pageContext.request.contextPath}/InternetCafeController?action=showEmployees">Employees</a>
                <a href="${pageContext.request.contextPath}/InternetCafeController?action=showCustomers">Customers</a>
                <a href="${pageContext.request.contextPath}/InternetCafeController?action=showComputers">Computers</a>
                <a href="${pageContext.request.contextPath}/InternetCafeController?action=showReservations">Reservations</a>
                <a href="${pageContext.request.contextPath}/InternetCafeController?action=showAbout">About</a>
            </div>
        </div>
        <img class="logo" src="${pageContext.request.contextPath}/static/img/InternetCafelogga.png" alt="Logo" />
    </div>
</body>
</html>
