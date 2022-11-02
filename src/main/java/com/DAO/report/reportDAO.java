package com.DAO.report;

import java.util.List;

import com.Model.ReportFavoriteByProduct;
import com.Model.ReportUserByProduct;
import com.Model.ReportUserShareProduct;
import com.Utils.JpaUtils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.StoredProcedureQuery;

public class reportDAO {
	public List<ReportFavoriteByProduct> CountFavoriteByProduct() {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			StoredProcedureQuery query = em.createNamedStoredProcedureQuery("ReportFavoriteByProduct.CountFavoriteByProduct");
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public List<ReportUserByProduct> ReportUserByProduct(String productName) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			StoredProcedureQuery query = em.createNamedStoredProcedureQuery("ReportUserByProduct.ReportUserByProduct");
			query.setParameter("productName", "%" + productName + "%");
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public List<ReportUserShareProduct> ReportUserShareProduct(String productName) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			StoredProcedureQuery query = em.createNamedStoredProcedureQuery("ReportUserShareProduct.ReportUserShareProduct");
			query.setParameter("productName", "%" + productName + "%");
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
