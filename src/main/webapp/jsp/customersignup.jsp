<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.protech.pharmaplus.dto.Customer"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link rel="stylesheet" href="../css/signup.css"> -->
    <style>
    * {
	padding: 0;
	margin: 0;
}

    form{
        border: 2px solid;
        /* position: relative;
        left: 27em;
        top: 5em; */
        width: 25em;
        height: 32em;
        /* display: flex;
        justify-content: center;
        align-items: center; */
        border-radius: 1em;
        background-color: #ffffff;

    }
    .header{
        height: 2em;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
        top: -10px;
        border-radius: 10px;
    
        
        /* text-align: center;
        border-top-right-radius: 0.5em;
        border-top-left-radius: 0.5em; */
        
    }

    .td1{
        text-align: right;
        position: relative;
        /* left: -1em; */
    }

    .cancel{
        background-color: red;
         position: relative; 
         left: -4em; top: 1em;
          border: white; height: 2em;
          width: 7em; border-radius: 1em;
          
    }

    .reg{
        position: relative;
         left: 1em;
            background-color:cornflowerblue;
           border: white;
            height: 2em; width: 7em; 
            top: 1em;
             border-radius: 1em;
    }
    .bodycentre{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 600px;
      
        
    }
     input{
            background-color: #FBFFDC;
        }
    
    body{
	background-image: url("https://images.pexels.com/photos/3850681/pexels-photo-3850681.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    background-repeat: no-repeat;
	background-size: 100% 100vh;
}
::placeholder{
	position: relative;
	left: 5px;
	color: black;
	font-weight: 400;
}
    </style>
</head>
<body>
      
${fail}
     <div class="bodycentre">
    <form action="/customer/signup" method="post" style="background-image: linear-gradient(to bottom right,white,rgb(60, 59, 59))">
    
        <h1 class="header" style="color: black;position:relative;top:10px;">SignUp</h1>
        <table cellspacing="23em">
       
            <tr>
                <td class="td1"><label for="name"><strong>First Name :</strong></label></td>
                <td><input type="text" name="fname" id="name" required pattern="[A-Za-z]{3,32}" placeholder="First Name"></td>
            </tr>
            <tr>
                <td class="td1"><label for="lname"><strong>Last Name :</strong></label></td>
                <td><input type="text" name="lname" id="lname" required pattern="[A-Za-z]{1,32}" placeholder="Last Name"></td>
                
            </tr>
            <tr>
                <td class="td1"><label for="mno"><strong>Mobile No :</strong></label></td>
                <td><input type="text" name="mno" id="mno" required size="20" pattern="[0-9]{10}" placeholder="Mob No"></td>
           
            </tr>
            <tr>
                <td class="td1"><label for="email"><strong> Email-Id :</strong></label></td>
                <td><input type="email" name="email" id="email" placeholder="Email id" required></td>
            </tr>
            <tr>
                <td class="td1"><label for="pwd"><strong>Password :</strong></label></td>
                <td><input type="password" name="pwd" id="pwd" placeholder="Password" required></td>
            </tr>
            <tr>
                <td class="td1"><label for="address"><strong> Address :
                     </strong></label></td>
                <td><input type="text" name="address" id="address" placeholder="Address" required></td>
            </tr>
            
            
            <tr>
                <td><button class="reg" ><strong><a href="/" style="text-decoration: none; color: white;">Home</strong></a></button>
                </td>
                <td><button class="reg"><style="text-decoration: none;color: white;"><strong>Register</strong></button>
                </td>
                <!-- <a href="" >Forgot pasword?</a> -->
                <td><button class="cancel"><strong><a href="" style="text-decoration: none;color: white;">Cancel</a></strong></button>
               <!--   <a href="" style="position: relative; top: 3em; left: -1em; text-decoration: none;font-size: 15px;color: black;">help?</a>--></td>
            </tr>
        </table>
       <!--  <button style="width: 9%;height: 6%;font-weight: 700;position: relative; bottom: 388px;left:0.2em;;border-radius: 5px;" title="Back"><a href="/" style="text-decoration: none;"><---</a></button> -->
    </form>
</div>
</body>
</html>