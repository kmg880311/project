<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String S_NICK = (String)session.getAttribute("S_NICK");
	String SID = (String)session.getAttribute("SID");
	System.out.println(S_NICK + "<-- 세션 닉");
	System.out.println(SID + "<-- 세션 아이디");
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
  
  <script>
  $(document).ready(function(){
	 $('#searchbtn').click(function(){
		$('inputsm').value() 
	 }); 
  });
  </script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
   	
    <%--홈 버튼 --%>
    
  	 <button style="position: relative; left: 0px; top: 0px;" type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/index.jsp'" ><img src="<%=request.getContextPath() %>/images/livetube.jpg" class="img-rounded" ></button>
  	
  	<%--홈 버튼 --%>
  	
    <%--검색 하기 --%>	
	<input id="inputsm" type="text" name ="inputsm">
	<input type="button" value="검색" id="searchbtn" >
   	<%--검색 하기 --%>
     
<%
	if(S_NICK == null){	
%>         
	 <%-- 로그인 하기 버튼 --%>
      <button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/login/login_form.jsp'" ><h5>로그인하기</h5></button>
      <%-- 로그인 하기 버튼 --%>
     
      <%-- 회원가입 하기 버튼 --%>
      <button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/minsert/minsert_form.jsp'" ><h5>회원가입하기</h5></button>
      <%-- 회원가입 하기 버튼 --%>
      
      <%-- 아이디찾기 --%>
      <button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/findid/find_id_form.jsp'" ><h5>아이디 찾기</h5></button>
      <%-- 아이디찾기 --%>
      
      <%-- 비밀번호 찾기 --%>
      <button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/findpw/find_pw_form.jsp'" ><h5>비밀번호 찾기</h5></button>
      <%-- 비밀번호 찾기 --%>

<%
	}else if(SID.equals("id001")){
%>
	<%-- 로그인 아웃 --%>
	운영자 님<button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/login/loginout.jsp'" ><h5>로그아웃하기</h5></button>
	<%-- 로그인 아웃 --%>
	
	<%-- 영상 업로드 --%>
	<button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/yupload/yupload_form.jsp'" ><h5>영상 업로드 하기</h5></button>
	<%-- 영상 업로드 --%>
	
	<%-- 회원 정보 수정--%>
	<button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/ltupdate/lt_update_form.jsp?updateid=<%= SID %>'" ><h5>회원정보수정</h5></button>
	<%-- 회원 정보 수정 --%>												
	
	<%-- 회원 정보 수정--%>
	<button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/ltdelete/lt_delete_pro.jsp?deleteid=<%= SID %>'" ><h5>회원탈퇴하기</h5></button>
	<%-- 회원 정보 수정 --%>
<%
	}else if(S_NICK != null){
%>

	<%-- 로그인 아웃 --%>
	<%= S_NICK %>님<button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/login/loginout.jsp'" ><h5>로그아웃하기</h5></button>
	<%-- 로그인 아웃 --%>
	
	<%-- 영상 업로드 --%>
	<button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/yupload/yupload_form.jsp'" ><h5>영상 업로드 하기</h5></button>
	<%-- 영상 업로드 --%>
	
	<%-- 회원 정보 수정--%>
	<button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/ltupdate/lt_update_form.jsp?updateid=<%= SID %>'" ><h5>회원정보수정</h5></button>
	<%-- 회원 정보 수정 --%>	
	
	<%-- 회원 정보 수정--%>
	<button type="button" class="btn btn-default"  onclick="location.href='<%=request.getContextPath() %>/ltdelete/lt_delete_pro.jsp?deleteid=<%= SID %>'" ><h5>회원탈퇴하기</h5></button>
	<%-- 회원 정보 수정 --%>
<%
		}
%>

           
    </div>
  </div>
</nav>

</body>
</html>