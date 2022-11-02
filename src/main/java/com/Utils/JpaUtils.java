package com.Utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtils {
	public static EntityManager getEntityManager() {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("ASM_JAVA4");
		return factory.createEntityManager();
	}
}
