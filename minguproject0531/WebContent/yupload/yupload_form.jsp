<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	 <span style="color: red; font-size: 20pt"> 로그인하기</span>
	 <br>
	<form action="<%= request.getContextPath() %>/yupload/yupload_pro.jsp" method="post">
<table border="1">
<tr>
	<td>소스코드</td>
	<td><input type="text" name="source_code" size="20"></td>
<tr>
<tr>
	<td>영상제목</td>
	<td><input type="text" name="title" size="20"></td>
<tr>
<tr>
	<td>영상내용</td>
	<td><input type="text" name="content" size="20"></td>
<tr>
<tr>
	<td>가수이름</td>
	<td><input type="text" name="name" size="20"></td>
<tr>
	<td><select name="cate">
		<option value="a">	신남	</option>
		<option value="b">	슬픔 </option>
		<option value="c">	감동		</option>
		<option value="d">	엽기	</option>
		<option value="e">	평화		</option>
		<option value="f">	희망		</option>
		<option value="g">	애절		</option>
		<option value="h">	동심	</option>
		<option value="i">	쓸쓸	</option>
	</select>
	</td>
</tr>
<tr>
	<td><select name="country">
		<option value="1">	한국	</option>
		<option value="2">	미국 </option>
		<option value="3">	일본		</option>
		<option value="4">	중국	</option>
		<option value="5">	영국		</option>
		<option value="f">	기타		</option>
		
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