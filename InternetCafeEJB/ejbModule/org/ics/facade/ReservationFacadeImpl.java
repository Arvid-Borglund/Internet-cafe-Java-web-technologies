package org.ics.facade;

import org.ics.eao.ReservationEAO;
import org.ics.ejb.Reservation;
import org.ics.ejb.Reservation.ReservationId;
import org.ics.interceptor.LoggingAndValidationInterceptor;

import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.interceptor.Interceptors;

@Stateless
@Interceptors(LoggingAndValidationInterceptor.class)
public class ReservationFacadeImpl implements ReservationFacade {

    @EJB
    private ReservationEAO reservationEAO;

    @Override
    public Reservation create(Reservation reservation) {
        return reservationEAO.create(reservation);
    }

    @Override
    public Reservation update(Reservation reservation) {
        return reservationEAO.update(reservation);
    }

    @Override
    public void delete(ReservationId reservationId) {
        reservationEAO.delete(reservationId);
    }

    @Override
    public Reservation findById(ReservationId reservationId) {
        return reservationEAO.findById(reservationId);
    }

    @Override
    public List<Reservation> findAll() {
        return reservationEAO.findAll();
    }
}

