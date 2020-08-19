function add_to_cart(pid,pname, price)
{
	
	let cart = localStorage.getItem("cart");
	if(cart == null){
		
		//no cart yet
		
		let products=[];
		let product={productId:pid, productName:pname,productQuantity:1, productPrice: price }
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products))
		console.log("Product is added for the first time.")
		
	}
	
	else{
		//cart is already present 
		
		let pcart = JSON.parse(cart);
		
		let oldProduct = pcart.find((item)=>item.productId==pid)
		if(oldProduct){
			
			//We have to increase the quantity
			
			oldProduct.productQuantity = oldProduct.productQuantity+1
			pcart.map((item)=>{
				
				if(item.productId==oldProduct.productId)
				{
					
					
					item.productQuantity = oldProduct.productQuantity;
					
				}
				
				
			})
			
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("Product quantity is increased. ")
			
		}else{
			
			//We have to add the quantity 
			
			let product={productId:pid, productName:pname,productQuantity:1, productPrice: price }
			pcart.push(product)
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("Product is added.")
			
		}
	}
		updateCart();
	

}




//update cart:


function updateCart(){
	
	
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);

	if(cart==null||cart.length==0){
		
		
		console.log("Cart is empty !!")
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Your cart is empty right now !!</h3>")
		$(".checkout-btn").attr('disabled',true)
		
	}	else{
		
		// There is something in cart to show
		
		console.log(cart)
		$(".cart-items").html(`(${cart.length})`);
		
		let table = `
		
			<table class='table'>
			
				<thead class='thead-light'>
			
					<tr>
			
						<th>Item Name	</th>
						<th>Price	</th>
						<th>Quantity	</th>
						<th>Total Price	</th>
						<th>Action	</th>
			
			
					</tr>
					
					
				</thead>
		
		
		`;
		
			let totalPrice = 0;
			cart.map((item)=>{
				
				table+=`
				
					<tr>
					
						<td>${item.productName}</td>
						<td>&#36;${item.productPrice}</td>
						<td>${item.productQuantity}</td>
						<td>&#36;${item.productQuantity*item.productPrice}</td>
						<td><button onclick=' deleteItemFromCart(${item.productId}) '  class='btn btn-danger btn-sm'>Remove</button></td>
					
					</tr>
					
				
					
				
				`
				
				totalPrice += item.productPrice * item.productQuantity;
				
			})
		
		
		table = table +`
			<tr><td colspan='5' class='text-right font-weight-bold m-5'>
			 	Total Price: &#36;${totalPrice}
			
			</td></tr>
		
		</table>`
		
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false)
		console.log("removed")
		
	}
	
	
}


//Delete item

function deleteItemFromCart(pid){
	
	let cart = JSON.parse(localStorage.getItem('cart'));
	
	let newcart = cart.filter((item)=> item.productId != pid)

	localStorage.setItem('cart', JSON.stringify(newcart))

	updateCart();
	
	
}



$(document).ready(function(){
	
	updateCart()
	
	
})

function goToCheckout(){
	
	window.location = "checkout.jsp"
	
	
}







































