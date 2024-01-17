package org.ics.eao;

import java.util.List;

import org.ics.ejb.Computer;

public interface ComputerEAO {
    Computer create(Computer computer);
    Computer update(Computer computer);
    void delete(String computerId);
    Computer findById(String computerId);
    List<Computer> findAll();
}

