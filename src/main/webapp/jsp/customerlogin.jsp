<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.protech.pharmaplus.dto.Customer"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
* {
	padding: 0;
	margin: 0;
}

#parent {
	display: flex;
	justify-content: end;
	background-color: rgba(27, 27, 27, 2);
	height: 50px;
	width: 100%;
	position: sticky;
	top: 0px;
	z-index: 2;
	align-items: center;
}

.admin {
	color: beige;
	position: relative;
	left: -20px;
}

.admin:hover {
	color: red;
}

.parent1 {
	display: flex;
	justify-content: center;
	background-color: black;
	height: 100px;
	align-items: center;
	position: sticky;
	top: 50px;
	z-index: 10
}

.child1 {
	color: white;
	position: relative;
	left: -15rem;
}

#child2 {
	width: 50%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 20px;
	font-family: 'Times New Roman', Times, serif;
}


.login{
	height: 500px;
	
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	top:14%;
	right:18%;
}


.tab {

	border: 2px solid black;
	background-color: white;
	padding: 60px;
	
}

input[id="user"] {
	border-color: black;
	border-width: 1px;
	border-radius: 3px;
	
}
input{
	
}

input[id="password"] {
	border-color: black;
	border-width: 1px;
	border-radius: 3px;
}

body{
	background-image: url("..//images/login3.jpg");
    background-repeat: no-repeat;
	background-size: 100% 100vh;
}
::placeholder{
	position: relative;
	left: 10px;
	color: black;
	font-weight: 400;
}
</style>
</head>
<body>


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

	
	<!-- <div id="parent">
		<div class="admin">
			<a href="adminlogin.jsp" class="admin" style="text-decoration: none;"><img
				height="60px" width="60px" alt="unknown"
				src="../images/adminlogo.png"></a>
		</div>
	</div> -->
<!-- <section class="parent1">
		<div class="child1">
			<a href="/" style="text-decoration: none; color: white;"><h1>PHARMA+</h1></a>
		</div>
		<div id="child2">
			<div id="child">
				<a href="/" style="text-decoration: none; color: white;">Home</a>
			</div>
			
			<div>
				<a href="/customer/products"
					style="text-decoration: none; color: white;">Products</a>
			</div>
			<div>
				<a href="/aboutus"
					style="text-decoration: none; color: white;">About us</a>
			</div>
			<%Customer customer=(Customer)session.getAttribute("customer") ;
			if(customer==null){
				
			%>
			<div>
				<a href="/customer/login"
					style="text-decoration: none; color: white;">Login</a>
			</div>
			<div>
				<a href="/customer/signup"
					style="text-decoration: none; color: white;">SignUp</a>
			</div>
			<%} else{%>
			<div class="cart">
        <a href="/customer/cart" class="cart"><img src="data:image/jpeg;base64,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" alt="Cart" width="39em" height="39em" style="border-radius: 10em;"></a>     </div>
			<div>
				<a href="/logout"
					style="text-decoration: none; color: white;">Logout</a>
			</div>
			<%}%>
			

		</div>
	</section> -->
	<div class="login" >
		<form action="/customer/login" method="post">
		
			<table class="tab"
				style="height: 500px; width: 350px ; border-radius: 10px;background-image: linear-gradient(to bottom right,white,rgb(60, 59, 59));">
				
				<tr>
				<td>
					<button style="width: 15%;height: 100%;;position: relative;right:24%; bottom:60px;font-weight: 700;border-radius: 5px;" title="Back"><a href="/" style="text-decoration: none;"><---</a></button>
				</td>
			</tr>
				<tr>
					<th>${fail}</th>
				</tr>

				<tr>
					<th
						style="font-size: 20px; font-style: normal; text-align: center; ">USER
						LOGIN</th>
				</tr>
				<tr>
					<td>
						<h1 style="font-size: 15px;position: relative;top: 35%;">USERNAME</h1>
					</td>
				</tr>
				<tr>
				 

					<td><input type="text" name="user" id="user"
						placeholder="Enter email/mobile"
						style="width: 250px;position: relative;bottom: 15%; height: 35px; font-size: 12px; background-color: lightgoldenrodyellow;">
					</td>

				</tr>
				<tr>
					<td>
						<h1 style="font-size: 15px;position: relative;bottom:29%">PASSWORD</h1>
					</td>
				</tr>
				<tr>
					<td><input type="password" name="password" id="password"
						placeholder="password"
						style="width: 250px;position: relative;bottom: 50%; height: 35px; font-size: 12px; background-color: lightgoldenrodyellow;">
					</td>
				</tr>
				<tr>
					<td>
						<button
							style="width: 200px; height: 35px;position: relative;outline: 2px solid black;bottom: 50%;left: 10%; background-color:#176B87; border-style: none; border-radius: 2px;font-weight: 700;" >Login</button>
					</td>
				</tr>
            <tr>
				<td>
				</td>
			</tr>
			<tr>
				<td>
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<button style="width: 80%;height: 100%;background-color:#176B87;position: relative;left: 10%;top: 5px;font-weight: 700;border-radius: 5px;"><a href="/customer/signup" style="text-decoration: none;color: black;font-weight: bold;">Signup</a></button>
				</td>
			</tr>
			</table>
			
		</form>
		
	</div>
	
</body>