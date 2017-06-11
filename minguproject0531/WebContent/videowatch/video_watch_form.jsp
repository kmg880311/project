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
	

 <%--조회수 쿼리  UPDATE 게시판 SET 조회수=조회수+1 WHERE 게시물key=게시물key --%>



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
		
		// 클릭한 영상 리스트
		videoDao dao = new videoDao();
		video vi = dao.watchvideo(live);
			System.out.println(vi.getY_code() + "해당영상보는 주소-----------------------------");
		
		
		// 영상 댓글
		CommentDao dao2 = new CommentDao();
		ArrayList<Comment> ct = dao2.commentlist(live);
			System.out.println(ct + "-----어레이리스트 댓글");
			
		//좋아요 갯수
		YgoodDao ygood = new YgoodDao();
		YgoodDto yg = ygood.goodnum(live);
		
		//신고 갯수
		YsingoDao ysingo = new YsingoDao();
		YsingoDto ys = ysingo.singonum(live);
		
%>
	<%---영상화면 --%>
		<br><br>
	<table class="table">
	    <thead>
	      <tr>
	        <th>제목 : <%= vi.getY_title() %></th>
	        <th>가수 : <%= vi.getY_name() %></th>
	       
	      </tr>
	    </thead>
    </table>
		
		<iframe name="video" height="409" width="726" frameborder="0" src="https://www.youtube.com/embed/<%= vi.getY_code() %>?amp;version=3&amp;hd=1&amp;modestbranding=1&amp;rel=0&amp;showinfo=0&amp;fs=1" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>

	<table class="table">
	    <tbody>
	      <tr>
	   	 	 <td>닉네임 : <%= vi.getNick() %></td>
	      	 <td>내용 : <%= vi.getY_comment() %></td>
	     	 <td>영상등록시간 :  <%= vi.getY_data() %></td>
	       </tr>
		 </tbody>
	    
    </table>
	<table class="table">
		 <tbody>
	    	  <tr>
		        <th>카테고리 : <%= vi.getY_style() %></th>
		        <th>나라 : <%= vi.getY_ct() %></th>
		        <th>장르  :<%= vi.getY_cu() %></th>
	       </tr> 
		  </tbody>
	 </table>
	
		<table class="table">
		 <tbody>
	    	  <tr>
		        <th>조회수 : <%= vi.getY_cl() %></th>
		
	       </tr> 
		  </tbody>
		 </table>
  
  <%-- 좋아요 버튼 --%>
	  	 <div class="btn-group">
		   	<form action="<%= request.getContextPath() %>/good/video_good_pro.jsp" method="post">
				<table border="1">
					<tr>
						
						<td><input type="hidden" name="yg_id" size="50" value="<%= SID3 %>"></td>
					<tr>
					<tr>
						
						<td><input type="hidden" name="yg_code" size="50" value="<%= vi.getLive() %>"></td>
					<tr>
					
					<tr>
						<td colspan="4"><input type="submit" value="좋아요버튼 <%= yg.getYgood() %>"></td>
					</tr>
				</table>
			</form>
		  
		  </div>
	
	<%-- 싫어요 버튼 --%>
	  	 <div class="btn-group">
		   	<form action="<%= request.getContextPath() %>/singo/video_singo_pro.jsp" method="post">
				<table border="1">
					<tr>
						
						<td><input type="hidden" name="ys_id" size="50" value="<%= SID3 %>"></td>
					<tr>
					<tr>
						
						<td><input type="hidden" name="ys_code" size="50" value="<%= vi.getLive() %>"></td>
					<tr>
					
					<tr>
						<td colspan="4"><input type="submit" value="싫어요버튼 <%= ys.getYsingo() %>"></td>
					</tr>
				</table>
			</form>
		  
		  </div>
			
	
	
	
	
	<%---댓글입력 --%>
		<br>
		 <span style="color: red; font-size: 20pt">댓글달기</span>
		 <br>
		<form action="<%= request.getContextPath() %>/ltcomment/commnet_insert_pro.jsp" method="post">
			<table border="1">
				<tr>
					
					<td><input type="hidden" name="c_id" size="50" value="<%= SID3 %>"></td>
				<tr>
				<tr>
					
					<td><input type="hidden" name="c_live" size="50" value="<%= vi.getLive() %>"></td>
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
				<td><%= a.getNick() %> / 댓글달린시간 <%= a.getC_data() %> 
				/ 좋아요 <%=a.getC_good() %> 
		 <%-- 댓글좋아요 버튼 --%>
	  	 <div class="btn-group">
		   	<form action="<%= request.getContextPath() %>/good/comment_good_pro.jsp" method="post">
				<table border="1">
					<tr>
						
						<td><input type="hidden" name="cg_id" size="50" value="<%= SID3 %>"></td>
					<tr>
					<tr>
					<tr>
						
						<td><input type="hidden" name="y_code" size="50" value="<%= vi.getLive() %>"></td>
					<tr>	
						<td><input type="hidden" name="cg_code" size="50" value="<%= a.getComment() %>"></td>
					<tr>
					
					<tr>
						<td colspan="4"><input type="submit" value="좋아요버튼 <%= a.getC_good() %>"></td>
					</tr>
				</table>
			</form>
		  
		  </div>
				/ 신고 <%= a.getC_sin() %><br>
				
				 댓글 : <%= a.getC_ct() %> 
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