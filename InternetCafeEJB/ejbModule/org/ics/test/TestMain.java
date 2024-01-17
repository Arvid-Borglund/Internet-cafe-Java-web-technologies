package org.ics.test;

import org.ics.ejb.Computer;
import org.ics.ejb.Customer;
import org.ics.ejb.Employee;
import org.ics.ejb.Reservation;
import org.ics.ejb.Reservation.ReservationId;
import org.ics.facade.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestMain {

    public static void main(String[] args) {
        // Initialize your facades with their implementations.
        // Replace the placeholders with your actual implementations.
        ComputerFacade computerFacade = new ComputerFacadeImpl();
        CustomerFacade customerFacade = new CustomerFacadeImpl();
        EmployeeFacade employeeFacade = new EmployeeFacadeImpl();
        ReservationFacade reservationFacade = new ReservationFacadeImpl();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date hireDate;
        try {
			hireDate = dateFormat.parse("2020-05-27");
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			hireDate = new Date();
		}

        // Test Computer CRUD operations
        Computer computer = new Computer("C0099", "Intel i7", "NVIDIA GTX 1080", 16, "1TB HDD", false);
        computer = computerFacade.create(computer);
        System.out.println("Computer created: " + computer);

        computer.setRam(32);
        computer = computerFacade.update(computer);
        System.out.println("Computer updated: " + computer);

        Computer fetchedComputer = computerFacade.findById("C001");
        System.out.println("Fetched computer: " + fetchedComputer);

        // Test Customer CRUD operations
        Customer customer = new Customer("CU001", "John", "Vapenkroken", "046-121231", "Larvid@mail.com", 1);
        customer = customerFacade.create(customer);
        System.out.println("Customer created: " + customer);

        customer.setName("Jane");
        customer = customerFacade.update(customer);
        System.out.println("Customer updated: " + customer);

        Customer fetchedCustomer = customerFacade.findById("CU001");
        System.out.println("Fetched customer: " + fetchedCustomer);

        // Test Employee CRUD operations
        Employee employee = new Employee("E001", "Alice", "Vapenkroken", "046-121231", "Alice@mail.com", hireDate, "boss");
        employee = employeeFacade.create(employee);
        System.out.println("Employee created: " + employee);

        employee.setName("Bob");
        employee = employeeFacade.update(employee);
        System.out.println("Employee updated: " + employee);

        Employee fetchedEmployee = employeeFacade.findById("E001");
        System.out.println("Fetched employee: " + fetchedEmployee);

        // Test Reservation CRUD operations
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date reservationTime;
        try {
            reservationTime = dateFormat2.parse("2023-05-01 10:00");
        } catch (ParseException e) {
            e.printStackTrace();
            reservationTime = new Date();
        }

        Reservation reservation = new Reservation(fetchedComputer, reservationTime, fetchedCustomer, fetchedEmployee);
        reservation = reservationFacade.create(reservation);
        System.out.println("Reservation created: " + reservation);

/*        Reservation.ReservationId reservationId = new Reservation.ReservationId();
        reservationId.setComputerId(fetchedComputer);
        reservationId.setTimeDate(reservationTime);
*/
        ReservationId reservationId = new ReservationId(computer.getComputerId(), reservationTime);

        Reservation fetchedReservation = reservationFacade.findById(reservationId);
        System.out.println("Fetched reservation: " + fetchedReservation);

        // Clean up records
        reservationFacade.delete(reservationId);
        System.out.println("Reservation deleted");

        employeeFacade.delete("E001");
        System.out.println("Employee deleted");

        customerFacade.delete("CU001");
        System.out.println("Customer deleted");

        computerFacade.delete("C001");
        System.out.println("Computer deleted");
    }
}
