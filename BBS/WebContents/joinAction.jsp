<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <!-- 페이지 전체의 속성을 정의 -->
<%@ page import="user.UserDAO"%> <!-- 파일 경로,user 패키지의 파일memberDAO를 가져온다. -->
<%@ page import="java.io.PrintWriter"%><!-- 스크립트를 html 안에서 쓰려고.. -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- @페이지 자체의속성을 결정하는 것 , request 그냥은 외부 들어오는 값을 지정해주는 것. -->
<jsp:useBean id="user" class="user.User" scope="page" /> <!--현재 페이지 안에서만 빈즈가 사용될수 있도록 -->
<jsp:setProperty name="user" property="*" /> <!--  값을 입력  -->
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%-- session에 관한 내용 (현재 접속한 회원에게 할당해주는 아이디) --%>
    <%-- 웹 서버는 session으로 한명의 회원을 구분함 --%>
	<% 
		String userID = null; 
		if(session.getAttribute("userID") != null) {
			userID =(String) session.getAttribute("userID");
		}
		
		if(userID !=null){ //이미 로그인 된사람은 또 다시 로그인 할수 없도록
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
	
		}
	    //사용자가 모든 경우에 입력을 안했을때
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null 
		|| user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user);
				if(result == -1) { // userID가 primary key 이기 때문에
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다.')");
					script.println("history.back()");
					script.println("</script>");
			
				}else {
					session.setAttribute("userID", user.getUserID());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
			}

	%>
	
		
</body>
</html>