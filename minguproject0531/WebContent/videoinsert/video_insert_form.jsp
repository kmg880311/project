<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String SID3 = (String)session.getAttribute("SID");
System.out.println(SID3 + "<-- 로그인되어있는 아이디");
%>  

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
	 <br>
	 <span style="color: red; font-size: 20pt"> 영상 업로드</span>
	 <br>
	<form action="<%= request.getContextPath() %>/videoinsert/video_insert_pro.jsp" method="post">
<table border="1">

<tr>
	<td>아이디</td>
	<td><input type="text" name="y_id" size="20" value="<%=SID3 %>" readonly></td>
<tr>

<tr>
	<td>링크주소</td>
	<td><input type="text" name="y_code" size="20"></td>
<tr>
<tr>
	<td>영상제목</td>
	<td><input type="text" name="y_title" size="20"></td>
<tr>
<tr>
	<td>영상내용</td>
	<td><input type="text" name="y_comment" size="20"></td>
<tr>
<tr>
	<td>가수이름</td>
	<td><input type="text" name="y_name" size="20"></td>
<tr>
	<td><select name="y_style">
		<option value="스타일">스타일	</option>
		<option value="신남">	신남		</option>
		<option value="슬픔">	슬픔 		</option>
		<option value="감동">	감동		</option>
		<option value="엽기">	엽기		</option>
		<option value="평화">	평화		</option>
		<option value="희망">	희망		</option>
		<option value="애절">	애절		</option>
		<option value="동심">	동심		</option>
		<option value="쓸쓸">	쓸쓸		</option>
	</select>
	</td>
</tr>
<tr>
	<td><select name="y_ct">
		<option value="나라">	나라		</option>
		<option value="한국">	한국		</option>
		<option value="미국">	미국 		</option>
		<option value="일본">	일본		</option>
		<option value="중국">	중국		</option>
		<option value="영국">	영국		</option>
		<option value="기타">	기타		</option>
		
	</select>
	</td>
<tr>
	<td><select name="y_cu">
		<option value="장르">장르</option>
		<option value="락">	락		</option>
		<option value="발라드">발라드 	</option>
		<option value="댄스">	댄스		</option>
		<option value="힙합">	힙합		</option>
		<option value="인디">	인디		</option>
		<option value="일렉">	일렉		</option>
		
	</select>
	</td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="영상등록하기"></td>
</tr>
</table>
</form>

 	</div>	
<%------------------------------------------------------------ --%>
<%@ include file="/module/right.jsp" %>		


</body>
</html>