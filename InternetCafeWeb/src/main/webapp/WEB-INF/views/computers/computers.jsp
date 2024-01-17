<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Computers Management</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/styles.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/scripts.js"></script>
</head>
<body data-error-message="${errorMessage}">
	<%@ include file="../common/header.jsp"%>

	<div class="main-content">
		<h1>Computers Management</h1>

		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>Computer ID</th>
						<th>CPU</th>
						<th>GPU</th>
						<th>RAM</th>
						<th>Data Storage</th>
						<th>Reserved Today</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="computer" items="${computers}">
						<tr>
							<td>${computer.computerId}</td>
							<td>${computer.cpu}</td>
							<td>${computer.gpu}</td>
							<td>${computer.ram}</td>
							<td>${computer.dataStorage}</td>
							<td>${computer.reserved}</td>
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
						<th>CPU</th>
						<th>GPU</th>
						<th>RAM</th>
						<th>Data Storage</th>
						<th>Reserved</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty foundComputer}">
						<tr>
							<td>${foundComputer.computerId}</td>
							<td>${foundComputer.cpu}</td>
							<td>${foundComputer.gpu}</td>
							<td>${foundComputer.ram}</td>
							<td>${foundComputer.dataStorage}</td>
							<td>${foundComputer.reserved}</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>

		<form id="computer-create-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<div class="input-container">
				<input type="hidden" name="entity" value="computer"> <input
					type="hidden" name="action" value="create">
				<div class="buttons-container">
					<input type="submit" value="Create">
				</div>
				<input type="text" id="computerId" name="computerId"
					placeholder="new-Computer ID:" required> <input type="text"
					id="cpu" name="cpu" placeholder="new-CPU:" required> <input
					type="text" id="gpu" name="gpu" placeholder="new-GPU:" required>
				<input type="number" id="ram" name="ram" placeholder="new-RAM:"
					required> <input type="text" id="dataStorage"
					name="dataStorage" placeholder="new-Data Storage:" required>
			</div>
		</form>

		<form id="computer-update-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<div class="input-container">
				<input type="hidden" name="entity" value="computer"> <input
					type="hidden" name="action" value="update">
				<div class="buttons-container">
					<input type="submit" value="Update">
				</div>
				<input type="text" id="computerId" name="computerId"
					placeholder="ID of PC to upt:" required> <input type="text"
					id="cpu" name="cpu" placeholder="upt-CPU:"> <input
					type="text" id="gpu" name="gpu" placeholder="upt-GPU:"> <input
					type="number" id="ram" name="ram" placeholder="upt-RAM:"> <input
					type="text" id="dataStorage" name="dataStorage"
					placeholder="upt-Data Storage:">
			</div>
		</form>

		<form id="computer-delete-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post" onsubmit="return confirmDeleteComputer();">
			<div class="input-container">
				<input type="hidden" name="entity" value="computer"> <input
					type="hidden" name="action" value="delete">
				<div class="buttons-container">
					<input type="submit" value="Delete">
				</div>
				<input type="text" id="delete-computerId" name="computerId"
					placeholder="ID of PC to del:" required>
			</div>
		</form>


		<!-- Computer Read Form -->
		<form id="computer-read-form"
			action="${pageContext.request.contextPath}/InternetCafeController"
			method="post">
			<div class="input-container">
				<input type="hidden" name="entity" value="computer"> <input
					type="hidden" name="action" value="read">
				<div class="buttons-container">
					<input type="submit" value="Read">
				</div>
				<input type="text" id="read-computerId" name="computerId"
					placeholder="ID of PC to read:" required>
			</div>
		</form>


	</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>

