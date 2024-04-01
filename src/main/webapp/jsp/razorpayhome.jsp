<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
text-align: center;
position :relative;
top:290px;
}
button{
        height: 30px;
        width: 100px;
        font-weight: bold;
        border-radius: 5px;
        box-shadow: 2px 2px 5px black;
        transition: all 1s linear;

    }
    button:hover{
        transform: scale(1.2,1.2);
    }
</style>
</head>
<body>
	<button id="rzp-button1" style="width: 3.5%;height: 125%;position: relative;font-weight: 700;border-radius: 5px;"><a href="/" style="text-decoration: none;">Pay</button>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script>
		var options = {
			"key" : "${order.getKey()}", // Enter the Key ID generated from the Dashboard
			"amount" : "${order.getAmount()}", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
			"currency" : "INR",
			"name" : "PHARMA+", //your business name
			"description" : "Test Transaction",
			"image" : "https://example.com/your_logo",
			"order_id" : "${order.getOrderid()}", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
			"callback_url" : "/customer/paymentsuccess",
			"prefill" : { //We recommend using the prefill parameter to auto-fill customer's contact information especially their phone number
				"name" : "${customer.getFname()}", //your customer's name
				"email" : "${customer.getEmail()}",
				"contact" : "+91${customer.getMno()}" //Provide the customer's phone number for better conversion rates 
			},
			"notes" : {
				"address" : "Razorpay Corporate Office"
			},
			"theme" : {
				"color" : "#3399cc"
			}
		};
		var rzp1 = new Razorpay(options);
		document.getElementById('rzp-button1').onclick = function(e) {
			rzp1.open();
			e.preventDefault();
		}
	</script>
</body>
</html>