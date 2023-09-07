<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "java";
String userid = "root";
String password = "ayush";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<!-- CSS only -->
<head>
<title>Employee Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css?family=Open+Sans');

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  
}

body {
  	color: #222222;
  	font-family: 'Open Sans', sans-serif;
  	padding-bottom: 50px;
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
</style>
<script>
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

<body style="padding: 30px">
<%	
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>

<!-- <h1>Employee Details</h1><br><br> -->
<nav class="nav">
	<div class="container">
		<h1 class="logo"><a href="#">Employee Details</a></h1>
		<ul>
			<li><a href="homepage.html" class="current">Home</a></li>
			<li><a href="Dashboard.jsp">Dashboard</a></li>
			<li><form action = "Logout"><input type = "submit" value ="Logout"></form></li>
		</ul>
	</div>
</nav>

<br>
<br>
<br>
<table class="table">
  <thead class="thead-dark">
<tr>
<th>ID</th>
<th>Name</th>
<th>Salary</th>
<th>DOB</th>
<th>Address</th>
<th>Designation</th>
<th>Phone</th>
<th>Gender</th>
<th>Supervisor ID</th>
</tr>

</thead>


<tbody>
<%
try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	String query ="select * from employee";
	resultSet = statement.executeQuery(query);
	while(resultSet.next()){
%>
<tr>
<th scope="row"><%=resultSet.getString("empid") %></th>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("salary") %></td>
<td><%=resultSet.getString("dob") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("desgn") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("supid") %></td>

</tr>

</tbody>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table> 

</body>


<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</html>