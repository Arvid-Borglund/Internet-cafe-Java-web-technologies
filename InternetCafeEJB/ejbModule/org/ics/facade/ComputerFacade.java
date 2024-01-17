package org.ics.facade;


import org.ics.ejb.Computer;
import java.util.List;

public interface ComputerFacade {
    Computer create(Computer computer);
    Computer update(Computer computer);
    void delete(String computerId);
    Computer findById(String computerId);
    List<Computer> findAll();
}

