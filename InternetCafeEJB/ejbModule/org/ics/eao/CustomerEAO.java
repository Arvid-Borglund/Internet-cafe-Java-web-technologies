package org.ics.eao;

import java.util.List;

import org.ics.ejb.Customer;

public interface CustomerEAO {
    Customer create(Customer customer);
    Customer update(Customer customer);
    void delete(String customerId);
    Customer findById(String customerId);
    List<Customer> findAll();
}

