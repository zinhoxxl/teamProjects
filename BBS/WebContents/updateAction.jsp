<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> <!-- 페이지 전체의 속성을 정의 -->
	<%@ page import="bbs.BbsDAO"%> <!-- 파일 경로,user 패키지의 파일memberDAO를 가져온다. -->
	<%@ page import="bbs.Bbs"%>
	<%@ page import="java.io.PrintWriter"%><!-- 스크립트를 html 안에서 쓰려고.. -->
	<% request.setCharacterEncoding("UTF-8"); %> <!-- @페이지 자체의속성을 결정하는 것 , request 그냥은 외부 들어오는 값을 지정해주는 것. -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>JSP 웹 사이트 게시판</title>
</head>
<body>

	<% 
		String userID = null;
		if(session.getAttribute("userID") != null) { //로그인이되있으면 userID 에 넣어줌
			userID =(String) session.getAttribute("userID");
		}
		if(userID ==null){ //로그인 되있을 때 게시글 작성 가능
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
	
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		// 이제 만약 권한이있는 사람이라면 update양식을 정상적으로 수정할수 있게!!! 
		else {
	
			/* 여기서 값이 null이거나 "" 즉 빈칸인게 있는지 걸러주는 로직 */
		if(request.getParameter("bbsTtile" ) == null || request.getParameter("bbsContent") == null
				|| request.getParameter("bbsTtile").equals("") || request.getParameter("bbsContent").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
				BbsDAO bbsDAO = new BbsDAO();   //여기서 글이 정상적으로 수정될수 있도록 
				int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()"); //다시 write 로 빠꾸
					script.println("</script>");
			
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'"); //다시 bbs로 빠꾸
					script.println("</script>");
				}
			}
		
		}
	%>
</body>
</html>