<%@page import="project.dao.LivetubeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import = "project.dao.LivetubeDao" %>


<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="lt" class="project.dto.Lt_list"/>
<jsp:setProperty name="lt" property="*"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
		System.out.println(id + "회원가입시 아이디");
		
	LivetubeDao dao = new LivetubeDao();
	dao.listinsert(lt);
	
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
</body>
</html>