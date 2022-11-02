package com.Model;

import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.*;

/**
 * The persistent class for the LIKES database table.
 * 
 */
@Entity
@Table(name = "LIKES")
@NamedQueries({ @NamedQuery(name = "Like.findAll", query = "SELECT l FROM Like l"),
		@NamedQuery(name = "Like.findLikeByUser", query = "SELECT l FROM Like l WHERE l.product.productid=:productid AND l.user.username=:username") })
public class Like implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "LIKEID")
	private Integer likeid;

	@Column(name = "LIKEDATE")
	private Date likedate;

	// bi-directional many-to-one association to Product
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PRODUCTID")
	private Product product;

	// bi-directional many-to-one association to User
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USERNAME")
	private User user;

	public Like() {
	}

	public Integer getLikeid() {
		return this.likeid;
	}

	public void setLikeid(Integer likeid) {
		this.likeid = likeid;
	}

	public Date getLikedate() {
		return this.likedate;
	}

	public void setLikedate(Date likedate) {
		this.likedate = likedate;
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