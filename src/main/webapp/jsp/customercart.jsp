<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="com.protech.pharmaplus.dto.Customer"%>
<%@page import="com.protech.pharmaplus.dto.Item"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">

<style>
* {
	padding: 0;
	margin: 0;
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

#cart_imagehead {
	height: 5em;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background-image: radial-gradient(skyblue, white);
	font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande',
		'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
	position: relative;
	top: 15px;
}

#cart_table {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	font-size: medium;
	border-collapse: collapse;
	position: relative;
	top: 2em;
}

.cart_quantity {
	width: 3em;
	text-align: center;
}

#cart_head {
	background-image: linear-gradient(to top, gray, white);
}

#cart_total {
	position: relative;
	left: 65em;
	top: 50px;
	border-spacing: 2em;
}

td {
	text-align: left;
	border-bottom: -1em solid;
}

#cart_image {
	width: 250px;
	height: 200px;
	text-align: center;
}
</style>
</head>
<body>
	<h1>${pass}</h1>
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
                                                                                                                                                                                                                                                                                                                                                                                                     

</nav>


	<%
	List<Item> list = (List<Item>) request.getAttribute("list");
	%>


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
	
	
	<div id="cart_imagehead">
		<h1>Cart Page</h1>
	</div>
	<center>
		<table style="text-align: center;" id="cart_table" cellspacing="5em"
			cellpadding="50em" border="2em">
			<tr id="cart_head">
				<td style="text-align: center; padding: 20px;"><h3>Product
						Image</h3></td>
				<td style="text-align: center; padding: 20px;"><h3>Product</h3></td>
				<td style="text-align: center; padding: 20px;"><h3>Price</h3></td>
				<td style="text-align: center; padding: 20px;"><h3>Quantity</h3></td>
				<td style="text-align: center; padding: 20px;"><h3>Total</h3></td>
				<td style="text-align: center; padding: 20px;"><h3>Remove</h3></td>
			</tr>

			<%
			for (Item prod : list) {
			%>
			<tr>
				<td id="cart_image">
					<%
					String base64 = Base64.encodeBase64String(prod.getImage());
					%> <img height="300" width="300" alt="unknown"
					src="data:image/jpeg;base64,<%=base64%>">
				</td>
				<td style="text-align: center;">
					<h3><%=prod.getName()%></h3>
				</td>
				<td style="text-align: center;"><h3><%=(prod.getPrice() / prod.getQuantity())%></h3></td>
				<td style="text-align: center;"><h3><%=prod.getQuantity()%></td>
				<td style="text-align: center;"><%=prod.getPrice()%></td>
				<td style="text-align: center;"><a
					href="/customer/<%=prod.getName()%>"><button
							style="padding: 5px; font-size: 15px;">Delete</button></a></td>
			</tr>


			<%
			}
			%>



		</table>

		
	</center>

<a href="/jsp/cusomerbill.jsp"><button type="submit" style="position:relative;left:50%;top:50px;background-color:silver;padding:8px;border-radius:5px;color:black;font-weight:bold">Place
				Order</button></a>
</body>
</html>