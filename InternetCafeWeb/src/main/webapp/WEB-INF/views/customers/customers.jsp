<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customers Management</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/styles.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</head>
<body data-error-message="${errorMessage}">
	<%@ include file="../common/header.jsp"%>

	<div class="main-content">
		<h1>Customers Management</h1>


		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>Customer ID</th>
						<th>Name</th>
						<th>Address</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Loyalty Level</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="customer" items="${customers}">
						<tr>
							<td>${customer.customerId}</td>
							<td>${customer.name}</td>
							<td>${customer.adress}</td>
							<td>${customer.phonenumber}</td>
							<td>${customer.email}</td>
							<td>${customer.loyaltyLevel}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="single-row-table-container">
			<table>
				<thead>
					<tr>
						<th>Customer ID</th>
						<th>Name</th>
						<th>Address</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Loyalty Level</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty foundCustomer}">
						<tr>
							<td>${foundCustomer.customerId}</td>
							<td>${foundCustomer.name}</td>
							<td>${foundCustomer.adress}</td>
							<td>${foundCustomer.phonenumber}</td>
							<td>${foundCustomer.email}</td>
							<td>${foundCustomer.loyaltyLevel}</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>


		<form id="customer-create-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<div class="input-container">
				<input type="hidden" name="entity" value="customer"> <input
					type="hidden" name="action" value="create">
				<div class="buttons-container">
					<input type="submit" value="Create">
				</div>
				<input type="text" id="customerId" name="customerId"
					placeholder="new-Customer ID:" required> <input type="text"
					id="name" name="name" placeholder="new-Name:" required> <input
					type="text" id="adress" name="adress" placeholder="new-Address:"
					required> <input type="text" id="phonenumber"
					name="phonenumber" placeholder="new-Phone Number:" required
					pattern="[0-9]{3,12}" title="Phone Number must be 3 to 12 digits">

				<input type="email" id="email" name="email" placeholder="new-Email:"
					required>
			</div>
		</form>


		<form id="customer-update-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<div class="input-container">
				<input type="hidden" name="entity" value="customer"> <input
					type="hidden" name="action" value="update">
				<div class="buttons-container">
					<input type="submit" value="Update">
				</div>
				<input type="text" id="update-customerId" name="customerId"
					placeholder="ID of cust to upt:" required> <input
					type="text" id="update-name" name="name" placeholder="upt-Name:">
				<input type="text" id="update-adress" name="adress"
					placeholder="upt-Address:"> <input type="text"
					id="update-phonenumber" name="phonenumber"
					placeholder="upt-Phone Number:" pattern="[0-9]{3,12}"
					title="Phone Number must be 3 to 12 digits"> <input
					type="email" id="update-email" name="email"
					placeholder="upt-Email:">
			</div>
		</form>


		<form id="customer-delete-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post" onsubmit="return confirmDeleteEntity('customer');">
			<div class="input-container">
				<input type="hidden" name="entity" value="customer"> <input
					type="hidden" name="action" value="delete">
				<div class="buttons-container">
					<input type="submit" value="Delete">
				</div>
				<input type="text" id="delete-customerId" name="customerId"
					placeholder="ID of cust to del:" required>
			</div>
		</form>


		<form id="customer-read-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<div class="input-container">
				<input type="hidden" name="entity" value="customer"> <input
					type="hidden" name="action" value="read">
				<div class="buttons-container">
					<input type="submit" value="Read">
				</div>
				<input type="text" id="read-customerId" name="customerId"
					placeholder="ID of cust to read:" required>
			</div>
		</form>

	</div>

	<%@ include file="../common/footer.jsp"%>
</body>

</html>


