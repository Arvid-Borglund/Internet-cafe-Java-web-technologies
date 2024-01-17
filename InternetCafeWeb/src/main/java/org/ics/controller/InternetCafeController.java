package org.ics.controller;

import org.ics.ejb.Computer;
import org.ics.ejb.Customer;
import org.ics.ejb.Employee;
import org.ics.ejb.Reservation;
import org.ics.ejb.Reservation.ReservationId;
import org.ics.facade.ComputerFacade;
import org.ics.facade.CustomerFacade;
import org.ics.facade.EmployeeFacade;
import org.ics.facade.ReservationFacade;
import com.google.gson.Gson;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang3.StringUtils;

public class InternetCafeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@EJB
	private ComputerFacade computerFacade;

	@EJB
	private CustomerFacade customerFacade;

	@EJB
	private EmployeeFacade employeeFacade;

	@EJB
	private ReservationFacade reservationFacade;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action == null) {
			action = "default";
		}

		switch (action) {
		case "showEmployees":
			showEmployees(request, response);
			break;
		case "showCustomers":
			showCustomers(request, response);
			break;
		case "showComputers":
			showComputers(request, response);
			break;
		case "showReservations":
			showReservations(request, response);
			break;
		case "availableComputers":
			getAvailableComputers(request, response);
			break;
		case "allCustomers":
			getAllCustomers(request, response);
			break;
		case "allEmployees":
			getAllEmployees(request, response);
			break;
		case "allReservations":
			getAllReservations(request, response);
			break;
		case "showAbout":
			showAbout(request, response);
			break;
		case "default":
		default:
			// Handle the default case, e.g., forward to the home page
			request.getRequestDispatcher("/WEB-INF/views/common/index.jsp").forward(request, response);
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String entity = request.getParameter("entity");
		String action = request.getParameter("action");

		if (entity != null && action != null) {
			switch (entity.toLowerCase()) {
			case "computer":
				switch (action.toLowerCase()) {
				case "create":
					createComputer(request, response);
					break;
				case "read":
					readComputer(request, response);
					break;
				case "update":
					updateComputer(request, response);
					break;
				case "delete":
					deleteComputer(request, response);
					break;
				}
				break;
			case "customer":
				switch (action.toLowerCase()) {
				case "create":
					createCustomer(request, response);
					break;
				case "read":
					readCustomer(request, response);
					break;
				case "update":
					updateCustomer(request, response);
					break;
				case "delete":
					deleteCustomer(request, response);
					break;
				}
				break;
			case "employee":
				switch (action.toLowerCase()) {
				case "create":
					createEmployee(request, response);
					break;
				case "read":
					readEmployee(request, response);
					break;
				case "update":
					updateEmployee(request, response);
					break;
				case "delete":
					deleteEmployee(request, response);
					break;
				}
				break;
			case "reservation":
				switch (action.toLowerCase()) {
				case "create":
					createReservation(request, response);
					break;
				case "read":
					readReservation(request, response);
					break;
				case "delete":
					deleteReservation(request, response);
					break;
				}
				break;
			}
		}
	}

	// ========================================================================================================================================
	// Computer CRUD methods
	// ========================================================================================================================================

	private void showComputers(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		    try {
		        // Retrieve computers from the database and set them as request attributes
		        List<Computer> computers = computerFacade.findAll();

		        // Get current date
		        LocalDate currentDate = LocalDate.now();

		        for (Computer computer : computers) {
		            boolean isReserved = false;

		            // Retrieve reservations for the specific computer
		            List<Reservation> reservations = reservationFacade.findAll();

		            for (Reservation reservation : reservations) {
		                // Check if the reservation is for the current computer
		                if (reservation.getReservationId().getComputerId().equals(computer.getComputerId())) {
		                    // Convert the reservation TimeDate to a LocalDate object, ignoring the time
		                    // part
		                    LocalDate reservationDate = reservation.getReservationId().getTimeDate().toInstant()
		                            .atZone(ZoneId.systemDefault()).toLocalDate();

		                    // Check if the reservation is active for the current date
		                    if (currentDate.equals(reservationDate)) {
		                        isReserved = true;
		                        break;
		                    }
		                }
		            }

		            computer.setReserved(isReserved);
		            computerFacade.update(computer);  // Persist the change to the database
		        }

		        request.setAttribute("computers", computers);

		        // Forward the request to the computers.jsp file
		        request.getRequestDispatcher("/WEB-INF/views/computers/computers.jsp").forward(request, response);
		        return;
		    } catch (Exception e) {
		        request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
		        request.getRequestDispatcher("/WEB-INF/views/computers/computers.jsp").forward(request, response);
		    }
		}


	private void createComputer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String computerId = request.getParameter("computerId");
		String cpu = request.getParameter("cpu");
		String gpu = request.getParameter("gpu");
		String ramString = request.getParameter("ram");
		int ram = Integer.parseInt(ramString);
		String dataStorage = request.getParameter("dataStorage");

		// Set reserved to false by default
		boolean reserved = false;

		Computer newComputer = new Computer(computerId, cpu, gpu, ram, dataStorage, reserved);

		try {
			computerFacade.create(newComputer);

		} catch (Exception e) {
			System.out.println("Exception caught: " + e.getMessage());
			String errorMessage = ErrorHandler.generateErrorMessage(e);
			System.out.println("Generated error message: " + errorMessage);
			request.setAttribute("errorMessage", errorMessage);
		}
		showComputers(request, response);
	}

	private void readComputer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String computerId = request.getParameter("computerId");
		try {
			Computer foundComputer = computerFacade.findById(computerId);

			if (foundComputer != null) {
				request.setAttribute("foundComputer", foundComputer);

				// Load the data for the first table view
				List<Computer> computers = computerFacade.findAll();
				request.setAttribute("computers", computers);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/computers/computers.jsp");
				dispatcher.forward(request, response);
			} else {
				String errorMessage = "Computer not found";
				request.setAttribute("errorMessage", errorMessage);
				// Forward to an error page or show the error message on the current page
			}
		} catch (Exception e) {
			String errorMessage = ErrorHandler.generateErrorMessage(e);
			request.setAttribute("errorMessage", errorMessage);
			// Forward to an error page or show the error message on the current page
		}
	}

	private void updateComputer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String computerId = request.getParameter("computerId");
		Computer existingComputer = computerFacade.findById(computerId);

		if (existingComputer != null) {
			String cpu = request.getParameter("cpu");
			String gpu = request.getParameter("gpu");
			String ramString = request.getParameter("ram");
			String dataStorage = request.getParameter("dataStorage");
			String reserved = request.getParameter("reserved");

			if (StringUtils.isNotBlank(cpu)) {
				existingComputer.setCpu(cpu);
			}
			if (StringUtils.isNotBlank(gpu)) {
				existingComputer.setGpu(gpu);
			}
			if (StringUtils.isNotBlank(ramString)) {
				int ram = Integer.parseInt(ramString);
				existingComputer.setRam(ram);
			}
			if (StringUtils.isNotBlank(dataStorage)) {
				existingComputer.setDataStorage(dataStorage);
			}
			existingComputer.setReserved("on".equalsIgnoreCase(reserved));

			try {
				computerFacade.update(existingComputer);
			} catch (Exception e) {
				request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			}
		} else {
			request.setAttribute("errorMessage", "Computer not found");
		}

		showComputers(request, response);
	}

	private void deleteComputer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String computerId = request.getParameter("computerId");
		Computer existingComputer = computerFacade.findById(computerId);

		if (existingComputer != null) {
			try {
				computerFacade.delete(computerId);
			} catch (Exception e) {
				request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			}
		} else {
			request.setAttribute("errorMessage", "Computer not found");
		}

		showComputers(request, response);
	}

	// ========================================================================================================================================
	// Customer CRUD methods
	// ========================================================================================================================================

	private void showCustomers(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        // Retrieve customers from the database and set them as request attributes
	        List<Customer> customers = customerFacade.findAll();
	        request.setAttribute("customers", customers);

	        // Forward the request to the customers.jsp file
	        request.getRequestDispatcher("/WEB-INF/views/customers/customers.jsp").forward(request, response);
	    } catch (Exception e) {
	        request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
	        request.getRequestDispatcher("/WEB-INF/views/customers/customers.jsp").forward(request, response);
	    }
	    
	}

	private void createCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerId = request.getParameter("customerId");
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String phonenumber = request.getParameter("phonenumber");
		String email = request.getParameter("email");

		// Set the default loyalty level to 0
		int loyaltyLevel = 0;

		// Use the provided constructor with the parameters
		Customer newCustomer = new Customer(customerId, name, adress, phonenumber, email, loyaltyLevel);

		try {
			customerFacade.create(newCustomer);
		} catch (Exception e) {
			request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
		}

		showCustomers(request, response);
	}

	private void readCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerId = request.getParameter("customerId");
		Customer foundCustomer = customerFacade.findById(customerId);

		if (foundCustomer != null) {
			request.setAttribute("foundCustomer", foundCustomer);
		} else {
			request.setAttribute("errorMessage", "Customer not found");
		}

		// Load the data for the first table view
		List<Customer> customers = customerFacade.findAll();
		request.setAttribute("customers", customers);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customers/customers.jsp");
		dispatcher.forward(request, response);
	}

	private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerId = request.getParameter("customerId");
		Customer existingCustomer = customerFacade.findById(customerId);

		if (existingCustomer != null) {
			String name = request.getParameter("name");
			String adress = request.getParameter("adress");
			String phonenumber = request.getParameter("phonenumber");
			String email = request.getParameter("email");

			if (StringUtils.isNotBlank(name)) {
				existingCustomer.setName(name);
			}
			if (StringUtils.isNotBlank(adress)) {
				existingCustomer.setAdress(adress);
			}
			if (StringUtils.isNotBlank(phonenumber)) {
				existingCustomer.setPhonenumber(phonenumber);
			}
			if (StringUtils.isNotBlank(email)) {
				existingCustomer.setEmail(email);
			}

			try {
				customerFacade.update(existingCustomer);
			} catch (Exception e) {
				request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			}
		} else {
			request.setAttribute("errorMessage", "Customer not found");
		}

		showCustomers(request, response);
	}

	private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerId = request.getParameter("customerId");
		Customer existingCustomer = customerFacade.findById(customerId);

		if (existingCustomer != null) {
			try {
				customerFacade.delete(customerId);
			} catch (Exception e) {
				request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			}
		} else {
			request.setAttribute("errorMessage", "Customer not found");
		}

		showCustomers(request, response);
	}

	// ========================================================================================================================================
	// Employee CRUD methods
	// ========================================================================================================================================

	private void showEmployees(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Retrieve employees from the database and set them as request attributes
			List<Employee> employees = employeeFacade.findAll();
			request.setAttribute("employees", employees);

			// Forward the request to the employees.jsp file
			request.getRequestDispatcher("/WEB-INF/views/employees/employees.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			request.getRequestDispatcher("/WEB-INF/views/employees/employees.jsp").forward(request, response);
		}
}


	private void createEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String employeeId = request.getParameter("employeeId");
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String phonenumber = request.getParameter("phonenumber");
		String email = request.getParameter("email");
		String hireDateString = request.getParameter("hireDate");
		String jobTitle = request.getParameter("jobTitle");

		// Parse the hire date string to a Date object
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		Date hireDate = null;
		try {
			hireDate = sdf.parse(hireDateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Employee newEmployee = new Employee(employeeId, name, adress, phonenumber, email, hireDate, jobTitle);

		try {
			employeeFacade.create(newEmployee);
		} catch (Exception e) {
			request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
		}

		showEmployees(request, response);
	}

	private void readEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String employeeId = request.getParameter("employeeId");
		Employee foundEmployee = employeeFacade.findById(employeeId);

		if (foundEmployee != null) {
			request.setAttribute("foundEmployee", foundEmployee);
		} else {
			request.setAttribute("errorMessage", "Employee not found");
		}

		// Load the data for the first table view
		List<Employee> employees = employeeFacade.findAll();
		request.setAttribute("employees", employees);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employees/employees.jsp");
		dispatcher.forward(request, response);
	}

	private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String employeeId = request.getParameter("employeeId");
		Employee existingEmployee = employeeFacade.findById(employeeId);

		if (existingEmployee != null) {
			String name = request.getParameter("name");
			String adress = request.getParameter("adress");
			String phoneNumber = request.getParameter("phoneNumber");
			String email = request.getParameter("email");
			String jobTitle = request.getParameter("jobTitle");

			if (StringUtils.isNotBlank(name)) {
				existingEmployee.setName(name);
			}
			if (StringUtils.isNotBlank(adress)) {
				existingEmployee.setAdress(adress);
			}
			if (StringUtils.isNotBlank(phoneNumber)) {
				existingEmployee.setPhonenumber(phoneNumber);
			}
			if (StringUtils.isNotBlank(email)) {
				existingEmployee.setEmail(email);
			}
			if (StringUtils.isNotBlank(jobTitle)) {
				existingEmployee.setJobTitle(jobTitle);
			}

			try {
				employeeFacade.update(existingEmployee);
			} catch (Exception e) {
				request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			}
		} else {
			request.setAttribute("errorMessage", "Employee not found");
		}

		showEmployees(request, response);
	}

	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String employeeId = request.getParameter("employeeId");
		Employee existingEmployee = employeeFacade.findById(employeeId);

		if (existingEmployee != null) {
			try {
				employeeFacade.delete(employeeId);
			} catch (Exception e) {
				request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			}
		} else {
			request.setAttribute("errorMessage", "Employee not found");
		}

		showEmployees(request, response);
	}

	// ========================================================================================================================================
	// Reservation CRUD methods
	// ========================================================================================================================================

	private void showReservations(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Retrieve reservations from the database and set them as request attributes
			List<Reservation> reservations = reservationFacade.findAll();
			request.setAttribute("reservations", reservations);
			request.getRequestDispatcher("/WEB-INF/views/reservations/reservations.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			request.getRequestDispatcher("/WEB-INF/views/reservations/reservations.jsp").forward(request, response);
		}

	
		
	}

	private void createReservation(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String computerId = request.getParameter("computerId");
	    String timeDate = request.getParameter("timeDate");
	    String customerId = request.getParameter("customerId");
	    String employeeId = request.getParameter("employeeId");

	    // Fetch the required objects
	    Computer computer = computerFacade.findById(computerId);
	    Customer customer = customerFacade.findById(customerId);
	    Employee employee = employeeFacade.findById(employeeId);

	    // Initialize the dateOnly variable
	    Date dateOnly = null;

	    try {
	        // Convert the timeDate string to a Date object with both the date and time parts
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	        dateOnly = dateFormat.parse(timeDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }

	    // Use the provided constructor with the parameters
	    Reservation newReservation = new Reservation(computer, dateOnly, customer, employee);

	    try {
	        // Create the reservation
	        reservationFacade.create(newReservation);

	        // Update the customer's loyalty level
	        int loyaltyLevel = customer.getLoyaltyLevel();
	        customer.setLoyaltyLevel(loyaltyLevel + 1);
	        customerFacade.update(customer);
	    } catch (Exception e) {
	        request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
	    }

	    showReservations(request, response);
	}



	private void readReservation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String computerId = request.getParameter("computerId");
		String timeDate = request.getParameter("timeDate");

		// Convert the timeDate string to a Date object, ignoring the time part
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedTimeDate = null;
		try {
			parsedTimeDate = dateFormat.parse(timeDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// Create a ReservationId object using the computerId and parsedTimeDate
		ReservationId reservationId = new ReservationId(computerId, parsedTimeDate);

		// Find the reservation using the ReservationId object
		Reservation foundReservation = reservationFacade.findById(reservationId);

		if (foundReservation != null) {
			request.setAttribute("foundReservation", foundReservation);
		} else {
			request.setAttribute("errorMessage", "Reservation not found");
		}

		// Load the data for the first table view
		List<Reservation> reservations = reservationFacade.findAll();
		request.setAttribute("reservations", reservations);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/reservations/reservations.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteReservation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String computerId = request.getParameter("computerId");
		String timeDate = request.getParameter("timeDate");

		// Convert the timeDate string to a Date object
		DateFormat fullDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		DateFormat dateOnlyFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedTimeDate = null;
		Date dateOnly = null;
		try {
			parsedTimeDate = fullDateFormat.parse(timeDate);
			dateOnly = dateOnlyFormat.parse(dateOnlyFormat.format(parsedTimeDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// Create a ReservationId object using the computerId and dateOnly
		ReservationId reservationId = new ReservationId(computerId, dateOnly);

		// Find the existing reservation using the ReservationId object
		Reservation existingReservation = reservationFacade.findById(reservationId);

		if (existingReservation != null) {
			try {
				reservationFacade.delete(reservationId);
			} catch (Exception e) {
				request.setAttribute("errorMessage", ErrorHandler.generateErrorMessage(e));
			}
		} else {
			request.setAttribute("errorMessage", "Reservation not found");
		}

		showReservations(request, response);
	}

	private void getAvailableComputers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Computer> allComputers = computerFacade.findAll();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(allComputers));
		out.flush();
	}

	private void getAllCustomers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Customer> customers = customerFacade.findAll();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(customers));
		out.flush();
	}

	private void getAllEmployees(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Employee> employees = employeeFacade.findAll();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(employees));
		out.flush();
	}

	private void getAllReservations(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Reservation> reservations = reservationFacade.findAll();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(reservations, response.getWriter());
	}

	private void showAbout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/about.jsp");
		dispatcher.forward(request, response);
	}

}
