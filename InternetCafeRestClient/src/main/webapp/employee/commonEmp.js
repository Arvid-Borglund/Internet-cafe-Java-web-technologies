function displayResultMessage(message) {
    alert(message);
    if (message === 'Successfully created employee' || message === 'Successfully deleted employee'|| message === 'Successfully updated employee') {
        window.location.href = '/InternetCafeRestClient/index.html';
    }
}



function isUniqueEmployee(employeeId, email, onSuccess, onFailure) {

    const url = 'http://localhost:8080/InternetCafeWeb/api/employees';

    fetch(url)
        .then(response => response.json())
        .then(employees => {
            const existingEmployee = employees.find(emp => emp.employeeId === employeeId || emp.email === email);
            if (existingEmployee) {
                onFailure('Employee ID and/or email already exist. The values must be unique. Try again.');
            } else {
                onSuccess();
            }
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
            onFailure('An error occurred while checking for uniqueness. Try again.');
        });
}

function fetchEmployees() {
    const url = 'http://localhost:8080/InternetCafeWeb/api/employees';
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

function displayEmployees(employees, employeeList) {
    employeeList.empty();
    employees.forEach(employee => {
        const listItem = $("<li>").text(`ID: ${employee.employeeId}, | Name: ${employee.name}, | Address: ${employee.adress}, | Phone: ${employee.phonenumber}, | Email: ${employee.email}, | Hire Date: ${employee.hireDate}, | Job Title: ${employee.jobTitle}`);
        employeeList.append(listItem);
    });
}

function ready(callback) {
    $(document).ready(function() {
        const employeeList = $("#employee-list");
        let employees = [];

        fetchEmployees().then(data => {
            employees = data;
            displayEmployees(employees, employeeList);
            callback(employees, employeeList);
        });
    });
}

