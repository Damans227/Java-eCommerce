package com.learn.mycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entity.User;
import com.learn.mycart.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao userDao = new UserDao(FactoryProvider.getFactory());
		User user = userDao.getUserByEmail(email, password);
		
		
		//System.out.println(user);

		
		HttpSession httpSession = request.getSession();
		
		if(user == null) {
			
			httpSession.setAttribute("message", "Invalid Credentials. Please enter correct details.");
			response.sendRedirect("login.jsp");
			return;
		}
		
		else {
			
			out.println("<h1> Welcome "+ user.getUserName()+" </h1>");
			
			
			//login
			httpSession.setAttribute("current-user", user);
			
			if(user.getUserType().equals("admin")) {
				
				response.sendRedirect("admin.jsp");
				
			} else if(user.getUserType().equals("normal")) {
				
				response.sendRedirect("normal.jsp");
				
			}
			
			else {
				
				out.println("We have not identified user type");
			}
			
			//admin
			
		}
}
	
}
