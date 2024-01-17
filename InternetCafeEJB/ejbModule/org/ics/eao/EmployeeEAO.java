package org.ics.eao;

import java.util.List;

import org.ics.ejb.Employee;

public interface EmployeeEAO {
    Employee create(Employee employee);
    Employee update(Employee employee);
    void delete(String employeeId);
    Employee findById(String employeeId);
    List<Employee> findAll();
}

