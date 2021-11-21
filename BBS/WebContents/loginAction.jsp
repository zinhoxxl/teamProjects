
<%-- 

<% %>   스크립틀릿 : 여러줄의 자바코드를 삽입할 수 있어요. _jspService()
<%!  %> 선언문  : JSP 서블릿에 인스턴스 변수나 메소드, 클래스변수나 메소드를 선언
주석 : <%=    %> 표현식(expression) : out.print(" 이부분에 들어갈 문자열이나 값");

페이지 지시자
<%@ contentType="text/html; charset="euc-kr" %>
<%@ page import="java.util.Math, java.net.URL" %>
<%@ include file="example.jsp" %>
      ---> 요것만.이것을 꼭 문서 머리부분에서 해야하는건 아님      

--%>
	
	
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <!-- 페이지 전체의 속성을 정의 -->
<%@ page import="user.UserDAO"%> <!-- 파일 경로,user 패키지의 파일memberDAO를 가져온다. -->
<%@ page import="java.io.PrintWriter"%><!-- 스크립트를 html 안에서 쓰려고.. -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- @페이지 자체의속성을 결정하는 것 , request 그냥은 외부 들어오는 값을 지정해주는 것. -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" /> <!--  값을 입력  -->
<jsp:setProperty name="user" property="userPassword" />
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
     <%
        String userID = null;
	    if(session.getAttribute("userID")!= null) {
	    	userID = (String) session.getAttribute("userID");  
	     }
	    if(userID != null) {
	    	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('이미 로그인 되어있습니다.')");
        	script.println("location.href = 'main.jsp'");
        	script.println("</script>");
	    }
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserID(), user.getUserPassword());
        if (result == 1) {
        	session.setAttribute("userID", user.getUserID()); /* 7장 시작 */
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("location.href = 'main.jsp'");
        	script.println("</script>");
        } 
        else if (result == 0) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('비밀번호가 틀립니다.')");
        	script.println("history.back()");  // history.back() 이전페이지로 돌아감
        	script.println("</script>");
        }
        else if (result == -1) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('존재하지 않는 아이디입니다.')");  
        	script.println("history.back()");
        	script.println("</script>");
        }
        else if (result == -2) {
        	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('데이터베이스 오류가 발생했습니다.')");
        	script.println("history.back()");
        	script.println("</script>");
        }
     %>
</body>
</html>