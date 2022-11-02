package com.DAO.store;

import com.Model.Product;
import com.Model.Specification;
import com.Utils.JpaUtils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class SpecificationDAO {
	public void insert(Specification specification) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();

			em.persist(specification);

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void update(Specification specification) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();

			em.merge(specification);

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void delete(int specification) throws Exception {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			Specification spec = em.find(Specification.class, specification);

			if (spec != null) {
				em.remove(spec);
			} else {
				throw new Exception("Sản phẩm không có thông số kỹ thuật!");
			}

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}
	
	public Specification findspecificationByID(int specificationID) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			Specification spec = em.find(Specification.class, specificationID);
			return spec;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
