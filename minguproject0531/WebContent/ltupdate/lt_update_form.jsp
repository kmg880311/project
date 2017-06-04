<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "project.dao.LivetubeDao" %>
<% request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="lt" class="project.dto.Lt_list"/>
<jsp:setProperty name="lt" property="*"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />

</head>
<body>


<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%------------------------------------------------------------ --%>

	<div class="col-sm-8 text-left"> 
	 <br>
	 <span style="color: red; font-size: 20pt"> 회원수정하기</span>
	 <br>
<%
	request.setCharacterEncoding("euc-kr");
	String upid = request.getParameter("updateid");
		System.out.println(upid + "회원수정 아이디");
		
	LivetubeDao dao = new LivetubeDao();
	lt = dao.listupdate(upid);
	
	
%>
	<form action="<%= request.getContextPath() %>/ltupdate/lt_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="id" size="20" value="<%= lt.getId() %>" readonly></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="pw" size="20" value="<%= lt.getPw() %>"></td>
<tr>
<tr>
	<td>닉네임</td>
	<td><input type="text" name="nick" size="20" value="<%= lt.getNick() %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="email" size="20" value="<%= lt.getEmail() %>"></td>
<tr>

<tr>
	<td colspan="4"><input type="submit" value="정보수정하기"></td>
</tr>
</table>
</form>

 	</div>	
<%------------------------------------------------------------ --%>
<%@ include file="/module/right.jsp" %>		


</body>
</html>