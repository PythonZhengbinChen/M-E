<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/font-awesome-4.5.0/css/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pintuer.js"></script>
		<script src="${pageContext.request.contextPath}/js/Select-More.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>

	<%@include file="../common/top.jspf" %>
		<!--          *********************     个人中心         *********************           -->
		<div class="My-Oreders-container container">
			<div class="My-Oreders line">
				<div class="x2">
					<strong>个人中心</strong>
					<div class="panel border-back">
						<div class="panel-body text-center">
							<img src="${pageContext.request.contextPath}<%-- /uploadImg/${imgUrl} --%>/img/dianying1.jpg" height="150px" width="125px"class="radius-circle" />
						</div>
						<div class="panel-foot bg-back border-back"><a href="commodity_xiangqing.action?id=${id}">${name}</a><a  href="commodity_search.action?spname=">（添加自我介绍）</a></div>
					</div>
					<ul>
						<li><strong><a href=".html">我喜欢的电影</a></strong></li>
					</ul>
					<ul>
						<li><strong><a href=".html">我的邮件</a></strong></li>
					</ul>
				</div>
				
					<div class="x8" style="padding-right:10px;">
			<!--          *********************     我d主页         *********************           -->
					<div class="line">
						<ul>
							<li>&nbsp;</li>
							<li><strong><i class="fa fa-heart"></i>我的主页</strong></li>
							<li>&nbsp;</li>
						</ul>
					</div>
					<div class="x10-line line">
						<div class="x4">
							<div class="line">
								<div class="x3">
									<ul>
										<li>&nbsp;</li>
										<li><a  href="#My-Oreders.jsp">喜欢</a></li>
										<li>&nbsp;</li>
									</ul>
								</div>
								<div class="x3">
									<ul>
										<li>&nbsp;</li>
										<li><a  href="#My-Oreders1.jsp"><strong class="li-strong">邮件</strong></a></li>
										<li>&nbsp;</li>
									</ul>
								</div>
								
							</div>
						</div>
						<div class="x4">

						</div>
						<div class="x4">
							
						</div>
					</div>
						<!--          *********************   邮件内容           *********************           -->
	<div class="orders-line line">
	
		<div class="panel-group"> 
		<div class="panel-head"></div>
			<div class="media media-x"> 
				<a class="float-left" href="#">
					 <img src="http://www.pintuer.com/images/64.png" class="img-border radius-circle img-responsive"> 
				</a>
				<div class="media-body"> 
			 		 <ul class="list-text "><li><span class="date">2018.4.25</span><strong>用户名</strong></li></ul>
						<a href="user_index.action" class="media-body"> 四方股份大健康哈佛的大V符合我的卡好了</a>
						
			 	 </div>
			</div>
		</div>
	 	<div class="panel-group margin-top">
			<div class="media media-x"> 
				<a class="float-left" href="#">
				<img src="http://www.pintuer.com/images/64.png" class="img-border radius-circle img-responsive"> 
 				</a> 
 				<div class="media-body">
					 <ul class="list-text "><li><span class="date">2018.4.25</span><strong>用户名</strong></li></ul>
						<a href="user_index.action" class="media-body"> 大飒飒的说法是否达</a>
				</div>
			</div> 
		</div>
 		<div class="panel-group margin-top"> 
 			<div class="media media-x"> 
 				<a class="float-left" href="#"> 
 				<img src="http://www.pintuer.com/images/64.png" class="img-border radius-circle img-responsive"> 
 				</a> 
 				<div class="media-body"> 
 					 <ul class="list-text "><li><span class="date">2018.4.25</span><strong>用户名</strong></li></ul>
						  <a href="user_index.action" class="media-body"> 发给过舒服哈记得看不来算了</a>
 				</div>
 			 </div>
 		</div>
					</div>
					<hr />
				</div>
					<!--          *********************     关注内容           *********************           -->
				<div class="x2"></div>
				<div class="x2">
								<div class="panal">
									<div ><strong>我的关注</strong></div>
									<hr />
										<div class="panal-body">
						<div class="media-inline"> 
							<div class="media x2 media-y"> 
								<a href=" "> <img style=" height:20px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>11</strong> 
								</div>
							</div> 
						  <div class="media x2 media-y "> 
						<a href=" "> <img style=" height:20px;" src="${pageContext.request.contextPath}/img/dianying2.jpg" class="radius" > 
						</a> 
						<div class="media-body"> 
						<strong>222</strong> </div>
						 </div> 
						 <div class="media x2 media-y clearfix"> 
								<a href=" "> <img style=" height:20px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>333</strong> 
								</div>
							</div> 
							<div class="media x2 media-y clearfix"> 
								<a href=" "> <img style="height:20px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>4444</strong> 
								</div>
							</div> 
							<div class="media x2 media-y clearfix"> 
								<a href=" "> <img style="height:20px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>媒</strong> 
								</div>
							</div>
							<div class="media x2 media-y clearfix"> 
								<a href=" "> <img style="height:20px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>媒体标</strong> 
								</div>
							</div>
							<div class="media x2 media-y clearfix"> 
								<a href=" "> <img style="height:20px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>媒</strong> 
								</div>
							</div>
							<div class="media x2 media-y clearfix"> 
								<a href=" "> <img style="height:20px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>媒</strong> 
								</div>
							</div>
							
	
						 </div>
					</div>
					</div>
					<hr />
				</div>
				<span class="tab-more "><a class="text-green" href="commodity_search.action?spname="> 更多关注></a></span>
			</div>
		</div>

		<!--          *********************     底部内容           *********************           -->
		<%@include file="../common/bottom.jspf" %>
	</body>

</html>