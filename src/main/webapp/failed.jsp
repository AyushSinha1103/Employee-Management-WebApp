<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
  	<title>Failed</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
  </head>
    <style>
      body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
        h1 {
          color: red;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-size:20px;
          margin: 0;
        }
      i {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
    </style>
    <body>
    <%	
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>
      <div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <img style = " margin-top : 25px; height: 150px; width: 150px;" src = "https://static.vecteezy.com/system/resources/previews/004/223/162/non_2x/dirty-grunge-hand-drawn-with-brush-strokes-cross-x-illustration-isolated-on-white-background-mark-graphic-design-check-mark-symbol-no-button-for-vote-in-check-box-web-etc-free-vector.jpg">
      </div>
        <h1>Failed</h1> 
        <p>Database Updation Failed<br/><div class="top_link"><a href="Dashboard.jsp"><img src="https://drive.google.com/u/0/uc?id=16U__U5dJdaTfNGobB_OpwAJ73vM50rPV&export=download" alt="">Return to Dashboard</a></div></p>
      </div>
    </body>
</html>