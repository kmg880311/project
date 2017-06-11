<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "project.dao.videoDao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "project.dto.video" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
 <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
  
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
			
			$(document).ready(function(){
				$('#videotoggle').css('display','none');
				$('button').click(function(){
					$('#videotoggle').toggle();
					
				});
				
				$('#aaa').css('display','none');
				$('button').click(function(){
					$('#aaa').toggle();
				});
				
				
			});
	</script>
  
  
</head>
<body>
<div class="col-sm-8 text-left"> 
    <%---카테고리 버튼 --%><br>
    <button type="button" class="btn btn-primary btn-xs">카테고리</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >신남</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >슬픔</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >감동</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >엽기</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >평화</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >희망</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >애절</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >동심</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >쓸쓸</button>
     <%---나라 버튼 --%>
     <br>
      <br>
    <button type="button" class="btn btn-primary btn-xs">나 라</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >한국</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >미국</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >일본</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >중국</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >영국</button>
    <button type="button" class="btn btn-primary btn-xs"  onclick="location.href='login/login_form.jsp'" >기타</button>
    
      <%---기간 검색 버튼 --%>
    <br>
    <br>
    <form action="<%= request.getContextPath() %>/goodssearch/gm_list_seller_gigan.jsp" method="post">
	<td><input type="date" name="day" > ~ </td> 
	<td><input type="date" name="days" ></td>
	<td><input type="submit" value="조회"></td>
	</form>  
       <%---기간 검색 버튼 --%>

<%
	videoDao dao2 = new videoDao();
	ArrayList<video> list2 = dao2.thumbnailvideo();
	
	for(video t : list2){
		
	}
%>  




