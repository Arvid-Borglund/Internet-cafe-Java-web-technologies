package org.ics.eao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.ics.ejb.Reservation;

@Stateless
public class ReservationEAOImpl implements ReservationEAO {

    @PersistenceContext(unitName = "InternetCafePU")
    private EntityManager em;

    @Override
    public Reservation create(Reservation reservation) {
        em.merge(reservation); // Use merge instead of persist
        return reservation;
    }


    @Override
    public Reservation update(Reservation reservation) {
        return em.merge(reservation);
    }

    @Override
    public void delete(Reservation.ReservationId reservationId) {
        Reservation reservation = findById(reservationId);
        if (reservation != null) {
            em.remove(reservation);
        }
    }

    @Override
    public Reservation findById(Reservation.ReservationId reservationId) {
        return em.find(Reservation.class, reservationId);
    }

    @Override
    public List<Reservation> findAll() {
        return em.createQuery("SELECT r FROM Reservation r", Reservation.class).getResultList();
    }
}
