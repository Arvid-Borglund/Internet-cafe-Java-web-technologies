package org.ics.api;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;
import org.ics.ejb.Reservation;
import org.ics.facade.ReservationFacade;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.ics.ejb.Computer;
import org.ics.ejb.Employee;
import org.ics.ejb.Customer;
import org.ics.facade.ComputerFacade;
import org.ics.facade.CustomerFacade;
import org.ics.facade.EmployeeFacade;



public class ReservationApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private ReservationFacade reservationFacade;

	@EJB
	private ComputerFacade computerFacade;

	@EJB
	private CustomerFacade customerFacade;

	@EJB
	private EmployeeFacade employeeFacade;

	public ReservationApiServlet() {
		super();
	}
	
	 

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Reservation> reservations = reservationFacade.findAll();
		String json = new Gson().toJson(reservations);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
	    Gson gson = new Gson();
	    JsonObject jsonObject = gson.fromJson(requestBody, JsonObject.class);

	    String computerId = jsonObject.get("computerId").getAsString();
	    String customerId = jsonObject.get("customerId").getAsString();
	    String employeeId = jsonObject.get("employeeId").getAsString();
	    String timeDate = jsonObject.get("timeDate").getAsString();

	    Computer computer = computerFacade.findById(computerId);
	    Customer customer = customerFacade.findById(customerId);
	    Employee employee = employeeFacade.findById(employeeId);

	    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

	    Date date = null;
	    try {
	        date = dateFormat.parse(timeDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }

	    Reservation reservation = new Reservation(computer, date, customer, employee);
	    
	    try {
	        // Create the reservation
	        reservationFacade.create(reservation);

	        // Update the customer's loyalty level
	        int loyaltyLevel = customer.getLoyaltyLevel();
	        customer.setLoyaltyLevel(loyaltyLevel + 1);
	        customerFacade.update(customer);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    response.setContentType("application/json");
	    String jsonResponse = gson.toJson(reservation);
	    response.getWriter().write(jsonResponse);
	}



}
