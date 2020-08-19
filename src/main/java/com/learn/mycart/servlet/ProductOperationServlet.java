package com.learn.mycart.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entity.Category;
import com.learn.mycart.entity.Product;
import com.learn.mycart.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		try{
			
			PrintWriter out = response.getWriter();
			
			String op = request.getParameter("operation");
			
			if(op.trim().equals("addcategory")) {
				
				String categoryTitle = request.getParameter("catTitle");
				String categoryDescription = request.getParameter("catDescription");
				
				Category category = new Category();
				
				category.setCategoryTitle(categoryTitle);
				category.setCategoryDescription(categoryDescription);
				
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				
				int catId = categoryDao.saveCategory(category);
				
				//out.println("Category Saved!");
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category Added Successfully: "+ catId);
				response.sendRedirect("admin.jsp");
				return;
			}
			
			else if(op.trim().equals("addproduct")) {
				
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPic");
				
				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
				
				
				
				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdao.getCategoryById(catId);
				
				p.setCategory(category);
				
				//Product Save..
				
				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
				
				//Pic upload.. 
				
				String path = request.getRealPath("img") +File.separator+ "products" +File.separator+ part.getSubmittedFileName();
				System.out.println(path);
				
				//Uploading code
				
				
				try {
				FileOutputStream fos = new FileOutputStream(path);
				
				InputStream is = part.getInputStream();
				
				//reading data...
				
				byte []data = new byte[is.available()];
				is.read(data);
				
				//writing the data
				
				fos.write(data);
				
				fos.close();
				
				}
				
				catch(Exception e) {
					e.printStackTrace();
					
				}
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product Added Successfully ");
				response.sendRedirect("admin.jsp");
				return;
				
			}
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
			
			
		}
		
		
}
	
}
