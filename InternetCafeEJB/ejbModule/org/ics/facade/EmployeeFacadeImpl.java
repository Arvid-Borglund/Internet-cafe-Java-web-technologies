package org.ics.facade;

import org.ics.eao.EmployeeEAO;
import org.ics.ejb.Employee;
import org.ics.interceptor.LoggingAndValidationInterceptor;

import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.interceptor.Interceptors;

@Stateless
@Interceptors(LoggingAndValidationInterceptor.class)
public class EmployeeFacadeImpl implements EmployeeFacade {

    @EJB
    private EmployeeEAO employeeEAO;

    @Override
    public Employee create(Employee employee) {
        return employeeEAO.create(employee);
    }

    @Override
    public Employee update(Employee employee) {
        return employeeEAO.update(employee);
    }

    @Override
    public void delete(String employeeId) {
        employeeEAO.delete(employeeId);
    }

    @Override
    public Employee findById(String employeeId) {
        return employeeEAO.findById(employeeId);
    }

    @Override
    public List<Employee> findAll() {
        return employeeEAO.findAll();
    }
}

