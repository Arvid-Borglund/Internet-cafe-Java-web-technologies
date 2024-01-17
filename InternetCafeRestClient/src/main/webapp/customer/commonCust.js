function displayResultMessage(message) {
    alert(message);
    if (message === 'Successfully created customer' || message === 'Successfully deleted customer' || message === 'Successfully updated customer') {
        window.location.href = '/InternetCafeRestClient/index.html';
    }
}

function isUniqueCustomer(customerId, email, onSuccess, onFailure) {
    const url = 'http://localhost:8080/InternetCafeWeb/api/customers';

    fetch(url)
        .then(response => response.json())
        .then(customers => {
            const existingCustomer = customers.find(cust => cust.customerId === customerId || cust.email === email);
            if (existingCustomer) {
                onFailure('Customer ID and/or email already exist. The values must be unique. Try again.');
            } else {
                onSuccess();
            }
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
            onFailure('An error occurred while checking for uniqueness. Try again.');
        });
}

function fetchCustomers() {
    const url = 'http://localhost:8080/InternetCafeWeb/api/customers';
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

function displayCustomers(customers, customerList) {
    customerList.empty();
    customers.forEach(customer => {
        const listItem = $("<li>").text(`ID: ${customer.customerId}, | Name: ${customer.name}, | Address: ${customer.adress}, | Phone: ${customer.phonenumber}, | Email: ${customer.email}, | LoyaltyLevel: ${customer.loyaltyLevel}`);
        customerList.append(listItem);
    });
}

function ready(callback) {
    $(document).ready(function() {
        const customerList = $("#customer-list");
        let customers = [];

        fetchCustomers().then(data => {
            customers = data;
            displayCustomers(customers, customerList);
            callback(customers, customerList);
        });
    });
}
