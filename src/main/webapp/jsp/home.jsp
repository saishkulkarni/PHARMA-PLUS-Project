<%@page import="com.protech.pharmaplus.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharma Plus</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
    *{
        margin: 0;
        padding: 0;
    }
    nav{
        display: flex;
        background-color: black;
        height: 80px;
         position:sticky;
        top:0;
        z-index:12;
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
	.demo{
		position: relative;
		transition: all 0.5s linear;
	}
	.demo:hover{
		transform: scale(1.1,1.1);
	}
    footer {
  background: #212529;
}
  

  
</style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>


<body style="background-color: rgb(6, 6, 6);">

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
		<input type="search" placeholder="Search" name="product"style="position: relative;right:290%;top:28px"><button href="" style="background-color: white;border:none; width: 25px; position: relative;right:305%;top: 28px;" >
	<i style="color: rgb(20, 20, 20); position: relative ;right:60%;z-index: 4;" class="fa-solid fa-magnifying-glass"></i>
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

    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="https://images.unsplash.com/photo-1622227922682-56c92e523e58?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80%22%20alt=%22%22%20height=%22300px%22%20width=%22100%" class="d-block w-100" alt="..." height="500px">
            <div class="carousel-caption d-none d-md-block">
              <h5>First slide label</h5>
              <p>Some representative placeholder content for the first slide.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="https://consumer-app-images.pharmeasy.in/marketing/comp_cod.jpg" class="d-block w-100" alt="..." height="500px">
            <div class="carousel-caption d-none d-md-block">
              <h5>Second slide label</h5>
              <p>Some representative placeholder content for the second slide.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="https://www.netmeds.com/images/cms/aw_rbslider/slides/1689057482_NMS18.jpg" class="d-block w-100" alt="..." height="500px">
            <div class="carousel-caption d-none d-md-block">
              <h5>Third slide label</h5>
              <p>Some representative placeholder content for the third slide.</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <h1 style="margin-left: 26%; color: white;margin-top: 45px;">A Modern,Full-servise Pharmacy </h1>
      <p style="margin-left: 24%;color: white">At Medicine Center Pharmacy,we  believe health is not the just the absence of disease</p>
      <p style="margin-left: 22%;color: white">but a state immense vitality.it is  our mission to help you feel better,live together,and become</p>
      <p style="margin-left: 40%;color: white">the best possible  you</p>

      <h4 style="margin-left: 15%;margin-top: 13vh;color: white">NEUROLOGICAL</h4>
    
      <h4 style="margin-left: 15%;margin-top: 13vh;color: white">CARDIOLOGICAL</h4>

      <h4 style="margin-left: 15%;margin-top: 13vh;color: white">24 Hours Emergency</h4>

      <img style="margin-left: 50%; margin-top:-27%;border-radius: 50%;" src="https://media.istockphoto.com/id/184328089/photo/heart-stethoscope-and-ekg.webp?b=1&s=170667a&w=0&k=20&c=AqTaApbNdMMXPoN3ipbVrjFypFEc8UjGnaB1hKqZsKc=" alt="" height="400px" width="400px">

 <hr style="color: white;">
	  <!-- <div style="display: flex;justify-content: space-around;position: relative;top: 0px;">
		<div class="card" style="width: 18rem;">
			<img src="https://consumer-app-images.pharmeasy.in/marketing/comp_3step.jpg" class="card-img-top" alt="...">
			<div class="card-body">
			  <h5 class="card-title">Card title</h5>
			  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  <a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		  </div>
		  <div class="card" style="width: 18rem;">
			<img src="https://consumer-app-images.pharmeasy.in/marketing/comp_india_covered.jpg" class="card-img-top" alt="...">
			<div class="card-body">
			  <h5 class="card-title">Card title</h5>
			  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  <a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		  </div>
		  <div class="card" style="width: 18rem;">
			<img src="https://consumer-app-images.pharmeasy.in/marketing/comp_cod.jpg" class="card-img-top" alt="...">
			<div class="card-body">
			  <h5 class="card-title">Card title</h5>
			  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  <a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		  </div>
		  <div class="card" style="width: 18rem;">
			<img src="https://consumer-app-images.pharmeasy.in/marketing/comp_cod.jpg" class="card-img-top" alt="...">
			<div class="card-body">
			  <h5 class="card-title">Card title</h5>
			  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			  <a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		  </div>
	  </div>
      	  -->
		  <!-- <div class="demo" style="display: flex; justify-content: space-around;">
			<img src="https://consumer-app-images.pharmeasy.in/marketing/comp_50lac.jpg" alt="" height="200px" width="300px">
			<img src="https://consumer-app-images.pharmeasy.in/marketing/comp_india_covered.jpg" alt=""height="200px" width="300px">
			<img src="https://consumer-app-images.pharmeasy.in/marketing/comp_cod.jpg" alt=""height="200px" width="300px">
			<img src="https://consumer-app-images.pharmeasy.in/marketing/comp_50lac.jpg" alt=""height="200px" width="300px">
		  </div> -->

<div class="space" style="width: 100%; height: 80px;">

</div>

      <div class="d-md-flex flex-md-equal my-3  my-md-3 mx-md-5 ps-md-3 position-relative left-500">
        <div class="bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
          <div class="my-3 mx-2 py-3">
            <h2 class="display-5">Top Deals On Medicines</h2>
            <p class="lead" style="position:relative;top:30px;">Explore Now!</p>
          </div>
          <div class="bg-light shadow-sm mx-auto" style="width: 90%; height: 300px; border-radius: 21px 21px 0 0;">
            <a href=""><img src="https://images.unsplash.com/photo-1622227922682-56c92e523e58?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80" alt="" height="300px" width="100%"></a>
        </div>
        </div>
        <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden mx-auto">
          <div class="my-3 p-3">
            <h2 class="display-5" >Why PHARMA+?</h2>
            <div style="font-family: Arial, Helvetica, sans-serif;">
            <p class="lead"><li>We are licensed and accredited by the NABP, the National<br>Association of Boards of Pharmacy.This means that we <br> meet the highest standards of pharmacy practice.</li><li>Our pharmacists are experienced and knowledgeable.They<br>are available to answer your questions and provide you<br> with personalized advice.
            </li><li>We believe that choosing our pharmacy online store is the <br>best way to get the medications you need, conveniently<br> and affordably. We are confident that you will be happy with<br> our services.</li></p></div>
          </div>
          <div  class="space1" style="width: 100%; height: 180px;">
           <img src="https://images.unsplash.com/photo-1689616977225-bf0ab4ae1ac5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60" alt="" height="150px" width="50%"> 
          </div>
        </div>
      </div>

       <hr style="color: white;">
	  
	 
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
   



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>   
</body>
</html>

