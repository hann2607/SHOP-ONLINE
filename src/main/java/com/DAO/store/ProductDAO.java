package com.DAO.store;

import java.util.List;

import com.Model.Product;
import com.Model.Specification;
import com.Model.User;
import com.Utils.JpaUtils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.StoredProcedureQuery;
import jakarta.persistence.TypedQuery;

public class ProductDAO {
	SpecificationDAO specificationDAO = new SpecificationDAO();
	public void insert(Product product, Specification specification) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			
			specificationDAO.insert(specification);
			em.persist(product);

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void update(Product product, Specification specification) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			
			specificationDAO.update(specification);
			em.merge(product);

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void delete(String productID) throws Exception {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			Product product = em.find(Product.class, productID);

			if (product != null) {
				em.remove(product);
			} else {
				throw new Exception("Sản phẩm không tồn tại!");
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
	
	public List<Product> findPage(int page, int pageSize) {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Product> query = em.createNamedQuery("Product.findAll", Product.class);
		
		query.setFirstResult(page * pageSize);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
	}
	
	public List<Product> findTop3Product() {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Product.findTop3Product");
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public Product findProductByID(String productID) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			Product product = em.find(Product.class, productID);
			return product;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public Specification findSpecificationByID(int specID) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			Specification specification = em.find(Specification.class, specID);
			return specification;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public List<Product> findAll() {
		try {
			EntityManager em = JpaUtils.getEntityManager();
			TypedQuery<Product> query = em.createNamedQuery("Product.findAll", Product.class);

			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public List<Product> findProductByCategory(String category) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			TypedQuery<Product> query = em.createNamedQuery("Product.findTop4ProductByCategory", Product.class);
			query.setParameter("category", category);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public double countProduct() {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			TypedQuery<Long> query = em.createNamedQuery("Product.countProduct", Long.class);
			return ((Long)query.getSingleResult());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
