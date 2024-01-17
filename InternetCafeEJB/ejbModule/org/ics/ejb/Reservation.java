package org.ics.ejb;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "Reservation")
public class Reservation {

    @EmbeddedId
    private ReservationId reservationId;

    @MapsId("computerId")
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "computerId", referencedColumnName = "computerId", foreignKey = @ForeignKey(name = "FK_Reservation_Computer"), insertable = false, updatable = false)
    private Computer computer;

    @Temporal(TemporalType.DATE)
    @Column(name = "timeDate", insertable = false, updatable = false)
    private Date timeDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "customerId", referencedColumnName = "customerId", foreignKey = @ForeignKey(name = "FK_Reservation_Customer"))
    private Customer customer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "employeeId", referencedColumnName = "employeeId", foreignKey = @ForeignKey(name = "FK_Reservation_Employee"))
    private Employee employee;

    public Reservation() {
    }

    public Reservation(Computer computer, Date timeDate, Customer customer, Employee employee) {
        this.computer = computer;
        this.timeDate = timeDate;
        this.reservationId = new ReservationId(computer.getComputerId(), timeDate);
        this.customer = customer;
        this.employee = employee;
    }

    public ReservationId getReservationId() {
        return reservationId;
    }

    public void setReservationId(ReservationId reservationId) {
        this.reservationId = reservationId;
    }

    public Computer getComputer() {
        return computer;
    }

    public void setComputer(Computer computer) {
        this.computer = computer;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Embeddable
    public static class ReservationId implements Serializable  {
        private static final long serialVersionUID = 1L;

        @Column(name = "computerId")
        private String computerId;

        @Column(name = "timeDate")
        @Temporal(TemporalType.TIMESTAMP)
        private Date timeDate;

        public ReservationId() {
        }

        public ReservationId(String computerId, Date timeDate) {
            this.computerId = computerId;
            this.timeDate = timeDate;
        }

        public String getComputerId() {
            return computerId;
        }

        public void setComputerId(String computerId) {
            this.computerId = computerId;
        }

        public Date getTimeDate() {
            return timeDate;
        }

        public void setTimeDate(Date timeDate) {
            this.timeDate = timeDate;
        }

        @Override
        public int hashCode() {
            return Objects.hash(computerId, timeDate);
        }

        @Override
        public boolean equals(Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            ReservationId other = (ReservationId) obj;
            return Objects.equals(computerId, other.computerId) && Objects.equals(timeDate, other.timeDate);
        }
    }
}
