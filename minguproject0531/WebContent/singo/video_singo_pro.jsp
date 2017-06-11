<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "project.dao.YsingoDao" %>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="ys" class="project.dto.YsingoDto"/>
<jsp:setProperty name="ys" property="*"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String ys_id = request.getParameter("ys_id");
	String ys_code = request.getParameter("ys_code");
	
		System.out.println(ys_id + "아이디");
		System.out.println(ys_code + "영상");
		
		YsingoDao ysingo = new YsingoDao();
			
		if(!ys_id.equals("null")){
				System.out.println(ys_id + "    null아닐때");
			//좋아요 입력
			ysingo.singoinsert(ys_code, ys_id);
			
			//좋아요 영상 입력후 입력하기 전 댓글 리스트 상태 유지
			ys = ysingo.singonew(ys_code);
				
			response.sendRedirect(request.getContextPath() + "/videowatch/video_watch_form.jsp?live="+ ys_code);
			
			
		}else if(ys_id.equals("null")){
			System.out.println("댓글쓸때 아이디가 null");
			//ct = commnet.commnetnew(c_live);
	%>
			<script language="javascript">
					alert("로그인을하세요");
					location.href = "<%= request.getContextPath() %>/videowatch/video_watch_form.jsp?live=<%= ys.getYs_code()%>";
					
			</script>
			
	<%
		}
	%>	
		
%>
</body>
</html>