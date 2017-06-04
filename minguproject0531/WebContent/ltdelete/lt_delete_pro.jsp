<%@page import="project.dao.LivetubeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%@ page import = "project.dao.LivetubeDao" %>

<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("deleteid");
		System.out.println(id + "회원가입시 아이디");
		
	LivetubeDao dao = new LivetubeDao();
	dao.listdelete(id);
	
	response.sendRedirect(request.getContextPath() + "/ltdelete/lt_delete_logout_pro.jsp");
%>
</body>
</html>