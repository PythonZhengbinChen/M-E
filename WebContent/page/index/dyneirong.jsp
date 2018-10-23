<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
							<img src="${pageContext.request.contextPath}/moviePic/${dianyingBean.id}.jpg" height="150px" width="125px"class="radius-circle" />
						</div>
						<div class="panel-foot bg-back border-back text-center"><strong>${dianyingBean.name}</strong></div>
					</div>
					<br />
					<div class="panel">
						<div class="panel-head"><strong>M&E评分</strong></div>
						<ul class="list-group">
						<div class="media-inline"> 
							<li>
							<div class="txt-border txt-small radius-circle border-green">
							 <div class="txt radius-circle bg-green">${dianyingBean.fenshu }</div> 
							 </div>
							 <div class="float-right">${pinglunCount }人评价</div>
							
							 </li>
							 </div>
						<div class="media-inline"> 
							<li>
							<div class="x3">5星</div>
							<div class="progress"> 
							<div class="progress-bar bg-yellow" style="width: ${star5}%;">${star5}%</div> 
							</div>
							 </li>
							 </div>
							 <div class="media-inline"> 
							<li>
							<div class="x3">4星</div>
							<div class="progress"> 
							<div class="progress-bar bg-yellow" style="width: ${star4}%;">${star4}%</div> 
							</div>
							 </li>
							 </div>
							 <div class="media-inline"> 
							<li>
							<div class="x3">3星</div>
							<div class="progress"> 
							<div class="progress-bar bg-yellow" style="width: ${star3}%;">${star3}%</div> 
							</div>
							 </li>
							 </div>
							 <div class="media-inline"> 
							<li>
							<div class="x3">2星</div>
							<div class="progress"> 
							<div class="progress-bar bg-yellow" style="width: ${star2}%;">${star2}%</div> 
							</div>
							 </li>
							 </div>
							 <div class="media-inline"> 
							<li>
							<div class="x3">1星</div>
							<div class="progress"> 
							<div class="progress-bar bg-yellow" style="width: ${star1}%;">${star1}%</div> 
							</div>
							 </li>
							 </div>
						</ul>
					</div>
					<br />
			</div>
			<!--          *********************     >电影详细信息          *********************           -->
			<div class="xm9">
					<div class="panel">
						<div class="panel-head"><strong>电影名：</strong>&nbsp;&nbsp;${dianyingBean.name}</div>
						<div class="panal-body">
						<table class="table">
							<tr>
								<th colspan="2"></th>
								<th colspan="2"></th>
							</tr>
							<tr>
								<td width="110" align="right">导演：</td>
								<td>${dianyingBean.daoyan }</td>
								<td width="90" align="right">编剧：</td>
								<td>${dianyingBean.bianju }</td>
							</tr>
							<tr>
								<td align="right">主演：</td>
								<td>${dianyingBean.zhuyan }</td>
								<td align="right">类型：</td>
								<td>${dianyingBean.leixing }</td>
							</tr>
							<tr>
								<td align="right">制片国家：</td>
								<td>${dianyingBean.guojia }</td>
								<td align="right">语言：</td>
								<td>${dianyingBean.language }</td>
							</tr>
							<tr>
								<td align="right">上映时间：</td>
								<td>${dianyingBean.shanyingshijian }</td>
								<td align="right">片长：</td>
								<td><a href="">${dianyingBean.pianchang }</a></td>
							</tr>
						</table>
						</div>
					</div>
			 		<div class="alert">
						<h4>剧情简介</h4>
						<p class="text-gray padding-top">${dianyingBean.xiangxi }</p>
						
						<c:if test="${isShoucang == '1' }">
							<button  class="button bg-green icon-home dialogs"  disabled="disabled"><i class="fa fa-map-o"></i>已收藏</button>
							<a  class="button bg-main icon-home "  onclick="$('#mydialog1').show()"><i class="fa fa-map-o"></i>写影评</a>
						</c:if>
						<c:if test="${isShoucang != '1' }">
							
							
							<%
						Cookie[] cooks = request.getCookies();
						 if (cookies != null) {
					         for (Cookie cook : cooks) {
					        	 if("loginer".equals(cook.getName()) && !cook.getValue().equals("")){
					        	 %>
					        	 <a  class="button bg-blue icon-home dialogs" href="shoucang_setDianyingShoucang.action?dianyingid=${dianyingBean.id }&username=<% out.println(cook.getValue()); %>"><i class="fa fa-map-o"></i>收藏</a>
								<a  class="button bg-main icon-home " onclick="$('#mydialog1').show()"><i class="fa fa-map-o"></i>写影评</a>
					        	 <%
					        	 }       	 
					         }
						 } else { %>
						 	<a  class="button bg-blue icon-home dialogs" onclick="alert('请先登录！')"><i class="fa fa-map-o"></i>收藏</a>
							<a  class="button bg-main icon-home " onclick="alert('请先登录！')" ><i class="fa fa-map-o"></i>写影评</a>
						 <%} %>
							
						</c:if>
				</div>
						<div id="mydialog1" style="display: none;">
							
						 <div class=""> 
							<div class="dialog-head">
								<span class="close rotate-hover" onclick="$('#mydialog1').hide()"></span>
								<strong>写影评</strong>
							</div> 
							<div class="dialog-body">
							
							<form action="pinglun_setPinglunInfo.action" type="POST">
								<input type="hidden" id="dianyingid" name="dianyingid" value="${dianyingBean.id }"/>
								<input class="input" type="text" id="timu" name="timu" placeholder="请输入影评题目"/>
								<textarea class="input" id="content" name="content" placeholder="" data-validate="required:必填"></textarea>
								<input type="hidden" name="username" value="${sessionScope.loginer.username}"/>
								<input type="hidden" name="pingfen" id="pingfen"/>
								<button type="submit" style="display: none;" id="pinglunBtn"></button>
							</form>
								<span>评分：</span>
								<div id="starBg" class="star_bg">                   	
								    <input type="radio" id="starScore1" class="score score_1" value="1" name="score">
								    <a href="#starScore1" onclick="$('#pingfen').val(1)" class="star star_1" title="差"><label for="starScore1">差</label></a>
								    <input type="radio" id="starScore2" class="score score_2" value="2" name="score">
								    <a href="#starScore2" onclick="$('#pingfen').val(2)" class="star star_2" title="较差"><label for="starScore2">较差</label></a>
								    <input type="radio" id="starScore3" class="score score_3" value="3" name="score">
								    <a href="#starScore3" onclick="$('#pingfen').val(3)" class="star star_3" title="普通"><label for="starScore3">普通</label></a>
								    <input type="radio" id="starScore4" class="score score_4" value="4" name="score">
								    <a href="#starScore4" onclick="$('#pingfen').val(4)" class="star star_4" title="较好"><label for="starScore4">较好</label></a>
								    <input type="radio" id="starScore5" class="score score_5" value="5" name="score">
								    <a href="#5" onclick="$('#pingfen').val(5)" class="star star_5" title="好"><label for="starScore5">好</label></a>
								</div>
							</div>
							<div class="dialog-foot"> <button class="button dialog-close"> 取消</button> <button class="button bg-green" onclick="$('#pinglunBtn').click();"> 确认</button> </div> </div>
						</div>
							
						
					<!--          *********************     热门影评          *********************           -->
		<div class="panal">
				<div class="panel-head"><strong>热门影评</strong></div>
				
		<div class="panel-body border-top">
				    <a name="comments"></a>
    		<strong class="text-main comment-header">评论：</strong>
			<div class="comment panel-body border-top text-small" ">
				<s:iterator id="li" value="pinglunList" status="st">
							<div class="pinglunMain review-item" id="${dianyingid}">
    							<header class="main-hd">
							        <a class="avator" href="#">
							            <img width="24" height="24" src="${pageContext.request.contextPath}/img/head-img.png">
							        </a>
	        						<span class="nameSpan">${username }</span>
	        						<span class="star_bg">
									    <span class="star on onstar_${pingfen}" title="普通"></span>
									</span>
	        						<span class="timeSpan">${cretime}</span>
	    						</header>
			            	<div class="main-bd" style="padding: 10px 10px 0 10px;">
			                	<h2><a href="${pageContext.request.contextPath}/Member/pinglun_getPinglunInfo.action?pinglunid=${pinglunid}">${timu }</a></h2>
				                <div class="review-short" id="review_9390461_short" data-rid="9390461">
				                    <div class="short-content">${content }</div>
				                </div>
				                <div  class="action">
				                    <a class="reply tag bg-main" href="#">${leixing}人回应</a>
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