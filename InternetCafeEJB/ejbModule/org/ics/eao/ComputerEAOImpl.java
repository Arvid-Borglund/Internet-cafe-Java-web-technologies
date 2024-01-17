package org.ics.eao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ics.ejb.Computer;

@Stateless
public class ComputerEAOImpl implements ComputerEAO {

    @PersistenceContext(unitName = "InternetCafePU")
    private EntityManager em;

    @Override
    public Computer create(Computer computer) {
        em.persist(computer);
        return computer;
    }

    @Override
    public Computer update(Computer computer) {
        return em.merge(computer);
    }

    @Override
    public void delete(String computerId) {
        Computer computer = findById(computerId);
        if (computer != null) {
            em.remove(computer);
        }
    }

    @Override
    public Computer findById(String computerId) {
        return em.find(Computer.class, computerId);
    }

    @Override
    public List<Computer> findAll() {
        return em.createQuery("SELECT c FROM Computer c", Computer.class).getResultList();
    }
}

