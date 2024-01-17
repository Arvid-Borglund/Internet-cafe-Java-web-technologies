package org.ics.ejb;

import javax.persistence.*;

@Entity
@Table(name = "Computer")
public class Computer {

    @Id
    @Column(name = "computerId")
    private String computerId;

    @Column(name = "cpu", nullable = false)
    private String cpu;

    @Column(name = "gpu", nullable = false)
    private String gpu;

    @Column(name = "ram", nullable = false)
    private int ram;

    @Column(name = "dataStorage", nullable = false)
    private String dataStorage;

    @Column(name = "reserved", nullable = false)
    private boolean reserved;
    
    public Computer() {
    }

    public Computer(String computerId, String cpu, String gpu, int ram, String dataStorage, boolean reserved) {
        this.computerId = computerId;
        this.cpu = cpu;
        this.gpu = gpu;
        this.ram = ram;
        this.dataStorage = dataStorage;
        this.reserved = reserved;
    }      
    
	public String getComputerId() {
		return computerId;
	}

	public void setComputerId(String computerId) {
		this.computerId = computerId;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getGpu() {
		return gpu;
	}

	public void setGpu(String gpu) {
		this.gpu = gpu;
	}

	public int getRam() {
		return ram;
	}

	public void setRam(int ram) {
		this.ram = ram;
	}

	public String getDataStorage() {
		return dataStorage;
	}

	public void setDataStorage(String dataStorage) {
		this.dataStorage = dataStorage;
	}

	public boolean isReserved() {
		return reserved;
	}

	public void setReserved(boolean reserved) {
		this.reserved = reserved;
	}

    
}

