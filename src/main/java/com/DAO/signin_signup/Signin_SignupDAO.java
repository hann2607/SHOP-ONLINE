package com.DAO.signin_signup;

import com.Model.User;
import com.Utils.JpaUtils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class Signin_SignupDAO {

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

	public User findUser(String username, String password) {
		try {
			EntityManager em = JpaUtils.getEntityManager();

			TypedQuery<User> query = em.createNamedQuery("User.findUsernameAndPass", User.class);
			query.setParameter("username", username);
			query.setParameter("password", password);

			return query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public User findByUsername(String username) {
		try {
			EntityManager em = JpaUtils.getEntityManager();

			TypedQuery<User> query = em.createNamedQuery("User.findByUsername", User.class);
			query.setParameter("username", username);

			return query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
