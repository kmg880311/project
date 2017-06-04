<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session.invalidate();	//sessionÁ¾·á
%>
<script language="javascript">
	alert("È¸¿øÅ»Åð¿Ï·á");
	location.href = "<%= request.getContextPath() %>/index.jsp";
</script>
