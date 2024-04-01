<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="com.protech.pharmaplus.dto.Product"%>
<%@page import="com.protech.pharmaplus.dto.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>

body {
	overflow-x: hidden;
}

*{
        margin: 0;
        padding: 0;
    }
    nav{
        display: flex;
        background-color: black;
        height: 80px;
    }
    #part2{
        display: flex;
        position: relative;
        left: 25%;
      
       
        color: white;
        list-style: none;
        width: 50%;
        justify-content: space-around;
        align-items: center;
        font-size: 20px;
        
       
    }
  

    #part1{
        position: relative;
        left: 4%;
        display: flex;
        align-items: center;
        font-size: 40px;
        font-weight: bolder;
        color: white;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        transition: all 1s linear;
    }
    #part1:hover{
        transform: rotate(360deg);
  
    }
    #part3{
        background-color: black;
        text-decoration: none;
        color: white;
        transition: all 0.5s linear;
    }
    #part3:hover{
        background-color: rgb(248, 248, 243);
        color: black;
        border-radius: 5px;
       
    }
    #part4{
        background-color: black;
        text-decoration: none;
        color: white;
        transition: all 0.5s linear;
    }
    #part4:hover{
        background-color: rgb(248, 248, 243);
        color: black;
        border-radius: 5px;
       
    }
    #part5{
        background-color: black;
        text-decoration: none;
        color: white;
        transition: all 0.5s linear;
    }
    #part5:hover{
        background-color: rgb(248, 248, 243);
        color: black;
        border-radius: 5px;
       
    }
    #part6{
        background-color: black;
        text-decoration: none;
        color: white;
        transition: all 0.5s linear;
    }
    #part6:hover{
        background-color: rgb(248, 248, 243);
        color: black;
        border-radius: 5px;
       
    }
    #part7{
        background-color: black;
        text-decoration: none;
        color: white;
        transition: all 0.5s linear;
    }
    #part7:hover{
        background-color: rgb(248, 248, 243);
        color: black;
        border-radius: 5px;
       
    }

#main_body {
	width: 100vw;
	height: 50vw;
	background-color: aqua;
}

.product_container {
	width: 100%;
	
}

.child_product_container {
	width: 90%;
	margin: auto;
	display: flex;
	flex-wrap:wrap;
	justify-content: space-between;
}

.child_product_container1 {
	width: 30%;
	border: 1px solid black;
	border-style: none;
	text-align: center;
	padding-top: 60px;
}

.img1 {
	width: 220px;
	height: 280px;
}
footer {
  background: #212529;
}


</style>
</head>
<body>
	<!-- navbar -->
	<nav>
    <div id="part1">
        PHARMA<p style="color: greenyellow;">+</p>
    </div>
    <div id="part2">
        <li><a href="/" id="part3">Home</a></li>
        <li><a href="/aboutus" id="part4">About Us</a></li>
        <li><a href="/customer/products" id="part5">Products</a></li>
        <%Customer customer=(Customer)session.getAttribute("customer");
                if(customer==null){
                %>
        <li><a href="/customer/login"id="part6">Login</a></li>
        <li><a href="/customer/signup" id="part7">Signup</a></li>
          <%}else{%>
             <div class="cart">
        <a href="/customer/cart" class="cart"><img src="data:image/jpeg;base64,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" alt="Cart" width="39em" height="39em" style="border-radius: 10em;"></a>   
    </div>
                <div>
                    <a href="/logout" style="text-decoration: none; color: white;">Logout</a>
                    
                </div>
                <%} %>
            </div>
           
        
        <div class="admin" style="position: relative;left: 490px;top:6px">
       
          <a href="/admin/login" class="admin" style="text-decoration: none;"> <img height="55px" width="55px" alt="" src="../images/adminlogo.png"></a>
      </div>
  </div> 
    </div>
    <div id="nav_child2">
		<form action="/customer/search" method="post">
		<input type="search" placeholder="Search" name="product"style="position: relative;right:280%;top:28px"><button href="" style="background-color: white;border:none; width: 25px; position: relative;right:293%;top: 28px;" >
	<i style="color: rgb(20, 20, 20); position: relative ;right:50%;z-index: 4;" class="fa-solid fa-magnifying-glass"></i>
		</button>
		</form>
		</div>                                                                                                                                                                                                                                                                                                                                                                                                  

</nav>
	 <h1 id="successMessage" style="color:green">${pass}</h1>
<h1 id="failMessage" style="color:red">${fail}</h1>

