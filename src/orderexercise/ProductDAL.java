/**
 * @author myatmyolwin
 */

package orderexercise;


import java.sql.SQLException;
import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public class ProductDAL {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public ArrayList<Product> getAll() throws SQLException, ClassNotFoundException {
		
		org.hibernate.Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product");
		ArrayList<Product> products = (ArrayList<Product>) query.list();
		return products;

	}

	public void add(Product product) throws SQLException, ClassNotFoundException {

		org.hibernate.Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(product);
		session.getTransaction().commit();
		session.close();
		
	}

	public void update(Product product) throws SQLException, ClassNotFoundException {

		org.hibernate.Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(product);
		session.getTransaction().commit();
		session.close();

	}

	public void delete(Product product) throws SQLException, ClassNotFoundException {

		org.hibernate.Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(product);
		session.getTransaction().commit();
		session.close();

	}
}
