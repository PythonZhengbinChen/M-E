<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>M&E电影评论</title>
	</head>
	<frameset rows="100px,*" border="0" >
		<frameset cols="*" border="1">
			<frame src="${pageContext.request.contextPath}/manager/index_head.action"/>
		</frameset>
		<frameset cols="250px,*">
			<frame src="${pageContext.request.contextPath}/manager/index_left.action"/>
			<frame src="${pageContext.request.contextPath}/manager/index_main.action" name="main">
		</frameset>
	</frameset>
</html>
