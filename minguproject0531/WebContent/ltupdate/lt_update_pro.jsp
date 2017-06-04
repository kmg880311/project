<%@page import="project.dao.LivetubeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import = "project.dao.LivetubeDao" %>


<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="lt" class="project.dto.Lt_list"/>
<jsp:setProperty name="lt" property="*"/>


<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
		System.out.println(id + "회원수정 pro");
		
	LivetubeDao dao = new LivetubeDao();
	dao.listupdatepro(lt);
	
	
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
