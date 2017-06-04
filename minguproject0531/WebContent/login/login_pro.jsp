<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="project.dao.LivetubeDao" %>
<%@ page import="project.dto.Lt_list" %>


<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
		System.out.println(id + "로그인 아이디");
		
		
		LivetubeDao login = new LivetubeDao();
		int a = login.livetubeLogin(id, pw);

		if(a == 1){
			Lt_list lt = login.Ltsession(id);
			System.out.println("03로그인성공");
			
			session.setAttribute("S_NICK", lt.getNick());
			session.setAttribute("SID", id);
			
			
		response.sendRedirect(request.getContextPath() +"/index.jsp");
	%>
	<script language="javascript">
		alert("로그인성공");
		location.href = "<%= request.getContextPath() %>/index.jsp";
	</script>
	<%			
		}else if(a == 2){
	%>
	<script language="javascript">
		alert("비번불일치");
		location.href = "<%= request.getContextPath() %>/index.jsp";
	</script>
	<%			
			
		}else{
	%>
	<script language="javascript">
		alert("아이디불일치");
		location.href = "<%= request.getContextPath() %>/index.jsp";
	</script>
	<%		
		}
	%>