<%
	videoDao dao = new videoDao();
	ArrayList<video> list = dao.Allvideo();
	
	for(video a : list){
%>  

    


	 <%---영상 리스트 --%>
	 <br>
	  <br>
		<div id="ll_main">
		<div style="position: relative; width: 100%; height: 90px; border-top: 1px solid rgb(135, 177, 226);" class="linkbox">
		<div style="position:absolute; left:0px; top:4px; width:80px; text-align:center; line-height:150%;">
		<%-- 좋아요버튼--%><img cid="592a5d001d295a6a588b4569" class="good_btn" src="http://z.fow.kr/img/good.gif"><br>
		
		<%-- 좋아요갯수--%><span id="good_592a5d001d295a6a588b4569" title="0" score="73"><%= a.getY_good() %></span>
		
		<br><img cid="592a5d001d295a6a588b4569" class="bad_btn"></div><div class="ll_thumb" style="position:absolute; left:80px; top:4px; width:120px; height:80px; overflow:hidden; text-align:center; border:1px solid silver;">
		<%---영상 썸네일 --%><button><img class="play_link" cid="592a5d001d295a6a588b4569" play="https://www.youtube.com/embed/MPX-ojIEbDI?autoplay=1&amp;version=3&amp;hd=1&amp;modestbranding=1&amp;rel=0&amp;showinfo=0&amp;fs=1" src="http://img.youtube.com/vi/<%= a.getY_code() %>/0.jpg" width="120" height="90"></button>
				
				<%-- <a href="<%=request.getContextPath() %>/videowatch/video_watch_form.jsp?live=<%= a.getLive() %>">--%>
				
								
					
		<img class="play_btn" src="http://z.fow.kr/img/play.png" style="position: absolute; left: 30px; top: 9px; border: 0px; cursor: pointer; display: none;"></div>
		<%---영상클릭주소 --%><div style="position:absolute; left:210px; top:4px; width:515px; overflow:hidden;" class="ell"><a style="text-decoration:none;" href='<%=request.getContextPath() %>/videowatch/video_watch_form.jsp?live=<%= a.getLive() %>'>
																																												
		
						
		<%-- 영상 타이틀--%><span style="color:#2955BC; font-size:14pt; font-family:dotum; text-decoration:none;"><b><%= a.getY_title() %></b></span><br>
						
		<%-- 가수 설명 --%>	<span style="color:#BBB;"><font style="color:#D0D; font-size:10pt;">가수이름 : <%= a.getY_name() %> 설명 : <%= a.getY_comment() %></font></span></a>
				
		<%-- 닉네임 시간--%>	<br><span style="color:#77D; font-size:11px;"><%= a.getY_id() %> 님께서 올린 글 / <%= a.getY_data() %> /업로드 시간</span><br></div>
				
				<div style="position:absolute; width:500px; left:210px; bottom:8px;">
		<%-- 댓글갯수--%><span class="comments ui-widget-content ui-corner-all" style="padding:3px; font-family:gulim; cursor:pointer;" tid="592a5d001d295a6a588b4569">[댓글갯수달자]개의 댓글</span> 
				
		<%-- 신고 --%><div style="position:absolute; right:2px; top:0px;"><span class="send_report ui-widget-content ui-corner-all" style="background:#FDD; padding:3px; font-family:gulim; cursor:pointer;" tid="592a5d001d295a6a588b4569" title="">신고[신고 갯수]</span> 
				
		<%-- 카테고리 --%><span class="ui-widget-content ui-corner-all" style="background:#DDF; padding:3px; font-family:gulim;" tid="592a5d001d295a6a588b4569" title="">스타일 : <%= a.getY_style()%> l장르 : <%= a.getY_ct()%> l나라 : <%= a.getY_cu()%></span> 
				</div></div></div>
				
				<div id="memo_592a5d001d295a6a588b4569" cid="592a5d001d295a6a588b4569" style="vertical-align:middle; display:none; position:relative: width:100%; border-top:1px dotted #B7D1F2; padding:8px 8px 8px 75px;">
				<div style="position:relative; border:1px dotted #BCD; padding:5px; background:#FFF;">
				</div></div>
				<div id="comment_592a5d001d295a6a588b4569" cid="592a5d001d295a6a588b4569" isshow="0" style="vertical-align:middle; display:none; position:relative: width:100%; border-top:1px dotted #B7D1F2;">
				<div style="padding:5px; margin-left:80px;">
				이름: 
				<input name="name" value="" class="ui-widget-content ui-corner-all" style="width:80px;" maxlength="10">
				 &nbsp; 암호: 
				 <input name="pass" class="ui-widget-content ui-corner-all" style="width:80px;"> 
				 &nbsp; <span style="font-size:11px; color:#F88;">
				 (이름 생략 가능 / 암호 생략 시 IP로 자동인증 됩니다.)</span>
				 <br>내용: 
				 <input name="comm" class="comment_memo ui-widget-content ui-corner-all" style="width:480px;">
				  &nbsp; <input name="id" type="hidden" value="592a5d001d295a6a588b4569">
				  <span class="do_comment ui-widget-content ui-corner-all" style="cursor:pointer; padding:3px">&nbsp; √ &nbsp;</span>
				  <span class="error" style="color:red;"></span><br><span style="color:red;">※ 추천유도!, 비방성 댓글, 허위사실, 비속어 등은 자제해 주세요.
				  </span></div><div id="cc_592a5d001d295a6a588b4569" style="margin-left:80px;">
				  </div></div><div style="position:relative; width:100%; height:90px; border-top:1px solid #87B1E2;" class="linkbox">
				  <%--<div style="position:absolute; left:0px; top:4px; width:80px; text-align:center; line-height:150%;">
				  <img cid="592a160a1d295a26628b456a" class="good_btn" src="http://z.fow.kr/img/good.gif">
				  <br><span id="good_592a160a1d295a26628b456a" title="0" score="100">100</span>
				  <br><img cid="592a160a1d295a26628b456a" class="bad_btn" src="http://z.fow.kr/img/bad.gif">
				  </div>
				  <div class="ll_thumb" style="position:absolute; left:80px; top:4px; width:120px; height:80px; overflow:hidden; text-align:center; border:1px solid silver;">
				  <img class="play_link" cid="592a160a1d295a26628b456a" play="https://www.youtube.com/embed/7e_cKrkE1-Q?autoplay=1&amp;version=3&amp;hd=1&amp;modestbranding=1&amp;rel=0&amp;showinfo=0&amp;fs=1" src="http://img.youtube.com/vi/7e_cKrkE1-Q/0.jpg" width="120" height="90">
				 --%>
				
				
				 
<%
	}
