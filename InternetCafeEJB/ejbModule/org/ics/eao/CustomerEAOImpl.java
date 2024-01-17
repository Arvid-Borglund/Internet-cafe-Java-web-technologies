package org.ics.eao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ics.ejb.Customer;

@Stateless
public class CustomerEAOImpl implements CustomerEAO {

    @PersistenceContext(unitName = "InternetCafePU")
    private EntityManager em;

    @Override
    public Customer create(Customer customer) {
        em.persist(customer);
        return customer;
    }

    @Override
    public Customer update(Customer customer) {
        return em.merge(customer);
    }

    @Override
    public void delete(String customerId) {
        Customer customer = findById(customerId);
        if (customer != null) {
            em.remove(customer);
        }
    }

    @Override
    public Customer findById(String customerId) {
        return em.find(Customer.class, customerId);
    }

    @Override
    public List<Customer> findAll() {
        return em.createQuery("SELECT c FROM Customer c", Customer.class).getResultList();
    }
}

