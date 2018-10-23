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
		<%@include file="../common/top.jspf" %>
		<!--          *********************     电影-------内容           *********************           -->
		
		<div class="Buy-container container">
		<div class="admin">
		<div class="line-big">
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
						
						<%
						Cookie[] cooks = request.getCookies();
						 if (cookies != null) {
					         for (Cookie cook : cooks) {
					        	 if("loginer".equals(cook.getName()) && !cook.getValue().equals("")){
					        	 %>
					        	<a  class="button bg-main icon-home " onclick="$('#mydialog1').show()"><i class="fa fa-map-o"></i>写回复</a>
					        	 <%
					        	 }       	 
					         }
						 } else { %>
						 	<a  class="button bg-main icon-home " onclick="alert('请先登录！')" ><i class="fa fa-map-o"></i>写回复</a>
						 <%} %>
						
				</div>
				
								
					
						<div id="mydialog1" style="display: none;"> 
						<div class=""> 
							<div class="dialog-head"> <span class="close rotate-hover" onclick="$('#mydialog1').hide()"></span><strong>写回复</strong> </div> 
							<div class="dialog-body">
							<form action="huifu_setHuifuInfo.action" type="POST">
								<input type="hidden" id="pinglunid" name="pinglunid" value="${pinglunBean.pinglunid }"/>
								<textarea class="input" id="huifucon" name="huifucon" placeholder="" data-validate="required:必填"></textarea>
								<input type="hidden" name="username" value="${sessionScope.loginer.username}"/>
								<button type="submit" style="display: none;" id="pinglunBtn"></button>
							</form>
							</div>
							<div class="dialog-foot"> <button class="button dialog-close"> 取消</button> <button class="button bg-green" onclick="$('#pinglunBtn').click();"> 确认</button> </div> </div>
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

		
		<!--          *********************     底部内容           *********************           -->
		<%@include file="../common/bottom.jspf" %>
	</body>

</html>