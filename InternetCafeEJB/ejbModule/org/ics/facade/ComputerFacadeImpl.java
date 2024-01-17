package org.ics.facade;

import org.ics.eao.ComputerEAO;
import org.ics.ejb.Computer;
import org.ics.interceptor.LoggingAndValidationInterceptor;

import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.interceptor.Interceptors;

@Stateless
@Interceptors(LoggingAndValidationInterceptor.class)
public class ComputerFacadeImpl implements ComputerFacade {

    @EJB
    private ComputerEAO computerEAO;

    @Override
    public Computer create(Computer computer) {
        return computerEAO.create(computer);
    }

    @Override
    public Computer update(Computer computer) {
        return computerEAO.update(computer);
    }

    @Override
    public void delete(String computerId) {
        computerEAO.delete(computerId);
    }

    @Override
    public Computer findById(String computerId) {
        return computerEAO.findById(computerId);
    }

    @Override
    public List<Computer> findAll() {
        return computerEAO.findAll();
    }
}

