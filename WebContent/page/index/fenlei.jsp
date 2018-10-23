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
	font-size: 14px;
}


p{position: relative; line-height: 20px; max-height: 55px;overflow: hidden;text-indent: 25px;}
p::after{content: "..."; position: absolute; bottom: 0; right: 0; padding-left: 40px;
background: -webkit-linear-gradient(left, transparent, #fff 55%);
background: -o-linear-gradient(right, transparent, #fff 55%);
background: -moz-linear-gradient(right, transparent, #fff 55%);
background: linear-gradient(to right, transparent, #fff 55%);
}

.categoryUl {
	overflow: hidden;
	margin-top: 10px;
}
.categoryUl li {
	float: left;
	margin-left: 5px;
	padding: 5px 0;
}

</style>
</head>

<body>
	<%@include file="../common/top.jspf" %>
	<!--          *********************     ；中层导航           *********************           -->
	
	<!--          *********************     中部内容           *********************           -->
	<div class="container">
		<div class="line">
			<!--          *********************     热门电影         *********************           -->
			<div class="x8 " style="padding-bottom:20px;padding-right:20px;">
				<div class="panal-group">
					<div class="bg-white hidden-l">
						<strong><h2 class=" text-blue text-large padding">选影视</h2></strong>
						<div class="padding" style="border-top: 1px solid #bbb;">
							<ul class="categoryUl">
								<c:if test="${leixingFlag == '全部类型'}">
									<li><a class="padding bg-green text-white">全部类型</a></li>
									<s:iterator id="li" value="leixingList" status="st">
										<li><a href="${pageContext.request.contextPath}/Member/fenlei_getLeixingfDianyingList.action?leixing=${leixing}&guojia=${guojiaFlag}" class="padding text-black">${leixing }</a></li>
									</s:iterator>
								</c:if>
								<c:if test="${leixingFlag != '全部类型'}">
									<li><a  href="${pageContext.request.contextPath}/Member/fenlei_getLeixingfDianyingList.action?leixing=全部类型&guojia=${guojiaFlag}" class="padding text-black">全部类型</a></li>
									<s:iterator id="li" value="leixingList" var="bean" status="st">
										<c:if test="${requestScope.leixingFlag == bean.leixing}">
											<li><a class="padding bg-green text-white">${bean.leixing }</a></li>
										</c:if>
										<c:if test="${requestScope.leixingFlag != bean.leixing}">
											<li><a href="${pageContext.request.contextPath}/Member/fenlei_getLeixingfDianyingList.action?leixing=${bean.leixing}&guojia=${guojiaFlag}" class="padding text-black">${bean.leixing }</a></li>
										</c:if>
									</s:iterator>
								</c:if>
							</ul>
							<ul class="categoryUl">
								<c:if test="${guojiaFlag == '全部地区'}">
									<li><a class="padding bg-green text-white">全部地区</a></li>
									<s:iterator id="li" value="guojiaList" status="st">
										<li><a href="${pageContext.request.contextPath}/Member/fenlei_getLeixingfDianyingList.action?leixing=${leixingFlag }&guojia=${guojia}" class="padding text-black">${guojia }</a></li>
									</s:iterator>
								</c:if>
								<c:if test="${guojiaFlag != '全部地区'}">
									<li><a  href="${pageContext.request.contextPath}/Member/fenlei_getLeixingfDianyingList.action?leixing=${leixingFlag}&guojia=全部地区" class="padding text-black">全部地区</a></li>
									<s:iterator id="li" value="guojiaList" var="bean" status="st">
										<c:if test="${requestScope.guojiaFlag == bean.guojia}">
											<li><a class="padding bg-green text-white">${bean.guojia }</a></li>
										</c:if>
										<c:if test="${requestScope.guojiaFlag != bean.guojia}">
											<li><a href="${pageContext.request.contextPath}/Member/fenlei_getLeixingfDianyingList.action?leixing=${leixingFlag}&guojia=${bean.guojia}" class="padding text-black">${bean.guojia }</a></li>
										</c:if>
									</s:iterator>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="panal-body">
					<ul>
						<s:iterator id="li" value="dianyingList" status="st">
							<!-- 显示的类别一，按照排行榜的方式-->
							<!--  
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
					 					 	<li style="margin-top: 10px;">
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
					 		</li>    -->
					 		<!-- 显示的类别二，图片加名字和分数-->
					 		<li >
								<div class="media x3 media-y" style="margin-top: 15px;"> 
									<a href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${id}" > 
										<img style="width:150px; height:200px;" src="${pageContext.request.contextPath}/moviePic/${id}.jpg" class="radius"> 
										<div class="media-body" style="text-align: center;"> 
											<span class="float-left" style="display: inline-block;margin-left: 20px; width: 110px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">${name}</span>
											<span class=" text-yellow float-left" style="display: inline-block;margin:0  5px; width: 30px; overflow: hidden;">${fenshu}</span>
										</div>
									</a> 
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