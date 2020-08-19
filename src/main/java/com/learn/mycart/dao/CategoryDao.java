package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entity.Category;

public class CategoryDao {
	
	
	private SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		
		this.factory = factory;
	}
	
	public int saveCategory(Category cat) {
		
		
		Session session = this.factory.openSession();
		
		Transaction tx =	session.beginTransaction();
		
		int catId = (int)session.save(cat);
		
		tx.commit();
		
		session.close();
		
		return catId;
		
		
	}
	
	public List<Category> getCategories(){
		
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Category");
		List<Category> list=query.list();
		return list;
	}
	
	public Category getCategoryById(int cid) {
		
		Session session = this.factory.openSession();
		Category cat = session.get(Category.class, cid);
		session.close();
		
		return cat;
		
	}
	
}
