package org.ics.eao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ics.ejb.Employee;

@Stateless
public class EmployeeEAOImpl implements EmployeeEAO {

    @PersistenceContext(unitName = "InternetCafePU")
    private EntityManager em;

    @Override
    public Employee create(Employee employee) {
        em.persist(employee);
        return employee;
    }

    @Override
    public Employee update(Employee employee) {
        return em.merge(employee);
    }

    @Override
    public void delete(String employeeId) {
        Employee employee = findById(employeeId);
        if (employee != null) {
            em.remove(employee);
        }
    }

    @Override
    public Employee findById(String employeeId) {
        return em.find(Employee.class, employeeId);
    }

    @Override
    public List<Employee> findAll() {
        return em.createQuery("SELECT e FROM Employee e", Employee.class).getResultList();
    }
}

