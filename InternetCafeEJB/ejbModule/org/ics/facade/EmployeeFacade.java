package org.ics.facade;

import org.ics.ejb.Employee;
import java.util.List;

public interface EmployeeFacade {
    Employee create(Employee employee);
    Employee update(Employee employee);
    void delete(String employeeId);
    Employee findById(String employeeId);
    List<Employee> findAll();
}

