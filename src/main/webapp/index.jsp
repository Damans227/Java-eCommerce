<%@page import="com.learn.mycart.helper.FactoryProvider" %>
<%@page import="com.learn.mycart.helper.Helper" %>
<%@page import="com.learn.mycart.entity.User" %>
<%@page import="com.learn.mycart.entity.Product" %>
<%@page import="com.learn.mycart.entity.Category" %>
<%@page import="com.learn.mycart.dao.CategoryDao" %>
<%@page import="com.learn.mycart.dao.ProductDao" %>
<%@page import="java.util.List" %>


<html>
	<head>
	<title>MyCart - Home</title>
	<%@include file="components/common_css_js.jsp" %>


	</head>
	<body>

		<%@include file="components/navbar.jsp" %>


		<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

		%>
		
		<div class="container-fluid">
		
		<div class="row mt-3 mx-2">
		
			<%
			
			String cat = request.getParameter("category");
			
			
			//out.println(cat);
			
			ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
			List<Product> pList = null;
			
			if(cat == null || cat.trim().equals("all")){
				
				pList = pDao.getAllProducts();
			}
			
			else{
				
				int cid = Integer.parseInt(cat.trim());
				pList = pDao.getAllProductsById(cid);
				
			}
			
	
			
			CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> cList = cDao.getCategories();
			
			
			%>
		
		
		
		
			<!-- Show Categories -->
			<div class="col-md-2">
		
					<div class="list-group mt-4">
					
							 
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active custom-bg">
    							All Products
 					</a>
					
					
				
					<% 
				
						for(Category category:cList)
					
						{
					
					%>
					
					  <a href="index.jsp?category=<%= category.getCategoryId() %>" class="list-group-item list-group-item-action"> 
					  
					  <%= category.getCategoryTitle() %>
					  
					  
					  </a>
					
				
					<% 
					
						}
				
				
					%>
						</div>
					
		
			</div>
		
		
			<!-- Show products -->
			<div class="col-md-10">
		
					<!-- Row -->
					<div class="row mt-4">
					
						<!-- col: 12 -->
						<div class="col-md-12">
						
							<div class="card-columns">
							<%
							
							for(Product product : pList){
							
							%>
								
								<div class = "card product-card">
									
									<div class="container text-center">
									
										
									  <img src="img/products/<%= product.getpPhoto() %>" style="max-height:200px; max-width:100%; width: auto;'"  class="card-img-top m-2" alt="...">
									
									</div>
								
								
									<div class="card-body">
									
										
										<h5 class="card-title"><%= product.getpName() %></h5>
										
										<p class="card-text">
											
											<%= Helper.get10Words(product.getpDesc()) %>
										
										
										</p>
									
									</div>
									
									<div class="card-footer text-center">
									
									
										<button class="btn custom-bg text-white" onclick="add_to_cart(<%= product.getpId() %>,'<%= product.getpName()%>', <%= product.getPriceAfterDiscount() %> )">Add To Cart </button>
										<button class="btn btn-outline-success"> &#36; <%= product.getPriceAfterDiscount() %> <span class="text-secondary discount-label"> &#36; <%= product.getpPrice()%>, <%= product.getpDiscount() %> % off  </span> </button>
									
									</div>
								
								
								
								</div>
								
								
								
								
							
							<%
							
							
							}
							
							if(pList.size() == 0){
								
								out.println("<h3>No items in this Category.</h3> ");
								
							}
							
							
							
							%>
							
							</div>
						
						
						</div>
					
					
					</div>
					
		
			</div>
		
		</div>
		
		</div>
		
		<%@include file="components/common_modals.jsp"%>
		


	</body>
</html>
