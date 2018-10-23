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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pintuer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/web.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-p.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/font-awesome-4.5.0/css/font-awesome.min.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/pintuer.js"></script>
<style type="text/css">
.navbar .container .line .navbar-form {
	margin-top: 0px;
}
.dianyingDiv {
	padding: 5px;
	border-bottom: 1px solid #bbb;
}
.dianyingContent {
	padding-left: 20px;
}

p{position: relative; line-height: 20px; max-height: 55px;overflow: hidden;text-indent: 25px;}
p::after{content: "..."; position: absolute; bottom: 0; right: 0; padding-left: 40px;
background: -webkit-linear-gradient(left, transparent, #fff 55%);
background: -o-linear-gradient(right, transparent, #fff 55%);
background: -moz-linear-gradient(right, transparent, #fff 55%);
background: linear-gradient(to right, transparent, #fff 55%);
}
</style>
</head>

<body>
	<%@include file="../common/top.jspf" %>
	<!--          *********************     ；中层导航           *********************           -->
	<div class="container">
		<div class="line">
		<div class="x1"></div> 
			
	</div>
	</div>
	<!--          *********************     中部内容           *********************           -->
	<div class="container">
		<div class="line">
			<!--          *********************     热门电影         *********************           -->
			<div class="x8 " style="padding-bottom:20px;padding-right:20px;">
				<div class="panal-group">
					<div class="panal-head" style="padding-bottom:10px;">
						<strong><h2 class=" text-blue padding">M&E电影排行榜</h2></strong> 
						<hr />
					</div>
					<div class="panal-body">
						<ul>
						<s:iterator id="li" value="dianyingList" status="st">
							<li>
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
										<div class="dianyingContent"><p>${xiangxi }</p></div>
					 				</div>
					 			 </div>
					 		</div>
					 		</li>
 						</s:iterator>
 						</ul>
					</div>
				</div>
			</div>
			<!--          *********************     热门榜单         *********************           -->
			<div class="xl12 xm3">
			
					<!--          *********************     中间内容           *********************           -->
					<h2 class=" text-blue padding">本周口碑榜</h2>
					<div class="padding-big ">
						<ul class="list-media list-underline">
							<s:iterator id="benzhouDianyingList" value="benzhouDianyingList" status="st">
						    	<li>
									<div class="media media-x">
										<a  class="swing-hover" href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${id}"><div class="float-left " ><s:property value="#st.count"/></div>
										<div class="media-body  text-green ">${name}</div></a>
									</div>
								</li>
					    	</s:iterator>
						</ul>
					</div>
			</div>
		</div>
	</div>
	<!--          *********************     底部内容           *********************           -->
	<%@include file="../common/bottom.jspf" %>
</body>

</html>