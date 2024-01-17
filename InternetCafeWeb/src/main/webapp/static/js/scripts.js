function fetchWeatherData() {
	const apiKey = 'efcc0176f0e767d50c23ce0c874c5a8b'; // Replace with your API key
	const lat = 55.70526765782419;
	const lon = 13.189397397569659;
	const units = 'metric'; // Use 'metric' for Celsius, 'imperial' for Fahrenheit

	const apiUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}&units=${units}`;

	$.ajax({
		url: apiUrl,
		type: 'GET',
		success: function(data) {
			$('#temperature').text(data.main.temp + '°C');
			$('#weather').text(data.weather[0].description);
		},
		error: function(error) {
			console.error('Error fetching weather data:', error);
		}
	});
}

$(document).ready(function() {
    fetchWeatherData();
});


// Fetch all computers and populate the datalist
function fetchComputers() {
	fetch('/InternetCafeWeb/InternetCafeController?action=availableComputers')


		.then(response => response.json())
		.then(data => {
			let computerDatalist = document.getElementById('computerIdList');
			computerDatalist.innerHTML = '';

			data.forEach(computer => {
				let option = document.createElement('option');
				option.value = computer.computerId;
				option.text = computer.computerId + ' (Reserved today: ' + computer.reserved + ')';
				computerDatalist.appendChild(option);
			});
		});
}

function fetchCustomers() {
	fetch('/InternetCafeWeb/InternetCafeController?action=allCustomers')


		.then(response => response.json())
		.then(customers => {
			let suggestions = customers.map(customer => `${customer.customerId} - ${customer.name}`);
			let datalist = document.getElementById('customerIdList');
			datalist.innerHTML = '';
			suggestions.forEach(suggestion => {
				let option = document.createElement('option');
				option.value = suggestion.split(' - ')[0];
				option.innerText = suggestion;
				datalist.appendChild(option);
			});
		});
}


function fetchEmployees() {
	fetch('/InternetCafeWeb/InternetCafeController?action=allEmployees')


		.then(response => response.json())
		.then(employees => {
			let suggestions = employees.map(employee => `${employee.employeeId} - ${employee.name}`);
			let datalist = document.getElementById('employeeIdList');
			datalist.innerHTML = '';
			suggestions.forEach(suggestion => {
				let option = document.createElement('option');
				option.value = suggestion.split(' - ')[0];
				option.innerText = suggestion;
				datalist.appendChild(option);
			});
		})
}




function confirmDeleteComputer() {
	const computerId = $('#delete-computerId').val();
	let allowSubmission = false;

	// Fetch reservations and count how many have the specified computerId
	$.ajax({
		url: '/InternetCafeWeb/InternetCafeController?action=allReservations',
		type: 'GET',
		dataType: 'json',
		async: false, // Make the AJAX call synchronous
		success: function(reservations) {
			const relatedReservations = reservations.filter(reservation => reservation.computer.computerId === computerId).length;

			let message;
			if (relatedReservations > 0) {
				message = `This computer currently is related to ${relatedReservations} reservations in the system. The reservations associated with this computer must be deleted before this computer can be removed.`;
			} else {
				message = `Are you sure you want to permanently delete this computer (with computer id ${computerId}) and any data associated with this computer?`;
			}

			if (window.confirm(message)) {
				if (relatedReservations === 0) {
					// If the computer is not related to any reservations, allow form submission
					allowSubmission = true;
				} else {
					// If the computer is related to reservations, display a success message
					alert('Navigate to the reservations page to delete reservations');
				}
			}
		},
		error: function(error) {
			console.error('Error fetching reservations:', error);
		}
	});

	// Return the value of allowSubmission
	return allowSubmission;
}

function confirmDeleteEntity(entityType) {
	const entityId = getEntityId(entityType);
	const message = `Are you sure you want to permanently delete ${entityType} with ID ${entityId} from the system?`;

	return window.confirm(message);
}

function getEntityId(entityType) {
	switch (entityType) {
		case 'customer':
			return $('#delete-customerId').val();
		case 'employee':
			return $('#delete-employeeId').val();
		case 'reservation':
			return $('#delete-computerId').val();
		default:
			return null;
	}
}

function isReservationsView() {
    return document.getElementById('reservations-page') !== null;
}

window.addEventListener("load", function() {
    var errorMessage = document.body.getAttribute("data-error-message");
    if (errorMessage) {
        // Replace this with your preferred error window popup implementation
        alert(errorMessage);
    }
});


window.addEventListener('DOMContentLoaded', () => {
    if (isReservationsView()) {
        document.getElementById('create-computerId').addEventListener('focus', fetchComputers);
        document.getElementById('create-customerId').addEventListener('focus', fetchCustomers);
        document.getElementById('create-employeeId').addEventListener('focus', fetchEmployees);
    }
});
