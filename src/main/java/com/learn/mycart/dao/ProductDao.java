package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.*;

import org.hibernate.query.Query;

import com.learn.mycart.entity.Product;

public class ProductDao {
	
	

	private SessionFactory factory;
	
	public ProductDao(SessionFactory factory) {
		
		this.factory = factory;
	}

	
	
	public boolean saveProduct(Product product) {
		
		boolean f = false;
		
		
		try {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		
		
		session.save(product);
		
		
		
		tx.commit();
		
		
		session.close();
		
		f = true;
		
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
			f=false;
		}
		
		return f;
		
		
	}
	
	//get all products
	
	public List<Product> getAllProducts()
	{
		
		Session s = this.factory.openSession();
		
		 Query query = s.createQuery("from Product");
		
		List<Product> list = query.list();
		
		return list;
		
		
		
	}
	
	public List<Product> getAllProductsById(int cid)
	{
		
		Session s = this.factory.openSession();
		
		 Query query = s.createQuery("from Product as p where p.category.categoryId =: id ");
		 query.setParameter("id", cid);
		
		List<Product> list = query.list();
		
		return list;
		
		
		
	}
	
	
	
	
}
