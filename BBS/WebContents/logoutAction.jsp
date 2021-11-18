<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <!-- 페이지 전체의 속성을 정의 -->
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
   <%
      session.invalidate(); //간단하게 말해서 현재 세션을 제거! (로그아웃)
   %>
   <script>
      location.href = 'main.jsp';
   </script>
</body>
</html> 