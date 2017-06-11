<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "project.dao.YgoodDao" %>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="yg" class="project.dto.YgoodDto"/>
<jsp:setProperty name="yg" property="*"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String yg_id = request.getParameter("yg_id");
	String yg_code = request.getParameter("yg_code");
	
		System.out.println(yg_id + "아이디");
		System.out.println(yg_code + "영상");
		
		YgoodDao ygood = new YgoodDao();
			
		if(!yg_id.equals("null")){
				System.out.println(yg_id + "    null아닐때");
			//좋아요 입력
			ygood.goodinsert(yg_code, yg_id);
			
			//좋아요 영상 입력후 입력하기 전 댓글 리스트 상태 유지
			yg = ygood.goodnew(yg_code);
				
			response.sendRedirect(request.getContextPath() + "/videowatch/video_watch_form.jsp?live="+ yg_code);
			
			
		}else if(yg_id.equals("null")){
			System.out.println("댓글쓸때 아이디가 null");
			//ct = commnet.commnetnew(c_live);
	%>
			<script language="javascript">
					alert("로그인을하세요");
					location.href = "<%= request.getContextPath() %>/videowatch/video_watch_form.jsp?live=<%= yg.getYg_code()%>";
					
			</script>
			
	<%
		}
	%>	
		
%>
</body>
</html>