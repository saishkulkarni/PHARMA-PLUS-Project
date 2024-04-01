<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.util.List"%>
<%@page import="com.protech.pharmaplus.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Searched Products</title>
<style>
	button{
		background-color:black;
		color: white;
		height: 25px;
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
	
	
}
</style>



</head>
<body style="display: flex;flex-direction: column;">

<div id="cart_imagehead">
		<h1>Results Found..</h1>
	</div>

	<table border="2px" cellpadding="30px" style="background-color:white;position:relative;top:20px; ">
		<tr style="background-image:linear-gradient(white,grey); color: black;font-size:20px;font-weight:bold;">
			<td style="width:100px">Brand</td>
			<td style="width:100px">Name</td>
			<td style="width:100px">Price</td>
			<td style="width:100px">Image</td>
			<td style="width:100px">Size</td>
			<td style="width:100px">Add To Cart</td>
		</tr>

	<%
	List<Product> product = (List<Product>) request.getAttribute("list");
	if (product != null) {
		for (Product product2 : product) {
			
	%>

		<tr>
			<td><%=product2.getBrand()%></td>
			<td><%=product2.getName()%></td>
			<td><%=product2.getPrice()%></td>
			<td>
			<%
				String base64 = Base64.encodeBase64String(product2.getImage());
				%> <img src="data:image/jpeg;base64,<%=base64%>" alt="Picture"
				style="width: 200px; height: auto;">
			</td>
			<td><%=product2.getSize()%></td>
			<td><a href="/customer/addtocart?id=<%=product2.getId()%>"><button>Add To Cart</button></a></td>
		</tr>

	<%}%>
</table>
<%
	} else {
	// Handle the case when the list is empty or null
	%>
	<p>No products found.</p>
	<%
	}

	%>

</body>
</html>
