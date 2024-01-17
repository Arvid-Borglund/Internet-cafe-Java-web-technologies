package org.ics.api;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import org.ics.ejb.Employee;
import org.ics.facade.EmployeeFacade;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class EmployeeApiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private EmployeeFacade employeeFacade;

    public EmployeeApiServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employees = employeeFacade.findAll();
        String json = new Gson().toJson(employees);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Gson gson = new Gson();
        Employee employee = gson.fromJson(requestBody, Employee.class);
        employeeFacade.create(employee);
        response.setContentType("application/json");
        String jsonResponse = gson.toJson(employee);
        response.getWriter().write(jsonResponse);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        Gson gson = new Gson();
        Employee updatedEmployee = gson.fromJson(requestBody, Employee.class);
        Employee existingEmployee = employeeFacade.findById(updatedEmployee.getEmployeeId());

        if (existingEmployee != null) {
            if (updatedEmployee.getName() != null && !updatedEmployee.getName().isEmpty()) {
                existingEmployee.setName(updatedEmployee.getName());
            }
            if (updatedEmployee.getAdress() != null && !updatedEmployee.getAdress().isEmpty()) {
                existingEmployee.setAdress(updatedEmployee.getAdress());
            }
            if (updatedEmployee.getPhonenumber() != null && !updatedEmployee.getPhonenumber().isEmpty()) {
                existingEmployee.setPhonenumber(updatedEmployee.getPhonenumber());
            }
            if (updatedEmployee.getEmail() != null && !updatedEmployee.getEmail().isEmpty()) {
                existingEmployee.setEmail(updatedEmployee.getEmail());
            }
            if (updatedEmployee.getJobTitle() != null && !updatedEmployee.getJobTitle().isEmpty()) {
                existingEmployee.setJobTitle(updatedEmployee.getJobTitle());
            }

            employeeFacade.update(existingEmployee);
            response.setContentType("application/json");
            String jsonResponse = gson.toJson(existingEmployee);
            response.getWriter().write(jsonResponse);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("Employee not found");
        }
    }


    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String employeeId = pathInfo.substring(1); // Remove the leading slash
        employeeFacade.delete(employeeId);
        response.setContentType("application/json");
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status", "success");
        jsonResponse.addProperty("message", "Employee deleted successfully");
        response.getWriter().write(jsonResponse.toString());
    }

}
