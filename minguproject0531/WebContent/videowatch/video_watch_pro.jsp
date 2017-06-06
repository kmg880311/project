<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "project.dao.videoDao" %>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="vo" class="project.dto.video"/>
<jsp:setProperty name="vo" property="*"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String y_id = request.getParameter("y_id");
	String y_style = request.getParameter("y_style");
	String y_ct = request.getParameter("y_ct");
		System.out.println(y_id + "아이디");
		System.out.println(y_style + "카테고리");
		System.out.println(y_ct + "나라 ");


	videoDao video = new videoDao();
	video.videoinsert(vo);
		
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>

</body>
</html>