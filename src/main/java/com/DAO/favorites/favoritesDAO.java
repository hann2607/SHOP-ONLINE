package com.DAO.favorites;

import java.util.List;

import com.Model.Like;
import com.Model.Product;
import com.Model.User;
import com.Utils.JpaUtils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class favoritesDAO {

	public void insert(Like like) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();

			em.persist(like);

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}
	
	public void delete(Integer likeID) throws Exception {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			Like user = em.find(Like.class, likeID);

			if (user != null) {
				em.remove(user);
			} else {
				throw new Exception("Like không tồn tại!");
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
	
	public List<Product> findPage(int page, int pageSize, String username) {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Product> query = em.createNamedQuery("Product.findAllLikeByUser", Product.class);
		query.setParameter("username", username);
		
		query.setFirstResult(page * pageSize);
		query.setMaxResults(pageSize);
		
		return query.getResultList();
	}
	
	public double countFavoriteProduct(String username) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			TypedQuery<Long> query = em.createNamedQuery("Product.countFavoriteProduct", Long.class);
			query.setParameter("username", username);
			return ((Long)query.getSingleResult());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public Like findLikeByUser(String productID, String username) {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			TypedQuery<Like> query = em.createNamedQuery("Like.findLikeByUser", Like.class);
			query.setParameter("productid", productID);
			query.setParameter("username", username);
			return query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
