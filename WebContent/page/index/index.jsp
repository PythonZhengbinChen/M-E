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
<title>M&E 电影评论</title>
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
		
			<!--          *********************     ；轮播导航           *********************           -->
			<div>
				<div class="banner" style="height:400px; width:100%;" >
					<div class="carousel" style="height:100%; width:100%;" >
						<div   class="item"  style="height:100%; width:100%;" >
							<img  style="height:100%; width:100%;"  src="${pageContext.request.contextPath}/img/lunbo1.jpg" />
						</div>
						<div class="item" style="height:100%; width:100%;">
							<img style="height:100%; width:100%;" src="${pageContext.request.contextPath}/img/lunbo6.jpg" />
						</div>
						<div class="item" style="height:100%; width:100%;">
							<img style="height:100%; width:100%;"  src="${pageContext.request.contextPath}/img/lunbo5.jpg" />
						</div>
						<div class="item" style="height:100%; width:100%;">
							<img style="height:100%; width:100%;" src="${pageContext.request.contextPath}/img/lunbo7.jpg" />
						</div>
					</div>
				</div>
			</div>
			
			
	</div>
	</div>
	<!--          *********************     中部内容           *********************           -->
	<div class="container">
		<div class="line">
			
			<!--          *********************     热门电影         *********************           -->
			<div class="x9 " style="padding-bottom:20px;">
				<div class="panal">
					<div class="panal-head" style="padding-bottom:10px;">
						<strong><i class="fa fa-send"></i>最近热门电影</strong> 
						<span class="tab-more "><a class="text-green" href="commodity_search.action?spname=">更多></a></span>
					</div>
					<div class="panal-body">
						<div class="media-inline"> 
							<s:iterator id="li" value="dianyingList" status="st">
						    	<div class="media x2 media-y" style="margin-top: 15px;"> 
									<a href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${id}" > 
										<img style="width:150px; height:200px;" src="${pageContext.request.contextPath}/moviePic/${id}.jpg" class="radius"> 
										<div class="media-body" style="text-align: center;"> 
											<span class="float-left" style="display: inline-block; width: 110px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">${name}</span>
											<span class=" text-yellow float-left" style="display: inline-block;margin:0  5px;">${fenshu}</span>
										</div>
									</a> 
								</div>
					    	</s:iterator>
						 </div>
					</div>
				</div>
			</div>
			<!--          *********************     热门榜单         *********************           -->
			<div class="xl12 xm3">
			
	<h2 class=" text-blue padding">热门榜单</h2>
					<div class="padding-big ">
						<ul class="list-media list-underline">
							<s:iterator id="li" value="dianyingList" status="st">
						    	<li>
									<div class="media media-x">
										<a  class="swing-hover" href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${id}"><div class="float-left " ><s:property value="#st.count"/></div>
										<div class="media-body  text-green ">${name}</div></a>
									</div>
								</li>
					    	</s:iterator>
						</ul>
					</div>
					<br />
				</div>
				<!--          *********************     热门影评         *********************           -->
				<div class="x9" style="padding-bottom:20px;">
				<div class="panal">
					<div class="panal-head" style="padding-bottom:10px;">
						<strong><i class="fa fa-send"></i>最近热门影评</strong> 
						<span class="tab-more "><a class="text-green" href="commodity_search.action?spname=">     更多></a></span>
					</div>
					<div class="panal-body">
						<div class="media-inline"> 
						<s:iterator id="li" value="pinglunList" status="st">
							<div class="pinglunMain review-item" id="${dianyingid}">
                				<a class="subject-img"  href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${dianyingid}">
                				<img title="${dianyingName}" alt="${dianyingName}" src="${pageContext.request.contextPath}/moviePic/${dianyingid}.jpg" rel="v:image">
                				</a>
    							<header class="main-hd">
							        <a class="avator" href="#">
							            <img width="24" height="24" src="${pageContext.request.contextPath}/img/head-img.png">
							        </a>
	        						<span class="nameSpan">${username }</span>
	        						<span class="star_bg">
									    <span class="star on onstar_${pingfen}" title="${pingfen}"></span>
									</span>
	        						<span class="timeSpan">${cretime}</span>
	    						</header>
			            	<div class="main-bd">
			                	<h2><a  href="${pageContext.request.contextPath}/Member/pinglun_getPinglunInfo.action?pinglunid=${pinglunid}">${timu }</a></h2>
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
			</div>
		</div>
	<!--          *********************     底部内容           *********************           -->
	<%@include file="../common/bottom.jspf" %>
</body>
</html>