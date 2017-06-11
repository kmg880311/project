<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "project.dao.CommentDao" %>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="ct" class="project.dto.Comment"/>
<jsp:setProperty name="ct" property="*"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String c_id = request.getParameter("c_id");
	String c_live = request.getParameter("c_live");
	String c_ct = request.getParameter("c_ct");
		System.out.println(c_id + "<--아이디");
		System.out.println(c_live + "영상번호");
		System.out.println(c_ct + "댓글내용 ");
	
		
	CommentDao commnet = new CommentDao();
		
	if(!c_id.equals("null")){
			System.out.println(c_id + "    null아닐때");
		//댓글 입력
		commnet.commentinsert(ct);
		
		//영상 댓글 입력후 입력하기 전 댓글 리스트 상태 유지
		ct = commnet.commnetnew(c_live);
			System.out.println(ct.getC_live() + "<----댓글 입력 프로999999999999999");
		response.sendRedirect(request.getContextPath() + "/videowatch/video_watch_form.jsp?live="+ct.getC_live());
		
		
	}else if(c_id.equals("null")){
		System.out.println("댓글쓸때 아이디가 null");
		ct = commnet.commnetnew(c_live);
%>
		<script language="javascript">
				alert("로그인을하세요");
				location.href = "<%= request.getContextPath() %>/videowatch/video_watch_form.jsp?live=<%= ct.getC_live()%>";
				
		</script>
		
<%
	}
%>
</body>
</html>