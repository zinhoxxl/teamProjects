<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP 웹 사이트 게시판</title>
</head>

<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
		} //로그인 할때 입력한 거 여기에
	%>
	<nav class="navbar navbar-default">
	
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <!-- 석삼자의 메뉴 작대기 하나를 담당-->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class ="navbar-brand" href="main.jsp"> 게시판 웹 사이트 </a>
		</div>
		
		<div class ="collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class ="active"><a href="main.jsp">메인</a></li> 
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			
			<% 
				if(userID == null){ //로그인 안되어있지 않을 때
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href ="#" class ="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
			       	    aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>	
			</ul>
			<%
				}else { //로그인 되있을때
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href ="#" class ="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
			       	    aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>	
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src ="js/bootstrap.js"></script>
</body>
</html>