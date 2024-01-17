<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employees Management</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/styles.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</head>
<body data-error-message="${errorMessage}">
	<%@ include file="../common/header.jsp"%>

	<div class="main-content">
		<h1>Employees Management</h1>

		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>Employee ID</th>
						<th>Name</th>
						<th>Address</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Hire Date</th>
						<th>Job Title</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${employees}">
						<tr>
							<td>${employee.employeeId}</td>
							<td>${employee.name}</td>
							<td>${employee.adress}</td>
							<td>${employee.phonenumber}</td>
							<td>${employee.email}</td>
							<td>${employee.hireDate}</td>
							<td>${employee.jobTitle}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="single-row-table-container">
			<table>
				<thead>
					<tr>
						<th>Employee ID</th>
						<th>Name</th>
						<th>Address</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Hire Date</th>
						<th>Job Title</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty foundEmployee}">
						<tr>
							<td>${foundEmployee.employeeId}</td>
							<td>${foundEmployee.name}</td>
							<td>${foundEmployee.adress}</td>
							<td>${foundEmployee.phonenumber}</td>
							<td>${foundEmployee.email}</td>
							<td>${foundEmployee.hireDate}</td>
							<td>${foundEmployee.jobTitle}</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>



		<form id="employee-create-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<input type="hidden" name="entity" value="employee"> <input
				type="hidden" name="action" value="create">
			<div class="input-container">
				<div class="buttons-container">
					<input type="submit" value="Create">
				</div>
				<input type="text" id="employeeId" name="employeeId"
					placeholder="new-Employee ID:" required> <input type="text"
					id="name" name="name" placeholder="new-Name:" required> <input
					type="text" id="adress" name="adress" placeholder="new-Address:"
					required> <input type="text" id="phonenumber"
					name="phonenumber" placeholder="new-Phone Number:" required
					pattern="[0-9]{3,12}" title="Phone Number must be 3 to 12 digits">

				<input type="email" id="email" name="email" placeholder="new-Email:"
					required> <input type="datetime-local" id="hireDate"
					name="hireDate" placeholder="Hire Date:" required> <input
					type="text" id="jobTitle" name="jobTitle"
					placeholder="new-Job Title:" required>
			</div>
		</form>


		<form id="employee-update-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<input type="hidden" name="entity" value="employee"> <input
				type="hidden" name="action" value="update">
			<div class="input-container">
				<div class="buttons-container">
					<input type="submit" value="Update">
				</div>
				<input type="text" id="update-employeeId" name="employeeId"
					placeholder="ID of emp to upt:" required> <input
					type="text" id="update-name" name="name" placeholder="upt-Name:"
					> <input type="text" id="update-adress"
					name="adress" placeholder="upt-Address:"> <input
					type="text" id="update-phonenumber" name="phonenumber"
					placeholder="upt-Phone Number:" pattern="[0-9]{3,12}"
					title="Phone Number must be 3 to 12 digits"> <input
					type="email" id="update-email" name="email"
					placeholder="upt-Email:"> <input type="text"
					id="update-jobTitle" name="jobTitle" placeholder="upt-Job Title:">
			</div>
		</form>


		<form id="employee-delete-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post" onsubmit="return confirmDeleteEntity('employee');">
			<input type="hidden" name="entity" value="employee"> <input
				type="hidden" name="action" value="delete">
			<div class="input-container">
				<div class="buttons-container">
					<input type="submit" value="Delete">
				</div>
				<input type="text" id="delete-employeeId" name="employeeId"
					placeholder="ID of emp to del:" required>
			</div>
		</form>


		<form id="employee-read-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<input type="hidden" name="entity" value="employee"> <input
				type="hidden" name="action" value="read">
			<div class="input-container">
				<div class="buttons-container">
					<input type="submit" value="Read">
				</div>
				<input type="text" id="read-employeeId" name="employeeId"
					placeholder="ID of emp to read:" required>
			</div>
		</form>

	</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>


