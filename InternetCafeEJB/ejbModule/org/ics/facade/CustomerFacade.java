package org.ics.facade;

import org.ics.ejb.Customer;
import java.util.List;

public interface CustomerFacade {
    Customer create(Customer customer);
    Customer update(Customer customer);
    void delete(String customerId);
    Customer findById(String customerId);
    List<Customer> findAll();
}

