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

	<body>
		
		<div class="panel border bg-white text-center">
			<div class="panel-body text-center">
				<img src="${pageContext.request.contextPath}/img/dianying1.jpg" height="100px" width="100px" class="radius-circle" />
			</div>
			<div class="panel-foot bg-back border-back">您好，${sessionScope.adminLoginer.name}</div>
		</div>
		<div class="list-link bg-white" >
			<ul class="nav nav-main nav-tabs">
				<li class="padding"><a href="adminDianying_getDianyingListForManage.action" target="main">电影管理</a></li>
				<li class="padding"><a href="adminDianying_dianyingAdd.action" target="main">电影添加</a></li>
				<li class="padding"><a href="adminPinglun_getPinglunList.action" target="main">影评管理</a></li>
				<li class="padding"><a href="adminUser_getUserList.action" target="main">用户管理</a></li>
			</ul>
		</div>
	</body>
</html>