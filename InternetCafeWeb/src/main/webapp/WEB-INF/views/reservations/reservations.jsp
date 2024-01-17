<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reservations Management</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/static/css/styles.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</head>
<body data-error-message="${errorMessage}">
<div id="reservations-page"></div>
	<%@ include file="../common/header.jsp"%>

	<div class="main-content">
		<h1>Reservations Management</h1>

		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>Computer ID</th>
						<th>Time Date</th>
						<th>Customer ID</th>
						<th>Employee ID</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="reservation" items="${reservations}">
						<tr>
							<td>${reservation.computer.computerId}</td>
							<td>${reservation.reservationId.timeDate}</td>
							<td>${reservation.customer.customerId}</td>
							<td>${reservation.employee.employeeId}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="single-row-table-container">
			<table>
				<thead>
					<tr>
						<th>Computer ID</th>
						<th>Time Date</th>
						<th>Customer ID</th>
						<th>Employee ID</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty foundReservation}">
						<tr>
							<td>${foundReservation.computer.computerId}</td>
							<td>${foundReservation.reservationId.timeDate}</td>
							<td>${foundReservation.customer.customerId}</td>
							<td>${foundReservation.employee.employeeId}</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>


		<form id="reservation-create-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<input type="hidden" name="entity" value="reservation"> <input
				type="hidden" name="action" value="create">
			<div class="input-container">
				<div class="buttons-container">
					<input type="submit" value="Create">
				</div>
				<!-- For Computer ID -->
				<input type="text" id="create-computerId" name="computerId"
					placeholder="Computer ID:" required list="computerIdList">
				<datalist id="computerIdList"></datalist>

				<!-- For Time Date -->
				<input type="datetime-local" id="create-timeDate" name="timeDate"
					placeholder="Time Date:" required>

				<!-- For Customer ID -->
				<input type="text" id="create-customerId" name="customerId"
					placeholder="Customer ID:" required list="customerIdList">
				<datalist id="customerIdList"></datalist>

				<!-- For Employee ID -->
				<input type="text" id="create-employeeId" name="employeeId"
					placeholder="Employee ID:" required list="employeeIdList">
				<datalist id="employeeIdList"></datalist>
			</div>
		</form>



		<form id="reservation-delete-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post" onsubmit="return confirmDeleteEntity('reservation');">
			<input type="hidden" name="entity" value="reservation"> <input
				type="hidden" name="action" value="delete">
			<div class="input-container">
				<div class="buttons-container">
					<input type="submit" value="Delete">
				</div>
				<input type="text" id="delete-computerId" name="computerId"
					placeholder="Computer ID to delete res:" required> <input
					type="datetime-local" id="delete-timeDate" name="timeDate"
					placeholder="Time Date:" required>
			</div>
		</form>


		<form id="reservation-read-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<input type="hidden" name="entity" value="reservation"> <input
				type="hidden" name="action" value="read">
			<div class="input-container">
				<div class="buttons-container">
					<input type="submit" value="Read">
				</div>
				<input type="text" id="read-computerId" name="computerId"
					placeholder="Computer ID to read res:" required> <input
					type="datetime-local" id="read-timeDate" name="timeDate"
					placeholder="Time Date:" required>
			</div>
		</form>
	</div>
	

	<%@ include file="../common/footer.jsp"%>
</body>
</html>
