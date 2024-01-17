function displayResultMessage(message) {
	alert(message);
	if (message === 'Successfully created reservation' || message === 'Successfully deleted reservation') {
		window.location.href = '/InternetCafeRestClient/index.html';
	}
}

function isUniqueReservation(computerId, timeDate, onSuccess, onFailure) {
	const url = 'http://localhost:8080/InternetCafeWeb/api/reservations';

	fetch(url)
		.then(response => response.json())
		.then(reservations => {
			const inputDate = new Date(timeDate).toISOString().split('T')[0];
			const existingReservation = reservations.find(res => res.reservationId.computerId === computerId && new Date(res.reservationId.timeDate).toISOString().split('T')[0] === inputDate);
			if (existingReservation) {
				onFailure('Reservation with this Computer ID and Date already exists. The value must be unique. Try again.');
			} else {
				onSuccess();
			}
		})
		.catch(error => {
			console.error('There was a problem with the fetch operation:', error);
			onFailure('An error occurred while checking for uniqueness. Try again.');
		});
}




function fetchReservations() {
	const url = 'http://localhost:8080/InternetCafeWeb/api/reservations';
	return fetch(url)
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json();
		})
		.catch(error => {
			console.error('There was a problem with the fetch operation:', error);
		});
}

function displayReservations(reservations, reservationList) {
	console.log(reservations); // log the reservations
	reservationList.empty();
	reservations.forEach(reservation => {
		const computerId = reservation.computer ? reservation.computer.computerId : 'N/A';
		const customerId = reservation.customer ? reservation.customer.customerId : 'N/A';
		const employeeId = reservation.employee ? reservation.employee.employeeId : 'N/A';

		const listItem = $("<li>").text(`Computer ID: ${computerId}, | Date: ${reservation.timeDate}, | Customer ID: ${customerId}, | Employee ID: ${employeeId}`);
		reservationList.append(listItem);
	});
}



function ready(callback) {
	$(document).ready(function() {
		const reservationList = $("#reservation-list");
		let reservations = [];

		fetchReservations().then(data => {
			reservations = data;
			displayReservations(reservations, reservationList);
			callback(reservations, reservationList);
		});
	});
}
