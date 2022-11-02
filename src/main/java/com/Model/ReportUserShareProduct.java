package com.Model;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
@NamedStoredProcedureQueries({
	@NamedStoredProcedureQuery(name = "ReportUserShareProduct.ReportUserShareProduct", procedureName = "sp_ReportUserShareProduct", resultClasses = ReportUserShareProduct.class, parameters = {
			@StoredProcedureParameter(name = "productName", type = String.class, mode = ParameterMode.IN) }) })
public class ReportUserShareProduct {
	@Id
	private String fullname;
	private String senderemail;
	private String receiveremail;
	private Date sharedate;

	public ReportUserShareProduct() {
		super();
	}

	public ReportUserShareProduct(String fullname, String senderemail, String receiveremail, Date sharedate) {
		super();
		this.fullname = fullname;
		this.senderemail = senderemail;
		this.receiveremail = receiveremail;
		this.sharedate = sharedate;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getSenderemail() {
		return senderemail;
	}

	public void setSenderemail(String senderemail) {
		this.senderemail = senderemail;
	}

	public String getReceiveremail() {
		return receiveremail;
	}

	public void setReceiveremail(String receiveremail) {
		this.receiveremail = receiveremail;
	}

	public Date getSharedate() {
		return sharedate;
	}

	public void setSharedate(Date sharedate) {
		this.sharedate = sharedate;
	}

}
