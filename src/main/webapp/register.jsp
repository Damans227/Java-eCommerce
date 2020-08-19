<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>

	<%@include file="components/common_css_js.jsp" %>
</head>
	<body>


		<%@include file="components/navbar.jsp" %>
			<div class="container">
			
				
		<div class="row">
			<div class ="col-md-6 offset-md-3">
				<div class="card mt-3">
				
				<div class = "card-header custom-bg text-white">
						
								<h3 class="text-center">Sign Up Here</h3>
				
				
						</div>

					<%@include file="components/message.jsp" %>


					<div class="card-body px-5">
					
					
			
			
							<form action ="RegisterServlet" method="post">
								<div class="form-group">
								
    								<label for="name">User Name</label>
   				 					<input name="user_name"  type="text" class="form-control" id="name" placeholder="Enter Here" aria-describedby="emailHelp">
    					
 								 </div>
 					 
 								 <div class="form-group">
    								<label for="email">User Mail</label>
   				 					<input name="user_email" type="email" class="form-control" id="email" placeholder="Enter Here" aria-describedby="emailHelp">
    					
 								 </div>
 					 
 								  <div class="form-group">
    								<label for="password">Password</label>
   				 					<input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Here" aria-describedby="emailHelp">
    					
 								 </div>
 					 
 								  <div class="form-group">
    								<label for="phone">User Phone</label>
   				 					<input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter Here" aria-describedby="emailHelp">
    					
 								 </div>
 					 
 								  <div class="form-group">
    								<label for="address">User Address</label>
   				 					<textarea name="user_address" style="height: 200px;" class="form-control" placeholder="Enter your address"></textarea>
    					
 								 </div>
 					 
 								 <div class ="container text-center">
 					 
 								 	<button class ="btn btn-primary custom-bg border-0">Register</button> 
 								 	<button class ="btn btn-primary custom-bg border-0">Reset</button> 
 					 	
 								 </div>
			
						</form>
					</div>
				</div>
			
			</div>
		</div>
			
			</div>



	</body>
</html>