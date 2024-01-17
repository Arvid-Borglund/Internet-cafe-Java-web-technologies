package org.ics.facade;

import org.ics.ejb.Reservation;
import org.ics.ejb.Reservation.ReservationId;
import java.util.List;

public interface ReservationFacade {
    Reservation create(Reservation reservation);
    Reservation update(Reservation reservation);
    void delete(ReservationId reservationId);
    Reservation findById(ReservationId reservationId);
    List<Reservation> findAll();
}

