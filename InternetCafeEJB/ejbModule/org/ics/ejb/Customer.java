package org.ics.ejb;

import javax.persistence.*;

@Entity
@Table(name = "Customer")
public class Customer {

    @Id
    @Column(name = "customerId")
    private String customerId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "adress", nullable = false)
    private String adress;

    @Column(name = "phonenumber", nullable = false)
    private String phonenumber;

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    @Column(name = "loyaltyLevel", nullable = false)
    private int loyaltyLevel;
    
    public Customer() {
    }

    public Customer(String customerId, String name, String adress, String phonenumber, String email, int loyaltyLevel) {
        this.customerId = customerId;
        this.name = name;
        this.adress = adress;
        this.phonenumber = phonenumber;
        this.email = email;
        this.loyaltyLevel = loyaltyLevel;
    }


	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
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

	public int getLoyaltyLevel() {
		return loyaltyLevel;
	}

	public void setLoyaltyLevel(int loyaltyLevel) {
		this.loyaltyLevel = loyaltyLevel;
	}

    
}

