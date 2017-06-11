<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "project.dao.CgoodDao" %>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="cg" class="project.dto.CgoodDto"/>
<jsp:setProperty name="cg" property="*"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String cg_id = request.getParameter("cg_id");
	String cg_code = request.getParameter("cg_code");
	String y_code = request.getParameter("y_code");
		System.out.println(y_code + " vvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
		System.out.println(cg_id + " 댓글 좋아요 클릭시 아이디");
		System.out.println(cg_code + "댓글 좋아요 클릭시 댓글코드");
		
		CgoodDao cgood = new CgoodDao();
			
		if(!cg_id.equals("null")){
				System.out.println(cg_id + "    null아닐때");
			//댓글 좋아요 입력
			cgood.commentgoodinsert(cg_code, cg_id);
			
			//댓글 좋아요 영상 입력후 입력하기 전 댓글 리스트 상태 유지
			cg = cgood.commnetgoodnew(cg_code);
				
			response.sendRedirect(request.getContextPath() + "/videowatch/video_watch_form.jsp?live="+ y_code);
			
			
		}else if(cg_id.equals("null")){
			System.out.println("댓글쓸때 아이디가 null");
			//cg = cgood.commnetgoodnew(cg_code);
	%>
			<script language="javascript">
					alert("로그인을하세요");
					location.href = "<%= request.getContextPath() %>/videowatch/video_watch_form.jsp?live=<%= cg.getY_code()%>";
					
			</script>
			
	<%
		}
	%>	
		
%>
</body>
</html>