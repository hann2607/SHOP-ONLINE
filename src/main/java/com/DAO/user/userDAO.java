package com.DAO.user;

import java.util.List;

import com.Model.User;
import com.Utils.JpaUtils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class userDAO {
	public void insert(User user) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();

			em.persist(user);

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void update(User user) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();

			em.merge(user);

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void delete(String userId) throws Exception {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			User user = em.find(User.class, userId);

			if (user != null) {
				em.remove(user);
			} else {
				throw new Exception("Người dùng không tồn tại!");
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

	public User findUserByUsername(String username) {
		try {
			EntityManager em = JpaUtils.getEntityManager();
			User user = em.find(User.class, username);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	public List<User> findAll() {
		try {
			EntityManager em = JpaUtils.getEntityManager();
			TypedQuery<User> query = em.createNamedQuery("User.findAll", User.class);

			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
