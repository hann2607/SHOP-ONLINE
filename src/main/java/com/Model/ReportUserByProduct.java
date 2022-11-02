package com.Model;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = "ReportUserByProduct.ReportUserByProduct", procedureName = "sp_ReportUserByProduct", resultClasses = ReportUserByProduct.class, parameters = {
				@StoredProcedureParameter(name = "productName", type = String.class, mode = ParameterMode.IN) }) })
public class ReportUserByProduct {
	@Id
	private String username;
	private String fullname;
	private String email;
	private Date likedate;

	public ReportUserByProduct() {
		super();
	}

	public ReportUserByProduct(String username, String fullname, String email, Date likedate) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.likedate = likedate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getLikedate() {
		return likedate;
	}

	public void setLikedate(Date likedate) {
		this.likedate = likedate;
	}

}
