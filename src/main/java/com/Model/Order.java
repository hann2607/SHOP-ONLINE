package com.Model;

import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.*;


/**
 * The persistent class for the ORDERS database table.
 * 
 */
@Entity
@Table(name="ORDERS")
@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ORDERID")
	private String orderid;

	@Column(name="[DATE]")
	private Date date;

	@Column(name="NOTE")
	private String note;

	@Column(name="STATUS")
	private boolean status;

	//bi-directional many-to-one association to Orderdetail
	@ManyToOne
	@JoinColumn(name="ORDER_DETAIL_ID")
	private Orderdetail orderdetail;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="USERNAME")
	private User user;

	public Order() {
	}

	public String getOrderid() {
		return this.orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public boolean getStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Orderdetail getOrderdetail() {
		return this.orderdetail;
	}

	public void setOrderdetail(Orderdetail orderdetail) {
		this.orderdetail = orderdetail;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}