%>   	
			<%---영상화면 --%>
					<div id="memo_5934d76c1d295a79318b4568" cid="5934d76c1d295a79318b4568" style="vertical-align: middle; border-top: 1px dotted rgb(183, 209, 242); padding: 8px 8px 8px 75px; display: block;" isshow="1">
					<div style="margin-left:-85px;">
					<iframe  id="videotoggle" name="video" height="409" width="726" frameborder="0" src="https://www.youtube.com/watch?v=<%--<%=a.getY_code() %> --%>&list=RDMMGdieREJYYfA&index=3" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="">
					</iframe></div></div> 
  	
	 
	<%---댓글 --%>
			<button><div id="comment_5934d76c1d295a79318b4568" cid="5934d76c1d295a79318b4568" isshow="1" style="vertical-align: middle; border-top: 1px dotted rgb(183, 209, 242); display: block;">
			
			<br>내용: <input name="comm" class="comment_memo ui-widget-content ui-corner-all" style="width:480px;"> &nbsp; <input name="id" type="hidden" value="5934d76c1d295a79318b4568">
			<span class="do_comment ui-widget-content ui-corner-all" style="cursor:pointer; padding:3px">&nbsp; √ &nbsp;</span><span class="error" style="color:red;"></span>
			<br><span style="color:red;">※ 추천유도!, 비방성 댓글, 허위사실, 비속어 등은 자제해 주세요.</span></div>
			
			<div id="aaa">
			<div id="cc_5934d76c1d295a79318b4568" style="margin-left:80px;">
			<div style="border:1px solid blue; padding-right:6px;"><div>
			<div style="position:relative; color:#77D; font-size:9pt; width:100%; background:#F0F0F0; padding:2px; border-top:1px solid #AAA; border-bottom:1px dotted #CCC;">
			
			<%---댓글닉네임 --%>적어도 <span style="color:#AAA; font-size:11px;">
							
			<%---댓글 달린 시간 --%>6시간  전</span> 
			<%---댓글 좋아요	 --%>&nbsp; <div style="filter:alpha(opacity=70); opacity:0.7; color:#E5E5E5; position:absolute; top:3px; right:0px;">
							<a cid="593504771d295a8b458b4569" class="sbtn small" gc="19" style="cursor:default;">
							<span style="cursor:default; color:#3333CC;">추천 19</span></a> 
							
			<%---댓글 신고로 만들자--%><a cid="593504771d295a8b458b4569" gcid="#gc_593504771d295a8b458b4569" class="sbtn small btn_go_gc" gc="19">
							<span style="color:#3333CC;">이동</span></a> </div>
							
			<%---댓글 내용--%><div style="padding:5px 0px 10px 5px; word-break:break-all;">
							공부하면 너처럼 마냥세상탓하면서 암것도안하는애들보단 잘되겟지 ?
							</div></div><div></button></div></div>
							
							<%--삭제예정 <div style="position:relative; color:#77D; font-size:9pt; width:100%; background:#F0F0F0; padding:2px; border-top:1px solid #AAA; border-bottom:1px dotted #CCC;">
							11 <span style="color:#AAA; font-size:11px;">9시간  전</span>
							 &nbsp; <div style="filter:alpha(opacity=70); opacity:0.7; color:#E5E5E5; position:absolute; top:3px; right:0px;"><a cid="5934db7e1d295a26528b456b" class="sbtn small" gc="16" style="cursor:default;">
							 <span style="cursor:default; color:#3333CC;">추천 16</span></a>  <a cid="5934db7e1d295a26528b456b" gcid="#gc_5934db7e1d295a26528b456b" class="sbtn small btn_go_gc" gc="16"><span style="color:#3333CC;">
							 이동</span></a> </div></div><div style="padding:5px 0px 10px 5px; word-break:break-all;">
							 돈 넣어줄때 아예 옷 들춰주넼ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</div></div><div>
							 
							 <div style="position:relative; color:#77D; font-size:9pt; width:100%; background:#F0F0F0; padding:2px; border-top:1px solid #AAA; border-bottom:1px dotted #CCC;">
							 111 <span style="color:#AAA; font-size:11px;">6시간  전</span>
							  &nbsp; <div style="filter:alpha(opacity=70); opacity:0.7; color:#E5E5E5; position:absolute; top:3px; right:0px;">
							  <a cid="593505251d295a97488b4569" class="sbtn small" gc="7" style="cursor:default;">
							  <span style="cursor:default; color:#3333CC;">추천 7</span></a>  
							  <a cid="593505251d295a97488b4569" gcid="#gc_593505251d295a97488b4569" class="sbtn small btn_go_gc" gc="7">
							  <span style="color:#3333CC;">이동</span></a> </div></div>
							  <div style="padding:5px 0px 10px 5px; word-break:break-all;">넌 한번이라도 진지하게 살아봐라</div></div></div>
							  --%>
	
	

	
	 <%---영상 리스트 --%>
	
	
	</div>

  
</body>
</html>