package org.ics.facade;

import org.ics.eao.CustomerEAO;
import org.ics.ejb.Customer;
import org.ics.interceptor.LoggingAndValidationInterceptor;

import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.interceptor.Interceptors;

@Stateless
@Interceptors(LoggingAndValidationInterceptor.class)
public class CustomerFacadeImpl implements CustomerFacade {

    @EJB
    private CustomerEAO customerEAO;

    @Override
    public Customer create(Customer customer) {
        return customerEAO.create(customer);
    }

    @Override
    public Customer update(Customer customer) {
        return customerEAO.update(customer);
    }

    @Override
    public void delete(String customerId) {
        customerEAO.delete(customerId);
    }

    @Override
    public Customer findById(String customerId) {
        return customerEAO.findById(customerId);
    }

    @Override
    public List<Customer> findAll() {
        return customerEAO.findAll();
    }
}
