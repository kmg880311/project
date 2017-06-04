<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "project.dao.LivetubeDao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "project.dto.Lt_list" %>

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
	 <span style="color: red; font-size: 20pt"> 회원 리스트</span>
	 <br>
	 <table border="2">
	 	<thead>
	 		<tr>
	 			<th>아이디</th><th>비번</th><th>닉네임</th><th>이메일</th><th>가입날짜</th><th>회원수정</th><th>회원강퇴</th>
	 		</tr>
	 	</thead>
<%
	LivetubeDao dao = new LivetubeDao();
	ArrayList<Lt_list> list = dao.Alllist();
	
	for(Lt_list a : list){
%>
		<tbody>
			<tr>
				<td><%= a.getId() %></td>
				<td><%= a.getPw() %></td>
				<td><%= a.getNick() %></td>
				<td><%= a.getEmail() %></td>
				<td><%= a.getData() %></td>
				<td><a href="<%= request.getContextPath() %>/ltupdate/lt_update_form.jsp?updateid=<%= a.getId()%>">회원수정</a>
				<td><a href="<%= request.getContextPath() %>/ltdelete/lt_delete_pro.jsp?deleteid=<%= a.getId()%>">회원강퇴</a>
			</tr>
		</tbody>
<%
	}
%>
		</table>
 	</div>	
<%------------------------------------------------------------ --%>
<%@ include file="/module/right.jsp" %>		


</body>
</html>