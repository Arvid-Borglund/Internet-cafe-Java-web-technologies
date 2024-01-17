package org.ics.eao;

import java.util.List;

import org.ics.ejb.Reservation;

public interface ReservationEAO {
    Reservation create(Reservation reservation);
    Reservation update(Reservation reservation);
    void delete(Reservation.ReservationId reservationId);
    Reservation findById(Reservation.ReservationId reservationId);
    List<Reservation> findAll();
}


