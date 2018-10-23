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
	href="${pageContext.request.contextPath}/css/index.css" />
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
						<div class="bg-white hidden-l">
						<strong style="padding-bottom:10px;"><h2 class=" padding text-large padding">M&E最受欢迎的影评</h2></strong> 
					<div class="panal-body">
						<div class="media-inline"> 
						<s:iterator id="list" value="pinglun" status="st">
							<div class="pinglunMain review-item" id="${dianyingid}">
                				<a class="subject-img"  href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${dianyingid}">
                				<img title="${dianyingName}" alt="${dianyingName}" src="${pageContext.request.contextPath}/moviePic/${dianyingid}.jpg" rel="v:image">
                				</a>
    							<header class="main-hd">
							        <a class="avator" href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${dianyingid}">
							            <img width="24" height="24" src="${pageContext.request.contextPath}/img/head-img.png">
							        </a>
	        						<span class="nameSpan">${username }</span>
	        						<span class="star_bg">
									    <span class="star on onstar_${pingfen}" title="${pingfen}"></span>
									</span>
	        						<span class="timeSpan">${cretime}</span>
	    						</header>
			            	<div class="main-bd">
			                	<h2><a href="${pageContext.request.contextPath}/Member/pinglun_getPinglunInfo.action?pinglunid=${pinglunid}">${timu }</a></h2>
			                <div class="review-short" id="review_9390461_short" data-rid="9390461">
			                    <div class="dianyingContent"><p>${content }</p></div>
			                </div>
			                <div class="action" style="margin-left: 50px; width: 675px;">
			                    <a class="reply" href="#">${leixing}人回应</a>
			                </div>
			            </div>
			        </div>
			        </s:iterator>
			        
				</div>
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