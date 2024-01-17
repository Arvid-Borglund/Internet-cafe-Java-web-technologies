package org.ics.ejb;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Employee")
public class Employee {

    @Id
    @Column(name = "employeeId")
    private String employeeId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "adress", nullable = false)
    private String adress;

    @Column(name = "phonenumber", nullable = false)
    private String phonenumber;

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    @Column(name = "hireDate", nullable = false)
    private Date hireDate;

    @Column(name = "jobTitle", nullable = false)
    private String jobTitle;
    
    public Employee() {
    }

    public Employee(String employeeId, String name, String adress, String phonenumber, String email, Date hireDate, String jobTitle) {
        this.employeeId = employeeId;
        this.name = name;
        this.adress = adress;
        this.phonenumber = phonenumber;
        this.email = email;
        this.hireDate = hireDate;
        this.jobTitle = jobTitle;
    }

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

    
}

