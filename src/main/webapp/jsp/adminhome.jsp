<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <style>
            body {
                background-image:url("https://images.unsplash.com/photo-1586015555751-63bb77f4322a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGhhcm1hY3l8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60");
                background-repeat: no-repeat;
                background-size: 100% 100vh;
             overflow-x: hidden;
               

            }

*{
margin: 0;
padding: 0;
}

            h1 {
                position: relative;
                left: 17em;
                text-decoration: underline;
            }

            h2 {
                text-align: center;
            }

            .main {
                width: 70em;
                position: relative;
                left: 5em;
            }

            nav {

                /* width: 100%; */
                background-color: white;

            }

            .container {

                display: flex;
                column-gap: 3em;
                position: relative;
                left: 3em;
                top: 1em;
                /* background-color:aquamarine;  */
                width: 50em;
                height: 3em;


            }

            form {
                background-color: white;
                height: 18em;
            }

            .but1 {
                background-color: greenyellow;
                height: 2.5em;
                width: 13em;
                border: 2em;
                border-radius: 0.5em;
                

            }

            .but2 {
                background-color: aqua;
                height: 2.5em;
                width: 13em;
                border: 2em;
                border-radius: 0.5em;
            }

            .but3 {
                background-color: red;
                height: 2.5em;
                width: 13em;
                border: 2em;
                border-radius: 0.5em;
            }
            .demo{
            display:flex;
            }
            .test{
         height: 60px;
         width: 170px;
         border-radius: 16px;
         display: flex;
         justify-content: space-around;
         align-items: center;
         background-color: black;
         color: white;
         font-weight: bold;
         font-size: 20px;
         transition: all 1s linear;
        }
        .test:hover{
            transform: scale(1.2,1.2);
        }
        a{
            text-decoration: none;
            color: white;
            
        }
        </style>
    </head>

    <body>

        <h1 style="color: black;text-decoration: none ;position:relative;left:40vw;">ADMIN</h1>
        <div class="main">
            <nav>
                <div class="container">
                    <div><a href="/admin/home" style="text-decoration: none;font-size: 20px;color: black;">Home</a>
                    </div>
                    <div><a href="/logout" style="text-decoration: none;font-size: 20px;color: black;transition:all 0.2s linear;hover{transform:scale(1.2)}"> Logout</a>
                    </div>

                </div>
            </nav>
            <hr>
            
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
  <br><br><br><br>
            
            
           <div style="display: flex;justify-content:space-around;">
        <div class="test"><a href="/admin/insert" target="_self">Insert product</a></div>
        <div class="test"><a href="/admin/products" target="_self">view All Products</a></div>
        <div class="test"><a href="/admin/update" target="_self">Update product</a></div>
        <div class="test"><a href="/admin/delete" target="_self">Delete product</a></div>

        <div class="test"><a href="/admin/customers" target="_self">View all Customers</a></div>  

    </body>

    </html>