<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> <!-- 페이지 전체의 속성을 정의 -->
	<%@ page import="bbs.BbsDAO"%> <!-- 파일 경로,user 패키지의 파일memberDAO를 가져온다. -->
	<%@ page import="java.io.PrintWriter"%><!-- 스크립트를 html 안에서 쓰려고.. -->
	<% request.setCharacterEncoding("UTF-8"); %> <!-- @페이지 자체의속성을 결정하는 것 , request 그냥은 외부 들어오는 값을 지정해주는 것. -->
	
	<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> <!-- beens 를 객체를 연결한다고 보면 됨. -->
	<!-- Bean : User user = new User(); -->
	<jsp:setProperty name="bbs" property="bbsTitle" /> 
	<jsp:setProperty name="bbs" property="bbsContent" />

	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>JSP 웹 사이트 게시판</title>
</head>
<body>

	<% 
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID =(String) session.getAttribute("userID");
		}
		if(userID ==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
	
		}else {
	
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패 했습니다.')");
					script.println("history.back()");
					script.println("</script>");
			
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
			}
		
		}

	%>
	
		
</body>
</html>