<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/font-awesome-4.5.0/css/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pintuer.js"></script>
	</head>

	<body class="My-Oreders-body">
		<div class="Main-line line">
			<div class="x3 bg-main text-white text-center" style="height: 200px;line-height: 180px;font-size: 22px;border-radius: 20px;">
				电影总数：${dianyingListCount }部
			</div>
			<div class="x3 bg-green text-white text-center" style="height: 200px;line-height: 180px; margin-left: 20px;font-size: 22px;border-radius: 20px;">
				影评数量：${pinglunListCount }条
			</div>
			<div class="x3 bg-blue text-white text-center" style="height: 200px;line-height: 180px; margin-left: 20px;font-size: 22px;border-radius: 20px;">
				注册用户数：${userListCount }人
			</div>
		</div>
	</body>

</html>