<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String SID3 = (String)session.getAttribute("SID");
System.out.println(SID3 + "<-- 로그인되어있는 아이디");
%>  

<%@ page import = "project.dao.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "project.dto.*" %>

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
		<%-------------------------------------------------------------------------------------------------------------------------------------- --%>	
	
<%
		request.setCharacterEncoding("utf-8");
		String live = request.getParameter("live");
			System.out.println(live);
		
		videoDao dao = new videoDao();
		video vi = dao.watchvideo(live);
			System.out.println(vi.getY_code() + "해당영상보는 주소-----------------------------");
		
		
			
		CommentDao dao2 = new CommentDao();
		ArrayList<Comment> ct = dao2.commentlist(live);
			System.out.println(ct + "-----어레이리스트 댓글");

%>
	<%---영상화면 --%>
		<br><br>
		<iframe height="409" width="726" frameborder="0" src="https://www.youtube.com/embed/78Ygna03Pj8?amp;version=3&amp;hd=1&amp;modestbranding=1&amp;rel=0&amp;showinfo=0&amp;fs=1" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>
		
		
	<%---댓글입력 --%>
		<br>
		 <span style="color: red; font-size: 20pt">댓글달기</span>
		 <br>
		<form action="<%= request.getContextPath() %>/ltcomment/commnet_insert_pro.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="c_id" size="50" value="<%= SID3 %>"></td>
				<tr>
				<tr>
					<td>영상넘버</td>
					<td><input type="text" name="c_live" size="50" value="<%= vi.getLive() %>"></td>
				<tr>
				<tr>
					<td>댓글내용</td>
					<td><input type="text" name="c_ct" size="100"></td>
				<tr>
						
				<tr>
					<td colspan="4"><input type="submit" value="댓글입력"></td>
				</tr>
			</table>
		</form>
		
	<%---댓글리스트 --%>	
<% 		
		for(Comment a : ct){
%>
	<table  border="1">
		
			<tr>
				<td><%= a.getC_id() %> 아이디인데 닉네임으로 바꾸자 >> 댓글 : <%= a.getC_ct() %>  / 댓글달린시간 <%= a.getC_data() %> / 좋아요 <%=a.getC_good() %> / 신고 <%= a.getC_sin() %>
				<a href="<%= request.getContextPath() %>/ltdelete/lt_delete_pro.jsp?deleteid=<%= a.getComment()%>">댓글삭제</a></td>
			</tr>
		
	</table>
<%
	}
%>
		<%-------------------------------------------------------------------------------------------------------------------------------------- --%>					
 	</div>	
<%------------------------------------------------------------ --%>
<%@ include file="/module/right.jsp" %>		


</body>
</html>