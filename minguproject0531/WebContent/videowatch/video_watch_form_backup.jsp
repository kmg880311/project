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
			System.out.println(vi.getY_code() + "해당영상보는 주소");

%>
	<%---영상화면 --%>
		<br><br>
		<iframe height="409" width="726" frameborder="0" src="https://www.youtube.com/embed/78Ygna03Pj8?autoplay=1&amp;version=3&amp;hd=1&amp;modestbranding=1&amp;rel=0&amp;showinfo=0&amp;fs=1" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>
		
		
	<%---댓글 --%>
		<div id="comment_5934d76c1d295a79318b4568" cid="5934d76c1d295a79318b4568" isshow="1" style="vertical-align: middle; border-top: 1px dotted rgb(183, 209, 242); display: block;">
			
			<br>내용: <input name="comm" class="comment_memo ui-widget-content ui-corner-all" style="width:480px;"> &nbsp; <input name="id" type="hidden" value="5934d76c1d295a79318b4568">
			<span class="do_comment ui-widget-content ui-corner-all" style="cursor:pointer; padding:3px">&nbsp; √ &nbsp;</span><span class="error" style="color:red;"></span>
			<br><span style="color:red;">※ 추천유도!, 비방성 댓글, 허위사실, 비속어 등은 자제해 주세요.</span></div>
			
			<div id="cc_5934d76c1d295a79318b4568" style="margin-left:80px;">
			<div style="border:1px solid blue; padding-right:6px;"><div>
			<div style="position:relative; color:#77D; font-size:9pt; width:100%; background:#F0F0F0; padding:2px; border-top:1px solid #AAA; border-bottom:1px dotted #CCC;">
			
			<%---댓글닉네임 --%>적어도 <span style="color:#AAA; font-size:11px;">
							
			<%---댓글 달린 시간 --%>6시간  전</span> 
			<%---댓글 좋아요	 --%>&nbsp; <div style="filter:alpha(opacity=70); opacity:0.7; color:#E5E5E5; position:absolute; top:3px; right:0px;">
							<a cid="593504771d295a8b458b4569" class="sbtn small" gc="19" style="cursor:default;">
							<span style="cursor:default; color:#3333CC;">추천 19</span></a> 
							
			<%---댓글 신고로 만들자--%><a cid="593504771d295a8b458b4569" gcid="#gc_593504771d295a8b458b4569" class="sbtn small btn_go_gc" gc="19">
							<span style="color:#3333CC;">이동</span></a> </div></div>
							
			<%---댓글 내용--%><div style="padding:5px 0px 10px 5px; word-break:break-all;">
							공부하면 너처럼 마냥세상탓하면서 암것도안하는애들보단 잘되겟지 ?
							</div></div><div>
							
		<%-------------------------------------------------------------------------------------------------------------------------------------- --%>					
 	</div>	
<%------------------------------------------------------------ --%>
<%@ include file="/module/right.jsp" %>		


</body>
</html>