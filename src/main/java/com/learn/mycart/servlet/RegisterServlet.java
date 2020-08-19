package com.learn.mycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.entity.User;
import com.learn.mycart.helper.FactoryProvider;


public class RegisterServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userPhone= request.getParameter("user_phone");
				String userAddress = request.getParameter("user_address");
				
				
				PrintWriter out = response.getWriter();
				
				
				// validations - will apply later
				
				if(userName.isEmpty()) {
					
					
					
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Username Is Blank ");
					
					response.sendRedirect("register.jsp");
					
					
					return;
					
					
				}
				
				//Creating user object to store data
				
				User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal" );
				
				
				Session hibernateSession = FactoryProvider.getFactory().openSession();
				
				Transaction tx = hibernateSession.beginTransaction();
				
				
				int userId = (int) hibernateSession.save(user);
				
				tx.commit();
				
				hibernateSession.close();
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Registration Sucessful !! " + userId);
				
				response.sendRedirect("register.jsp");
				
				return;
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		
	
	}

}
