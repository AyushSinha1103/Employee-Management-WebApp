<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
    @import url('https://fonts.googleapis.com/css?family=Open+Sans');

* {
  box-sizing: border-box;
}

body {
  	color: #222222;
  	font-family: 'Open Sans', sans-serif;
  	padding-bottom: 50px;
  	
}
div{
	margin-left : 5em;
}
	
.container {
  	margin: 0 auto;
  	max-width: 1200px;
}

.nav {
  	background-color: #222222;
  	left: 0;
  	position: fixed;
  	right: 0;
  	top: 0;
  	transition: all 0.3s ease-in-out;
}

.nav .container {
  	align-items: center;
  	display: flex;
  	justify-content: space-between;
  	padding: 20px 0;
  	transition: all 0.3s ease-in-out;
}

.nav ul {
  	align-items: center;
  	display: flex;
  	justify-content: center;
  	list-style-type: none;
}

.nav a {
  	color: #FFFFFF;
  	padding: 7px 15px;
  	text-decoration: none;
  	transition: all 0.3s ease-in-out;
}

.nav.active {
  	background-color: #FFFFFF;
  	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
}

.nav.active a {
  	color: #000000;
}

.nav.active .container {
  padding: 10px 0;
}

.nav a.current,
.nav a:hover {
  color: #c0392b;
  font-weight: bold;
}

.hero {
  	align-items: center;
  	background-image: url('https://images.pexels.com/photos/450035/pexels-photo-450035.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260');
  	background-position: bottom center;
  	background-repeat: no-repeat;
  	background-size: cover;
  	color: #FFFFFF;
  	display: flex;
  	height: 100vh;
  	justify-content: center;
  	margin-bottom: 20px;
  	position: relative;
  	text-align: center;
 	z-index: -2;
}

.hero::before {
  	background-color: rgba(0, 0, 0, 0.5);
  	content: '';
  	height: 100%;
  	left: 0;
  	position: absolute;
  	top: 0;
  	width: 100%;
  	z-index: -1;
}

.hero h1 {
  	font-size: 46px;
  	margin: -20px 0 20px;
}

.hero p {
  	font-size: 20px;
  	letter-spacing: 1px;
}

.content h2,
.content h3 {
  	font-size: 150%;
  	margin: 20px 0;
}

.content p {
  	color: #555555;
  	letter-spacing: 1.2px;
  	line-height: 30px;
}
    body {
  width: 100%;
  height: 100vh;
  margin: 0;
  background-color: #1b1b32;
  color: #f5f6f7;
  font-family: Tahoma;
  font-size: 16px;
}

h1, p {
  margin: 1em auto;
  text-align: center;
}

form :not(#v){
  width: 60vw;
  max-width: 500px;
  min-width: 300px;
  padding-bottom: 2em;
}

fieldset {
  border: none;
  padding: 2rem 0;
  border-bottom: 3px solid #3b3b4f;
}

fieldset:last-of-type {
  border-bottom: none;
}

label {
  display: block;
  margin: 0.5rem 0;
}

input,
textarea,
select {
  margin: 10px 0 0 0;
  width: 100%;
  min-height: 2em;
}

input, textarea {
  background-color: #0a0a23;
  border: 1px solid #0a0a23;
  color: #ffffff;
}

.inline {
  width: unset;
  margin: 0 0.5em 0 0;
  vertical-align: middle;
}

input[type="submit"] {
  display: block;
  width: 60%;
  height: 2em;
  font-size: 1.1rem;
  background-color: #3b3b4f;
  border-color: white;
  min-width: 300px;
}
input[type="button"] {
  display: block;
  width: 60%;
  margin: 1em auto;
  height: 2em;
  font-size: 1.1rem;
  background-color: #3b3b4f;
  border-color: white;
  min-width: 300px;
}

input[type="file"] {
  padding: 1px 2px;
}

a :not(#v){
  color: #dfdfe2
}
    
    </style>
    <script type="text/javascript">
    const nav = document.querySelector('.nav')
    window.addEventListener('scroll', fixNav)

    function fixNav() {
        if(window.scrollY > nav.offsetHeight + 150) {
            nav.classList.add('active')
        } else {
            nav.classList.remove('active')
        }
    }
    </script>
</head>
<body>
  <%	
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>

  <nav class="nav">
	<div class="container">
		<h1 class="logo"><a href="/index.html">Admin Dashboard</a></h1>
		<ul>
			<li><a href="homepage.html" class="current">Home</a></li>
			<li><form action = "Logout"><input id = "v" type = "submit" value ="Logout" style ="background-color: #222222"></form></li>
		</ul>
	</div>
</nav>
    <h1>Registration Form</h1>
    <p style = "color : #1b1b32">Please fill out this form with the required information</p>
    <div>
    <form>
      <fieldset>
        <label for="add"><h3>Register new Employee</h3></label> <a href = "registration.jsp"><input id="add" type="button" value ="Register" required /></a>
      </fieldset>
      </form>
            <hr>
      <form>
      <fieldset>
        <label for="display"><h3>Display Employee Record</h3></label><a href = "EmployeeDetails.jsp"><input id="display" type="button" value ="Display" required /></a>
      </fieldset>
      </form>
            <hr>
      <fieldset>
      
        <label><h3>Delete Employee</h3>
         <form action = "delemp">
  			<label for="del">Enter employee id :</label>
  			<input id = "del" type = "text" name = "eid"  required/>
  			<br><br>
  			<input type = "submit" value = "Remove"/>
  		</form>
  		</label>
      </fieldset>

      <fieldset>
        <label><h3>Update Employee</h3>
         <form action = "updemp">
  			<label>Enter employee id : </label>
  			<input type = "text" name = "eid"  required/>
  			<br>
  			<br>
  			<label>Enter new salary :</label>
  			<input type = "number" name = "sal" required/>
  			<br>
  			<br>
  			<input type = "submit" value = "Update"/>
  		</form>
  		</label>
  		</fieldset>
  	</div>
  </body>
</html>