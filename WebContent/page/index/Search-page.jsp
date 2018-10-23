<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/font-awesome-4.5.0/css/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pintuer.js"></script>
		<script src="${pageContext.request.contextPath}/js/Select-More.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<body class="My-Oreders-body">
		<%@include file="../common/top.jspf" %>
		<!--   ****************************   中路信息栏        *****************************      -->
		<div class="All-Solds-container container" style="min-height: 450px;">
			<div class="Select-line line alert box-shadow-none">
				<div class="x3">
					结果：找到与<label style="display:inline">${searchKey}</label>相关的结果<label style="display:inline">${dianyingListCount}</label>个
				</div>
			</div>
			<!--          *********************    物品信息 内容           *********************           -->
			<div class="solding-line line">
				<ul>
					<s:iterator id="li" value="dianyingList" status="st">
							<li class="bg-white padding alert" style="margin-top: 3px;">
							<div class=" margin-top dianyingDiv" > 
					 			<div class="media media-x"> 
					 				<a class="float-left" href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${id}"> 
					 				<img style="width:80px; height:100px;" src="${pageContext.request.contextPath}/moviePic/${id }.jpg" class="img-responsive"> 
					 				</a> 
					 				<div class="media-body"> 
					 					 <ul>
					 					 	<li>
						 					 	<a href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${id}"><strong style="display: inline;">${name }</strong></a>
						 					 	<a href="" > / ${leixing }</a>
						 					 	<a href="" > / ${guojia }</a>
						 					 	<div class="txt-border txt-small radius-circle border-yellow" style="margin-left:5px;">
												 	<div class="txt radius-circle bg-yellow" style="overflow: hidden;">${fenshu }</div> 
												 </div>
					 					 	</li>
					 					 	<li>
					 					 		<span>导演： <strong style="display: inline;">${daoyan }</strong></span>
					 					 		<span> | 编剧： <strong style="display: inline;">${bianju }</strong></span>
					 					 		<span> | 主演： <strong style="display: inline;">${zhuyan }</strong></span>
					 					 		<span style="color: #666; font-size: 14px;"> | 上映时间: ${shanyingshijian }</span>
					 					 	</li>
					 					 </ul>
										<div class="dianyingContent" style="padding: 5px 20px;"><p>${xiangxi }</p></div>
					 				</div>
					 			 </div>
					 		</div>
					 		</li>
 						</s:iterator>
 					</ul>
			</div>
			<hr />
		</div>

		<!--          *********************     底部内容           *********************           -->
		<%@include file="../common/bottom.jspf" %>
	</body>

</html>