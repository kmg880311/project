<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session.invalidate();	//session����
%>
<script language="javascript">
	alert("ȸ��Ż��Ϸ�");
	location.href = "<%= request.getContextPath() %>/index.jsp";
</script>
