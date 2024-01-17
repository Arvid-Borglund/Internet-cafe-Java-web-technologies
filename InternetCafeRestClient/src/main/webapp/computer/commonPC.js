function displayResultMessage(message) {
	alert(message);
	if (message === 'Successfully created computer' || message === 'Successfully deleted computer' || message === 'Successfully updated computer') {
		window.location.href = '/InternetCafeRestClient/index.html';
	}
}

function isUniqueComputer(computerId, onSuccess, onFailure) {
	const url = 'http://localhost:8080/InternetCafeWeb/api/computers';

	fetch(url)
		.then(response => response.json())
		.then(computers => {
			const existingComputer = computers.find(comp => comp.computerId === computerId);
			if (existingComputer) {
				onFailure('Computer ID already exists. The value must be unique. Try again.');
			} else {
				onSuccess();
			}
		})
		.catch(error => {
			console.error('There was a problem with the fetch operation:', error);
			onFailure('An error occurred while checking for uniqueness. Try again.');
		});
}

function fetchComputers() {
	const url = 'http://localhost:8080/InternetCafeWeb/api/computers';
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

function displayComputers(computers, computerList) {
	computerList.empty();
	computers.forEach(computer => {
		const listItem = $("<li>").text(`ID: ${computer.computerId}, | CPU: ${computer.cpu}, | GPU: ${computer.gpu}, | RAM: ${computer.ram}, | Data Storage: ${computer.dataStorage}, | Reserved today: ${computer.reserved}`);
		computerList.append(listItem);
	});
}

function ready(callback) {
	$(document).ready(function() {
		const computerList = $("#computer-list");
		let computers = [];

		fetchComputers().then(data => {
			computers = data;
			displayComputers(computers, computerList);
			callback(computers, computerList);
		});
	});
}
