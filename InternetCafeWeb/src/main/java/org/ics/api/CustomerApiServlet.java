package org.ics.api;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import org.ics.ejb.Customer;
import org.ics.facade.CustomerFacade;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class CustomerApiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private CustomerFacade customerFacade;

    public CustomerApiServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = customerFacade.findAll();
        String json = new Gson().toJson(customers);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Gson gson = new Gson();
        Customer customer = gson.fromJson(requestBody, Customer.class);
        customerFacade.create(customer);
        response.setContentType("application/json");
        String jsonResponse = gson.toJson(customer);
        response.getWriter().write(jsonResponse);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Gson gson = new Gson();
        Customer updatedCustomer = gson.fromJson(requestBody, Customer.class);
        Customer existingCustomer = customerFacade.findById(updatedCustomer.getCustomerId());

        if (existingCustomer != null) {
            if (updatedCustomer.getName() != null && !updatedCustomer.getName().isEmpty()) {
                existingCustomer.setName(updatedCustomer.getName());
            }
            if (updatedCustomer.getAdress() != null && !updatedCustomer.getAdress().isEmpty()) {
                existingCustomer.setAdress(updatedCustomer.getAdress());
            }
            if (updatedCustomer.getPhonenumber() != null && !updatedCustomer.getPhonenumber().isEmpty()) {
                existingCustomer.setPhonenumber(updatedCustomer.getPhonenumber());
            }
            if (updatedCustomer.getEmail() != null && !updatedCustomer.getEmail().isEmpty()) {
                existingCustomer.setEmail(updatedCustomer.getEmail());
            }

            customerFacade.update(existingCustomer);
            response.setContentType("application/json");
            String jsonResponse = gson.toJson(existingCustomer);
            response.getWriter().write(jsonResponse);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("Customer not found");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String customerId = pathInfo.substring(1); // Remove the leading slash
        customerFacade.delete(customerId);
        response.setContentType("application/json");
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", "success");
        jsonResponse.addProperty("message", "Customer deleted successfully");
        response.getWriter().write(jsonResponse.toString());
    }

}
