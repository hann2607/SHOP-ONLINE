package com.Model;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;

/**
 * The persistent class for the USERS database table.
 * 
 */
@Entity
@Table(name = "USERS")
@NamedQueries({ @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"), 
	@NamedQuery(name = "User.findUsernameAndPass", query = "SELECT u FROM User u WHERE u.username=:username AND u.password=:password")})

public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "USERNAME")
	private String username;

	@Column(name = "[ADMIN]")
	private boolean admin;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "FULLNAME")
	private String fullname;

	@Column(name = "PASSWORD")
	private String password;

	// bi-directional many-to-one association to Like
	@OneToMany(mappedBy = "user")
	private List<Like> likes;

	// bi-directional many-to-one association to Order
	@OneToMany(mappedBy = "user")
	private List<Order> orders;

	// bi-directional many-to-one association to Share
	@OneToMany(mappedBy = "user")
	private List<Share> shares;

	public User() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean getAdmin() {
		return this.admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Like> getLikes() {
		return this.likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public Like addLike(Like like) {
		getLikes().add(like);
		like.setUser(this);

		return like;
	}

	public Like removeLike(Like like) {
		getLikes().remove(like);
		like.setUser(null);

		return like;
	}

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Order addOrder(Order order) {
		getOrders().add(order);
		order.setUser(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setUser(null);

		return order;
	}

	public List<Share> getShares() {
		return this.shares;
	}

	public void setShares(List<Share> shares) {
		this.shares = shares;
	}

	public Share addShare(Share share) {
		getShares().add(share);
		share.setUser(this);

		return share;
	}

	public Share removeShare(Share share) {
		getShares().remove(share);
		share.setUser(null);

		return share;
	}

}