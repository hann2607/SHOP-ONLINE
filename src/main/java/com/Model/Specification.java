package com.Model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;


/**
 * The persistent class for the SPECIFICATION database table.
 * 
 */
@Entity
@Table(name="SPECIFICATION")
@NamedQuery(name="Specification.findAll", query="SELECT s FROM Specification s")
public class Specification implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="SPECIFICATION_ID")
	private int specificationId;

	@Column(name="BLUETOOTH")
	private String bluetooth;

	@Column(name="CPU")
	private String cpu;

	@Column(name="GATEWAY")
	private String gateway;

	@Column(name="GRAPHICS_CARD")
	private String graphicsCard;

	@Column(name="HARD_DRIVE")
	private String hardDrive;

	@Column(name="NETWORK")
	private String network;

	@Column(name="PIN")
	private String pin;

	@Column(name="RAM")
	private String ram;

	@Column(name="[SCREEN]")
	private String screen;

	@Column(name="WEIGHT")
	private String weight;

	@Column(name="WIN")
	private String win;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="specification")
	private List<Product> products;

	public Specification() {
	}

	public int getSpecificationId() {
		return this.specificationId;
	}

	public void setSpecificationId(int specificationId) {
		this.specificationId = specificationId;
	}

	public String getBluetooth() {
		return this.bluetooth;
	}

	public void setBluetooth(String bluetooth) {
		this.bluetooth = bluetooth;
	}

	public String getCpu() {
		return this.cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getGateway() {
		return this.gateway;
	}

	public void setGateway(String gateway) {
		this.gateway = gateway;
	}

	public String getGraphicsCard() {
		return this.graphicsCard;
	}

	public void setGraphicsCard(String graphicsCard) {
		this.graphicsCard = graphicsCard;
	}

	public String getHardDrive() {
		return this.hardDrive;
	}

	public void setHardDrive(String hardDrive) {
		this.hardDrive = hardDrive;
	}

	public String getNetwork() {
		return this.network;
	}

	public void setNetwork(String network) {
		this.network = network;
	}

	public String getPin() {
		return this.pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getRam() {
		return this.ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getScreen() {
		return this.screen;
	}

	public void setScreen(String screen) {
		this.screen = screen;
	}

	public String getWeight() {
		return this.weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getWin() {
		return this.win;
	}

	public void setWin(String win) {
		this.win = win;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setSpecification(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setSpecification(null);

		return product;
	}

}