<script>
    // Get the success and fail message elements
    var successMessage = document.getElementById("successMessage");
    var failMessage = document.getElementById("failMessage");

    // Check if the success message exists and display it as a pop-up alert
    if (successMessage.innerText !== "") {
        window.alert(successMessage.innerText);
        successMessage.style.display = "none"; // Hide the success message element
    }

    // Check if the fail message exists and display it as a pop-up alert
    if (failMessage.innerText !== "") {
        window.alert(failMessage.innerText);
        failMessage.style.display = "none"; // Hide the fail message element
    }
</script>
	
	<!-- carousel -->
	<div id="carouselExampleSlidesOnly" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="https://himalayawellness.in/cdn/shop/files/desktop.jpg?v=1688441953&width=1920" class="d-block w-100" alt="..."
					height="500em">
			</div>
			<div class="carousel-item">
				<img src="https://www.netmeds.com/images/cms/aw_rbslider/slides/1689009325_Web_Home_Banner.jpg" class="d-block w-100" alt="..."
					height="500em">
			</div>
			<div class="carousel-item">
				<img src="https://cdn.pixabay.com/photo/2016/07/25/10/15/headache-1540220_640.jpg" class="d-block w-100" alt="..."
					height="500em">
			</div>
		</div>
	</div>
	<!-- products -->
	<!-- <div><marquee behavior="alternate" direction="right" style="font-size: 50px;font-style: italic;">Collection</marquee></div> -->
	<div
		style="font-size: 50px; font-style: italic; position: relative; left: 50px;">MEDICINES</div>

	<div class="product_container">

		<div class="child_product_container">

			<%
			List<Product> list = (List<Product>) request.getAttribute("list");
			for (Product prod : list) {
			%>

			<div class="child_product_container1" >
				<%
				String base64 = Base64.encodeBase64String(prod.getImage());
				%>
				<img height="300" width="300" alt="unknown"
					src="data:image/jpeg;base64,<%=base64%>">
				<h5 style="position: relative; top: 5px;">
					<%=prod.getName()%>-<%=prod.getBrand()%>
				</h5>
				<h5 style="position: relative; top: 5px;">
					(<%=prod.getSubcategory()%>)
				</h5>
				<h3 style="color: coral; position: relative; top: 5px;">
					<%=prod.getPrice()%>
					&#8377
				</h3>
				<a href="/customer/addtocart?id=<%=prod.getId()%>"><button
						style="background-color: goldenrod; font-size: 15px; padding: 10px; border-style: none; position: relative; top: 5px;">Add
						to cart</button></a>
			</div>

			<%
			}
			%>

		</div>

	</div>

	<!-- footer -->
	<div>
      <footer class="w-100 py-4 flex-shrink-0 position-relative top-60 my-3">
        <div class="container py-4">
            <div class="row gy-4 gx-5">
                <div class="col-lg-4 col-md-6">
                    <h5 class="h1 text-white">PHARMA+</h5>
                    <p class="small text-muted">We offer a wide range of products, including:

<li style="color:rgb(108, 108, 108);">Prescription medications</li>
<li style="color:rgb(108, 108, 108);">Over-the-counter medications</li>
<li style="color:rgb(108, 108, 108);">Health and wellness products</li>
<li style="color:rgb(108, 108, 108);">Vitamins and supplements</li>
<li style="color:rgb(108, 108, 108);">Personal care products</li></p>
                    
                </div>
                <div class="col-lg-2 col-md-6">
                    <h5 class="text-white mb-3">Quick links</h5>
                    <ul class="list-unstyled text-muted">
                        <li><a href="/" style="color:rgb(108, 108, 108);text-decoration: none;">Home</a></li>
                        <li><a href="/aboutus" style="color:rgb(108, 108, 108);text-decoration: none;">About</a></li>
                        <li><a href="/customer/products" style="color:rgb(108, 108, 108);text-decoration: none;">Products</a></li>
                        <li><a href="/customer/signup" style="color:rgb(108, 108, 108);text-decoration: none;">Signup</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6">
                    <h5 class="text-white mb-3">Customer Support</h5>
                    <ul class="list-unstyled text-muted">
                        <li><a href="#"style="color:rgb(108, 108, 108);text-decoration: none;">Telephone no:23155663</a></li>
                        <li><a href="#"style="color:rgb(108, 108, 108);text-decoration: none;">Watsapp no:9686750750</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-6" style="position: relative;left: 90px;">
                    <h5 class="text-white mb-3">Delivery</h5>
                    <p class="small text-muted"><li style="color:rgb(108, 108, 108);">Increased customer satisfaction</li>
                    <li style="color:rgb(108, 108, 108);">Free delivery costs</li>
                    <li style="color:rgb(108, 108, 108);">Improved efficiency</li>
                    <li style="color:rgb(108, 108, 108);">Enhanced reputation</li>
                    
                    </p>
                  
                        
                </div>
            </div>
        </div>
    </footer>
</div>
   


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>  




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>