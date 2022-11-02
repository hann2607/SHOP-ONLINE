package com.Model;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.NamedStoredProcedureQueries;
import jakarta.persistence.NamedStoredProcedureQuery;

@Entity
@NamedStoredProcedureQueries({
	@NamedStoredProcedureQuery(name = "ReportFavoriteByProduct.CountFavoriteByProduct", procedureName = "sp_ReportFavoriteByProduct", resultClasses = ReportFavoriteByProduct.class) })
public class ReportFavoriteByProduct {
	@Id
	private String name;
	private Long likes;
	private Date newest;
	private Date oldest;

	public ReportFavoriteByProduct() {
		super();
	}

	public ReportFavoriteByProduct(String name, Long likes, Date newest, Date oldest) {
		super();
		this.name = name;
		this.likes = likes;
		this.newest = newest;
		this.oldest = oldest;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getLikes() {
		return likes;
	}

	public void setLikes(Long likes) {
		this.likes = likes;
	}

	public Date getNewest() {
		return newest;
	}

	public void setNewest(Date newest) {
		this.newest = newest;
	}

	public Date getOldest() {
		return oldest;
	}

	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}

}
