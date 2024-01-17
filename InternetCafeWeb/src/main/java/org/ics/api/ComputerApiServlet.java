package org.ics.api;

import javax.ejb.EJB;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.stream.Collectors;

import org.ics.ejb.Computer;
import org.ics.ejb.Reservation;
import org.ics.facade.ComputerFacade;
import org.ics.facade.ReservationFacade;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class ComputerApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private ComputerFacade computerFacade;
	
	@EJB
	private ReservationFacade reservationFacade;

	public ComputerApiServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        // Retrieve computers from the database
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
	                    // Convert the reservation TimeDate to a LocalDate object, ignoring the time part
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

	        // Convert the list of computers to JSON
	        String json = new Gson().toJson(computers);

	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
		Gson gson = new Gson();
		Computer computer = gson.fromJson(requestBody, Computer.class);
		computerFacade.create(computer);
		response.setContentType("application/json");
		String jsonResponse = gson.toJson(computer);
		response.getWriter().write(jsonResponse);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
	    Gson gson = new Gson();
	    Computer updatedComputer = gson.fromJson(requestBody, Computer.class);
	    Computer existingComputer = computerFacade.findById(updatedComputer.getComputerId());

	    if (existingComputer != null) {
	        if (updatedComputer.getCpu() != null && !updatedComputer.getCpu().isEmpty()) {
	            existingComputer.setCpu(updatedComputer.getCpu());
	        }
	        if (updatedComputer.getGpu() != null && !updatedComputer.getGpu().isEmpty()) {
	            existingComputer.setGpu(updatedComputer.getGpu());
	        }
	        if (updatedComputer.getRam() != -1) {
	            existingComputer.setRam(updatedComputer.getRam());
	        }
	        if (updatedComputer.getDataStorage() != null && !updatedComputer.getDataStorage().isEmpty()) {
	            existingComputer.setDataStorage(updatedComputer.getDataStorage());
	        }

	        computerFacade.update(existingComputer);
	        response.setContentType("application/json");
	        String jsonResponse = gson.toJson(existingComputer);
	        response.getWriter().write(jsonResponse);
	    } else {
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	        response.getWriter().write("Computer not found");
	    }
	}


	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		String computerId = pathInfo.substring(1); // Remove the leading slash
		computerFacade.delete(computerId);
		response.setContentType("application/json");
		JsonObject jsonResponse = new JsonObject();
		jsonResponse.addProperty("status", "success");
		jsonResponse.addProperty("message", "Computer deleted successfully");
		response.getWriter().write(jsonResponse.toString());
	}
}
