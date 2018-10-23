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
	</head>

	<body>
		
		<!--          *********************     电影-------内容           *********************           -->
		
		<div class="Buy-container container">
		<div class="admin tab">
			<div class="tab-head border-bottom padding">
					<span class="tab-more"><a href="javascript:history.go(-1)">返回上一页</a></span>
					<ul class="tab-nav">
						<li class="active"><strong>电影具体内容</strong></li>
					</ul>
				</div>
		<div class="line-big margin-top">
			<div class="xm3">
					<div class="panel border-back">
						<div class="panel-body text-center">
							<img src="${pageContext.request.contextPath}/moviePic/${pinglunBean.dianyingid}.jpg" height="150px" width="125px"class="radius-circle" />
						</div>
						<div class="panel-foot bg-back border-back text-center"><strong><a href="${pageContext.request.contextPath}/Member/dianying_getDianyingInfoById.action?dianyingid=${pinglunBean.dianyingid}">${pinglunBean.dianyingName}</a></strong></div>
					</div>
			</div>
			<!--          *********************     >电影详细信息          *********************           -->
			<div class="xm9">
					<div class="panel">
						<div class="panel-head"><strong>题目：</strong>&nbsp;&nbsp;${pinglunBean.timu}</div>
						<div class="panal-body">
						<table class="table">
							<tr>
								<th colspan="2"></th>
								<th colspan="2"></th>
							</tr>
							<tr>
								<td width="110" align="right">影评人：</td>
								<td>${pinglunBean.username }</td>
								<td width="90" align="right">评分：</td>
								<td>${pinglunBean.pingfen }</td>
								<td align="right">时间：</td>
								<td>${pinglunBean.cretime }</td>
							</tr>
						</table>
						</div>
					</div>
			 		<div class="alert">
						<h4>剧情简介</h4>
						<p class="text-gray padding-top">${pinglunBean.content }</p>
				</div>
					<!--          *********************     热门影评          *********************           -->
		<div class="panal">
				<div class="panel-head"><strong>热门回复</strong></div>
				
		<div class="panel-body border-top">
				    <a name="comments"></a>
			<div class="comment panel-body border-top text-small" ">
				<s:iterator id="li" value="huifu" status="st">
							<div class="pinglunMain review-item">
    							<header class="main-hd">
							        <a class="avator" href="#">
							            <img width="24" height="24" src="${pageContext.request.contextPath}/img/head-img.png">
							        </a>
	        						<span class="nameSpan">${username }</span>
	        						<span class="timeSpan">${cretime}</span>
	    						</header>
			            	<div class="main-bd" style="padding: 10px 10px 0 10px;">
				                <div class="review-short" id="review_9390461_short" data-rid="9390461">
				                    <div class="short-content">${huifucon }</div>
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
	</div>

	</body>

</html>