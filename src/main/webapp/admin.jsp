<%@page import="com.learn.mycart.entity.User" %>
<%@page import="com.learn.mycart.entity.Category" %>
<%@page import="com.learn.mycart.dao.CategoryDao" %>
<%@page import="com.learn.mycart.helper.FactoryProvider" %>
<%@page import="com.learn.mycart.helper.Helper" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>






<%

response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

User user = (User)session.getAttribute("current-user");

if(user==null){
	
	session.setAttribute("message", "You are not logged in! Login first.");
	response.sendRedirect("login.jsp");
	return;
	
}

else{
	
	
	if(user.getUserType().equals("normal")){
		
		session.setAttribute("message","You are not an Admin. Sorry!");
		response.sendRedirect("login.jsp");
		return;
		
	}
	
	
}




%>


<%
      								  			
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = cdao.getCategories();
     
//getting count

 Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());  	
							  		
      								  		
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
			<head>
				<meta charset="UTF-8">
					<title>Admin panel</title>

						<%@include file="components/common_css_js.jsp" %>

			</head>
			<body>
					<%@include file="components/navbar.jsp" %>
					
					
					
					<div class ="container admin">
					
					
					<div class="container-fluid mt-3">
						
							<%@include file="components/message.jsp" %>
							
							
						</div>
					
					
					
						<div class="row mt-4">
							
							<!-- First Column -->
							
							<div class="col-md-4">
							
							<!-- First Box -->
								<div class="card">
								
									<div class="card-body text-center">
									
										<div>
									
											<img style="max-width: 150px;" class="image-fluid" src="img/user.png" alt="user-icon">
										</div>
										<h1><%= m.get("userCount") %></h1>
										<h1 class="text-uppercase text-muted">Users</h1>
									
										
									</div>
								
								
								</div>
							
							</div>
							<!-- Second Column -->
							
							<div class="col-md-4">
							<!-- Second box -->
							<div class="card">
								
									<div class="card-body text-center">
									
										<div>
									
											<img style="max-width: 150px;" class="image-fluid" src="img/funnel.png" alt="user-icon">
											
										</div>
									
										<h1><%= list.size() %></h1>
										<h1 class="text-uppercase text-muted">Categories</h1>
									
										
									</div>
								
								
								</div>
							
							</div>
							
							<!-- Third Column -->
							
							<div class="col-md-4">
							<!-- Third Box -->
							<div class="card">
								
									<div class="card-body text-center">
									
										<div>
									
											<img style="max-width: 150px;" class="image-fluid" src="img/box.png" alt="user-icon">
											
										</div>
										
										<h1><%= m.get("productCount") %></h1>
										<h1 class="text-uppercase text-muted">Products</h1>
									
										
									</div>
								
								
								</div>
							
							</div>
						
						</div>
						
						<!-- Second Row -->
						
						<div class="row mt-3">
							
							<!-- Second Row: First Column -->
							
							<div class="col-md-6">
							
								<div class="card" data-toggle="modal" data-target="#add-category-modal">
								
									<div class="card-body text-center">
									
										<div>
									
											<img style="max-width: 150px;" class="image-fluid" src="img/x.png" alt="user-icon">
											
										</div>
										
										<p class="mt-2">Click here to add new category</p>
										<h1 class="text-uppercase text-muted">Add Category</h1>
									
										
									</div>
								
								
								</div>
							</div>
							
							<!-- Second Row: Second Column -->
							
							<div class="col-md-6">
							
								<div class="card"  data-toggle="modal" data-target="#add-product-modal">
								
									<div class="card-body text-center">
									
										<div>
									
											<img style="max-width: 150px;" class="image-fluid rounded-circle" src="img/product.png" alt="user-icon">
											
										</div>
										
										<p class="mt-2">Click here to add new product</p>
										<h1 class="text-uppercase text-muted">Add Product</h1>
									
										
									</div>
								
								
								</div>
							
							</div>
						
						
						</div>
						
					</div>
					
					
					<!-- Category Modal -->
					
					<!-- Button trigger modal -->
								<!--  button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-category-modal">
  								Launch demo modal
								</button>-->

								<!-- Modal -->
								<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  								<div class="modal-dialog modal-lg">
  								  <div class="modal-content">
   								   <div class="modal-header custom-bg text-white">
   								     <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
   								     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
  								        <span aria-hidden="true">&times;</span>
   								     </button>
  								    </div>
  								    <div class="modal-body">
      								  
      								  	<form action="ProductOperationServlet" method="post">
      								  	
      								  		<input type="hidden" name="operation" value="addcategory">
      								  	
      								  		<div class="form-group">
      								  			
      								  			<input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
      								  			
      								  		</div>
      								  	
      								  	
      								  		<div class="form-group">
      								  		
      								  			<textarea style="height: 250px" class="form-control" name="catDescription" placeholder="Enter category description" required></textarea>
      								  		
      								  		</div>
      								  		
      								  		<div class="container text-center">
      								  		
      								  			
      								  			<button class="btn btn-outline-success">Add Category</button>
      								  			 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    								 
      								  		
      								  		</div>
      								  	
      								  	</form>      								  
      								  
  								    </div>
    								  <div class="modal-footer">
    								  
   								   </div>
   								 </div>
  								</div>
								</div>
					
					
					<!-- End Category Modal -->
					
					
					
					<!-- Product Modal -->
					

								<!-- Modal -->
								<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  								<div class="modal-dialog modal-lg">
  								  <div class="modal-content">
   								   <div class="modal-header custom-bg text-white">
   								     <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
   								     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
  								        <span aria-hidden="true">&times;</span>
   								     </button>
  								    </div>
  								    <div class="modal-body">
      								  
      								  	<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
      								  	
      									  	<input type="hidden" name="operation" value="addproduct">
      								  	
      								  		<div class="form-group">
      								  			
      								  			<input type="text" class="form-control" name="pName" placeholder="Enter product title" required/>
      								  			
      								  		</div>
      								  	
      								  	
      								  		<div class="form-group">
      								  		
      								  			<textarea style="height: 150px" class="form-control" name="pDesc" placeholder="Enter product description" required></textarea>
      								  		
      								  		</div>
      								  		
      								  		<div class="form-group">
      								  			
      								  			<input type="number" class="form-control" name="pPrice" placeholder="Enter price of the product" required/>
      								  			
      								  		</div>
      								  		
      								  		<div class="form-group">
      								  			
      								  			<input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>
      								  			
      								  		</div>
      								  		
      								  		<div class="form-group">
      								  			
      								  			<input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required/>
      								  			
      								  		</div>
      								  		
      								  		<!-- Product Category -->
      								
      								  		
      								  		
      								  		<div class="form-group">
      								  			
      								  				<select name = "catId" class="form-control" id="">
      								  				
      								  				<%
      								  				
      								  				for(Category c: list){
      								  				
      								  				%>
      								  				
      								  				
      								  				<option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
      								  				
      								  				
      								  			
      								  				<% 
      								  				}
      								  				
      								  				%>
      								  			</select>
      								  			
      								  		</div>
      								  		
      								  		<div class="form-group">
      								  			
      								  			<label for="pPic">Select picture of product</label><br>
      								  			<input type="file" class="form-control"id="pPic" name="pPic" required/>
      								  			
      								  		</div>
      								  	
      								  		
      								  		<div class="container text-center">
      								  		
      								  			
      								  			<button class="btn btn-outline-success">Add Product</button>
      								  			 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    								 
      								  		
      								  		</div>
      								  	
      								  	</form>      								  
      								  
  								    </div>
    								  <div class="modal-footer">
    								  
   								   </div>
   								 </div>
  								</div>
								</div>
					
					
					<!-- End Product Modal -->
					
							<%@include file="components/common_modals.jsp"%>
					
			</body>
</html>