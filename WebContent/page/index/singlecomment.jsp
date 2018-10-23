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
						<strong style="padding-bottom:10px;"><h2 class=" padding text-large padding">影评题目</h2></strong> 
							<hr />
						
						<div class="padding">
							
							<div class="alert padding-big radius-none">
								<h1 class="text-center">
                              作者评论电影<a href="commodity_xiangqing.action?id=${id}">${name}</a>
                            </h1>
								<p>
								</p>
								<p align="center">
									<img class="img-responsive img-radius box-shadow" src="${pageContext.request.contextPath}/img/dianying1.jpg">
								</p>
								<p>
									国内优秀的HTML、CSS、JS跨屏响应式前端框架，自动适应电脑、平板、手机等设备，让前端开发更简单、快速、便捷。改变以往建立PC网站同时，再建立手机网站的局面，实现一站响应所有设备，大大提高了开发效率。
									移动优先、跨屏响应：拼图以移动设备为基点，优先适应于移动设备；从移动设备扩大到平板、桌面电脑等设备，实现跨屏响应，兼容桌面浏览器的同时，更适应了移动互联网的潮流。
									组件丰富、海量插件：拼图前端框架重新定义了CSS基础、常用元件及JS组件，可快速构架前端界面，实现跨屏响应。同时兼容所有jQuery插件，在项目中可以灵活使用，让前端开发如虎添翼。
									轻量高效、国产开源：拼图基于应用广泛jQuery插件，轻量高效；相对于国外的前端框架，拼图前端框架侧重于对中文的支持，符合国人的视觉及体验，实现到国内主流浏览器的支持，减少兼容性测试时间，提高开发效率。</p>
							</div>
							<div class="text-right padding hidden-l">
								<!-- <b class="button bg-green text-big icon-thumbs-up dialogs" data-toggle="click" data-target="#div_ds" data-mask="0" data-width="50%">喜欢</b>&nbsp;
								<b class="button bg-red text-big icon-thumbs-up dialogs" data-toggle="click" data-target="#div_ds" data-mask="0" data-width="50%">讨厌</b>&nbsp;
								 -->
								<div class="bdsharebuttonbox">
									<a href="#" class="bds_more" data-cmd="more"></a>
									<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
									<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">
									</a>
									<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
									<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
									<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
								</div>
								<script>
									window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "1", "bdSize": "24" }, "share": {}, "image": { "viewList": ["qzone", "tsina", "tqq", "renren", "weixin"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"] } };
									with(document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
								</script>
							</div>
							 <form method="post">
							<div class="form-group">
							 <div class="label">
							  <label for="readme"> 回复</label> 
							  </div>
							   <div class="field"> 
							   <textarea class="input" rows="5" cols="50" placeholder=""></textarea>
							    </div>
							     </div>
							      <div class="form-button"> 
							      <button class="button" type="submit">提交</button> 
							      </div>
							      </form>
 		
						</div>
					</div>
					
					</div>
			
			<!--          *********************     热门榜单         *********************           -->
			<div class="xl12 xm3">
			<!--          *********************     北美票房榜           *********************           -->
	<h2 class=" text-blue padding">北美票房榜</h2>
	<div class="float-right text-little">4月20-22日</div>
					<div class="padding-big ">
						<ul class="list-media list-underline">
							<li>
								<div class="media media-x">
									<a class="float-left  " >1</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">志明与春娇</a></div>
								</div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left  " >2</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">阿甘正传</a></div>	</div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left  " >3</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">环太平洋</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >4</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">杀死一只知更鸟</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left  " >5</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">有一个地方只有我们知道</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >6</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">红日</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >7</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">哈利波特</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >8</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">权利的游戏</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >9</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">律政俏佳人</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >10</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">三块广告牌</a></div></div>
							</li>
							
						</ul>
					</div>
					<br />
					<!--          *********************     中间内容           *********************           -->
					<h2 class=" text-blue padding">本周口碑榜</h2>
	<div class="float-right text-little">4月18-25日</div>
					<div class="padding-big ">
						<ul class="list-media list-underline">
							<li>
								<div class="media media-x">
									<a class="float-left  " >1</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">志明与春娇</a></div>
								</div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left  " >2</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">阿甘正传</a></div>	</div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left  " >3</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">环太平洋</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >4</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">杀死一只知更鸟</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left  " >5</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">有一个地方只有我们知道</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >6</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">红日</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >7</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">哈利波特</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >8</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">权利的游戏</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >9</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">律政俏佳人</a></div></div>
							</li>
							<li>
								<div class="media media-x">
									<a class="float-left " >10</a>
									<div class="media-body"><a  class=" text-green swing-hover" href="">三块广告牌</a></div></div>
							</li>
						</ul>
					</div>
					<br />
						<!--          *********************   top250      *********************           -->
					
					
								<div class="x20" style="padding-left:20px;padding-bottom:20px;">
				<div class="panal">
					<div class="panal-head" style="padding-bottom:10px;">
						<h2 class=" text-blue padding">M&E top250</h2>
						<span class="tab-more "><a class="text-green float-right" href="commodity_search.action?spname=">更多></a></span>
					</div>
					<hr />
					<div class="panal-body">
						<div class="media-inline"> 
							<div class="media x3 media-y"> 
								<a href=" "> <img style="width:80px; height:100px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>11</strong> 
								</div>
							</div> 
						  <div class="media x3 media-y "> 
						<a href=" "> <img style="width:80px; height:100px;" src="${pageContext.request.contextPath}/img/dianying2.jpg" class="radius" > 
						</a> 
						<div class="media-body"> 
						<strong>222</strong> </div>
						 </div> 
						 <div class="media x3 media-y clearfix"> 
								<a href=" "> <img style="width:80px; height:100px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>333</strong> 
								</div>
							</div> 
							<div class="media x3 media-y clearfix"> 
								<a href=" "> <img style="width:80px; height:100px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>4444</strong> 
								</div>
							</div> 
							<div class="media x3 media-y clearfix"> 
								<a href=" "> <img style="width:80px; height:100px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>媒</strong> 
								</div>
							</div>
							<div class="media x3 media-y clearfix"> 
								<a href=" "> <img style="width:80px; height:100px;" src="${pageContext.request.contextPath}/img/dianying1.jpg" class="radius"> </a> 
								<div class="media-body"> 
								<strong>媒体标</strong> 
								</div>
							</div>
							
	
						 </div>
					</div>
				</div>
			</div>
			</div>
				</div>
				<!--          *********************     热门电视剧         *********************           -->
			</div>
		</div>
	</div>
	<!--          *********************     中间内容           *********************           -->
	<%-- <div class="container">
		<div class="line">
			<h2>
				<i class="fa fa-heart"></i>热门推荐
			</h2>
			<hr />
			<div class="line">
				<div class="x3">
					<ul class="x3-a-style">
					<s:iterator value="tuiJians" status="l">
					
						<li><a href="#">${name}</a>
						</li>
						<li>&nbsp;</li>
						</s:iterator>
					</ul>
				</div>
				<div class="x6">
					<div class="line">
						<div class="x4">
							<img src="img/ear-1.jpg" />
						</div>
						<div class="x4">
							<img src="img/ear-2.jpg" />
						</div>
						<div class="x4">
							<img src="img/ear-3.jpg" />
						</div>
					</div>
					<div class="line">
						<div class="x4-x4 x4">
							<h2>¥199.99</h2>
							<a href="Item-details.html">Beats Solo2 随身视听</a>
							<p>乐好乐数码专营店</p>
						</div>
						<div class="x4-x4 x4">
							<h2>¥299.99</h2>
							<a href="Item-details.html">EARISE/雅兰仕 Q8笔记本电脑音响多</a>
							<p>乐好乐数码专营店</p>
						</div>
						<div class="x4-x4 x4">
							<h2>¥199.99</h2>
							<a href="Item-details.html">Sony/索尼 MDR-XB450AP 3.5mm
								低音炫彩流行摇滚音乐手机通话</a>
							<p>乐好乐数码专营店</p>
						</div>
					</div>
				</div>
				<div class="x3">
					<div class="x3-line-img line">
						<img src="img/x6-head.png" />
					</div>
					<div class="x3-line-img line">
						<p class="p-first">戴上耳机，倾听</p>
						<p>想要暂时告别千篇一律的生活，踏上没有目的的旅途？记得在行囊里捎上自己心爱的耳机和音乐，有了它们，一路上，不寂寞。</p>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
	<!--          *********************     底部内容           *********************           -->
	<%@include file="../common/bottom.jspf" %>
</body>

</html>