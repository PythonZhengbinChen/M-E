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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/font-awesome-4.5.0/css/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pintuer.js"></script>
		<script src="${pageContext.request.contextPath}/js/Select-More.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
#shoucangMain {
	display: none;
}
#yingpingMain {
	display: none;
}
</style>
</head>
	<body>

	<%@include file="../common/top.jspf" %>
		<!--          *********************     我的订单-------内容           *********************           -->
		<div class="My-Oreders-container container">
			<div class="My-Oreders line">
				<div class="x2 panel border-back">
					<div>
						<div class="panel-body text-center">
							<img src="${pageContext.request.contextPath}<%-- /uploadImg/${imgUrl} --%>/img/dianying1.jpg" height="150px" width="125px"class="radius-circle" />
						</div>
						<div class="panel-foot bg-back border-back" style="text-align: center;"><strong class="text-yellow">${user.name }</strong>您好！</div>
					</div>
					<div style="margin-top:20px;">
						<div class="button bg-back" style="text-align: center;width: 100%;" onclick="shoucangBtn()"><strong><a>我的收藏</a></strong></div>
						<div class="button bg-back" style="text-align: center;width: 100%; margin-top:10px;" onclick="yingpingBtn()"><strong><a>我的影评</a></strong></div>
					</div>
				</div>
				
				<div class="x10 " style="padding: 10px 20px;min-height: 450px;">
					<div class="orders-line line" id="showMain">
						<div class="panal">
							<div class="panal-body text-center" style="padding: 50px;">
								<strong><h2 class=" text-main text-large padding">聚焦热门影视，记录电影的故事</h2></strong>
								<strong><h2 class=" text-blue text-large padding">M&E一个不一样的电影评论平台</h2></strong>
								<strong><h2 class=" text-gray text-large padding">让我们一起享受电影带来的乐趣！</h2></strong>
							</div>
						</div>
					</div>
					<div class="orders-line line" id="shoucangMain">
						<div class="panal ">
							<strong><h2 class=" text-blue text-large padding" style="border-bottom: 1px solid #bbb;">我的收藏</h2></strong>
							<div class="panal-body">
								<ul>
						<s:iterator id="li" value="dianyingList" status="st">
					 		<!-- 显示的类别二，图片加名字和分数-->
					 		<li >
								<div class="media x3 media-y" style="margin-top: 15px;"> 
									<a href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${id}" > 
										<img style="width:150px; height:200px;" src="${pageContext.request.contextPath}/moviePic/${id}.jpg" class="radius"> 
										<div class="media-body" style="text-align: center;"> 
											<span class="float-left" style="display: inline-block;margin-left: 45px; width: 100px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">${name}</span>
											<span class=" text-yellow float-left" style="display: inline-block;margin:0  5px; width: 30px; overflow: hidden;">${fenshu}</span>
										</div>
									</a> 
									<a href="${pageContext.request.contextPath}/Member/shoucang_quxiaoShoucang.action?dianyingid=${id}&username=${user.username}"><button class="bg-red button button-little">取消收藏</button></a>
								</div>
							</li>
 						</s:iterator>
 						</ul>
							</div>
						</div>
					</div>
					<div class="orders-line line" id="yingpingMain">
						<div class="panal">
							<strong><h2 class=" text-blue text-large padding" style="border-bottom: 1px solid #bbb;">我的影评</h2></strong>
							<div class="panal-body">
							<s:iterator id="list" value="pinglunList" status="st">
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
			</div>
		</div>

		<!--          *********************     底部内容           *********************           -->
		<%@include file="../common/bottom.jspf" %>
	</body>
	<script type="text/javascript">
		function shoucangBtn() {
			$("#showMain").hide();
			$("#shoucangMain").show();
			$("#yingpingMain").hide();
		}
		function yingpingBtn() {
			$("#showMain").hide();
			$("#shoucangMain").hide();
			$("#yingpingMain").show();
		}
	</script>
</html>