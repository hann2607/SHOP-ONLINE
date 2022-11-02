package com.Model;

import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.*;


/**
 * The persistent class for the [SHARE] database table.
 * 
 */
@Entity
@Table(name="[SHARE]")
@NamedQuery(name="Share.findAll", query="SELECT s FROM Share s")
public class Share implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="SHAREID")
	private int shareid;

	@Column(name="EMAIL")
	private String email;

	@Column(name="SHAREDATE")
	private Date sharedate;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="PRODUCTID")
	private Product product;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="USERNAME")
	private User user;

	public Share() {
	}

	public int getShareid() {
		return this.shareid;
	}

	public void setShareid(int shareid) {
		this.shareid = shareid;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getSharedate() {
		return this.sharedate;
	}

	public void setSharedate(Date sharedate) {
		this.sharedate = sharedate;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}