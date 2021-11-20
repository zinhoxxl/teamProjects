<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> <%-- 인코딩설정 --%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1"> <%-- 반응형웹으로 설정 --%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>JSP 웹 사이트 게시판</title>
</head>

<body>

	<nav class="navbar navbar-default">
	
	    <%-- 로고영역 --%>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
				aria-expanded="false"> <%-- 버튼만들기 --%>
				<span class="icon-bar"></span> <!-- 석삼자의 메뉴 작대기 하나를 담당-->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<%-- brand == 로고 --%>
			<a class ="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트 </a>
		</div>
		<%-- 헤더와 같은 bs-example-navbar-collapse-1 사용 --%>
		<div class ="collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
		    <%-- 리스트 --%>
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>  <%-- 리스트 원소 기입 --%>
			</ul>
			<%-- 우측 네비게이션 --%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href ="#" class ="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
			       	    aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>	
			</ul>
		</div>
		
	</nav>
	
	
	<div class="container">
	
		<div class=	"col-lg-4"></div>
		<div class=	"col-lg-4">
			<div class="jumbotron" style="padding-top :20px;">
				<form method="post"	action="loginAction.jsp">	
					<h3 style="text-align:center;">로그인화면</h3>
					<div class ="form-group">
						<input type="text" class ="form-control" placeholder="아이디" name="userID" maxlength="20">
						<!-- placeholder : 해당 자리가 무엇인지 안내문구, 값이 아니라서 전송이 안됨. value : 현재 양식의 기본 값. 전송이됨.-->
					</div>
				
					<div class ="form-group">	
						<input type="password" class ="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
		
						<input type ="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
		<div class=	"col-lg-4"></div>		
	</div>
	
	<%-- 2강 --%>	
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js"></script>  
	<script src ="js/bootstrap.js"></script>
	
		
</body>
</html>