<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String S_NICK2 = (String)session.getAttribute("S_NICK");
	String SID2 = (String)session.getAttribute("SID");
	System.out.println(S_NICK2 + "<-- 세션 닉");
	System.out.println(SID2 + "<-- 세션 아이디");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
 
</head>
<body>


  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
         
<%
		
%>      
  	 <button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>인기영상</h4></button><br>
  	 <button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>최근동영상</h4></button><br>
  	 <button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>추천많은영상</h4></button><br>
  	 <button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>조회수많은영상</h4></button><br>
  	 <button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>댓글많은영상</h4></button><br>
<%
	if(S_NICK2 == null){	
	}else if(SID2.equals("id001")){
%>
	<button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>내가올린영상</h4></button><br>
  	<button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>광고확인하기</h4></button><br>
  	<button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>신고받은영상</h4></button><br>
 	<button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/ltlist/lt_list.jsp'"><h4>회원리스트</h4></button><br>
<%
	}else if(S_NICK2 != null){
%> 
	<button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>내가올린영상</h4></button><br>
  	<button type="button" class="btn btn-default"  onclick="location.href='<%= request.getContextPath() %>/backup.jsp'"><h4>광고신청하기</h4></button><br>
<%
	}
%> 			
    </div>

</body>
</html>