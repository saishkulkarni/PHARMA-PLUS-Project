<%@page import="com.protech.pharmaplus.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./pro.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

    <style>
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


.container-fluid{
     background-image:url(../image/prbgg.jpg);
     /* background-image: url(../image/1682498717547.jpg);
     background-repeat: no-repeat;
     background-size: cover; */
     height: 500px;
     display: flex;
     justify-content: center;
     align-items: center;
}
.tab{
    border: 2px solid black;
    background-color: white;
    /* background-image: linear-gradient(blue,red,orange,green); */
    /* border-radius: 10px; */
    /* display: flex; */
    /* justify-content: center; */
    padding: 60px;
    width: 100px;
    height: 100px;
    
}
input[id="user"]
{
    border-color: black;
    border-width: 1px;
    border-radius: 3px;
    border-style: solid;

}
input[id="pass"]
{
    border-color: black;
    border-width: 1px;
    border-radius: 3px;
    border-style: solid;
    
}
input[value="Submit"]
{
    border-color: blue;
    border-width: 1px;
    border-radius: 3px;
    color: black;
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

      <div id="parent">
   
</div>

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

        <div class="container-fluid">
            <form action="/admin/login" method="post" >
                <table class="tab" style="height: 300px; width: 300px; border-radius: 10px;" >
                <tr>
                <th>${fail}</th>
                </tr>
                    <tr>
                        <th style="font-size: 20px; font-style:normal;text-align: center;">
                            ADMIN LOGIN
                        </th>
                    </tr>
                    <tr>
                       
                        <td>
                            <input type="text" name="user" id="user" placeholder="Enter email/mobile" style="width: 200px; height: 25px;font-size: 12px;background-color:lightgoldenrodyellow;">
                        </td>
                        
                    </tr>
                    <tr>
                        
                        <td>
                            <input type="password" name="pass" id="pass" placeholder="Password" style="width: 200px; height: 25px;font-size: 12px;">
                        </td>
                        
                    </tr>
                    
                    <tr>
                        <td>
                            <button style="width: 50px; height: 30px; font-size: 18px; background-color: orange;border-style: none;width: 200px;border-radius: 2px;">Login</button>
                        </td>
                       
                    </tr>
                
            </table>
            </form>
        </div> 
        
        
</body>
</html>