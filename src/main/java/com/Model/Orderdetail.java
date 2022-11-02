package com.Model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;


/**
 * The persistent class for the ORDERDETAIL database table.
 * 
 */
@Entity
@Table(name="ORDERDETAIL")
@NamedQuery(name="Orderdetail.findAll", query="SELECT o FROM Orderdetail o")
public class Orderdetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ORDER_DETAIL_ID")
	private String orderDetailId;

	@Column(name="COLOR")
	private String color;

	@Column(name="DISCOUNT")
	private Long discount;

	@Column(name="QUANTITY")
	private int quantity;

	@Column(name="TOTAL")
	private Long total;

	@Column(name="TRANSPORT_FEE")
	private Long transportFee;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="PRODUCTID")
	private Product product;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="orderdetail")
	private List<Order> orders;

	public Orderdetail() {
	}

	public String getOrderDetailId() {
		return this.orderDetailId;
	}

	public void setOrderDetailId(String orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Long getDiscount() {
		return this.discount;
	}

	public void setDiscount(Long discount) {
		this.discount = discount;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Long getTotal() {
		return this.total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public Long getTransportFee() {
		return this.transportFee;
	}

	public void setTransportFee(Long transportFee) {
		this.transportFee = transportFee;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Order addOrder(Order order) {
		getOrders().add(order);
		order.setOrderdetail(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setOrderdetail(null);

		return order;
	}

}