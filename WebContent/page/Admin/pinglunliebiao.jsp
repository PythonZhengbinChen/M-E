<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/font-awesome-4.5.0/css/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pintuer.js"></script>
		<script src="${pageContext.request.contextPath}/js/Select-More.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="Manage-line line">
			<div class="tab table-bordered">
				<div class="tab-head">
					<strong><i class="fa fa-list-ul"></i>电影管理</strong> <span class="tab-more"><a href="javascript:history.go(-1)">返回上一页</a></span>
					<ul class="tab-nav">
						<li class="active"><a href="#tab-start">电影列表</a></li>
					</ul>
				</div>
				<div class="tab-body">
					<div class="tab-panel active" id="tab-start">
						<div class="line">
							<form action="adminOrder_sousuo.action" method="post">
								<div class="x6">
									<strong>电影号：</strong>
									<input type="text" name="orderId" placeholder="请输入电影号" />
									<input type="submit" id="" name="" class="much-search" value="搜索" />
								</div>
							</form>
						</div>
						<div class="table-responsive-y">
							<table class="table table-hover">
								<thead>
									<tr class="current">
										<th>编号</th>
										<th>主题</th>
										<th>电影</th>
										<th>用户</th>
										<th>评分</th>
										<th>评论时间</th>
										<th >操作</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="pinglunLists" status="l">
									<tr>
										<td>${l.index+1}</td>
										<td><a href="${pageContext.request.contextPath}/manager/adminPinglun_getPinglunInfo.action?pinglunid=${pinglunid}">${timu}</a></td>
										<td>${dianyingName}</td>
										<td>${username}</td>
										<td>${pingfen}</td>
										<td>${cretime}</td>
										<td><a href="${pageContext.request.contextPath}/manager/adminPinglun_getPinglunInfo.action?pinglunid=${pinglunid}" style="color: white;text-decoration: none;" target="main" class="button button-small bg-main text-">查看</a>
									<form method="post" style="display: inline" action="adminPinglun_deletePinglunInfo.action">
										<input type="hidden" name="pinglunid" value="${pinglunid}">
										<button type="submit" style="color: white;text-decoration: none;"  class="button button-small bg-red margin-left">删除</button>
									</form>
										</td>
									</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--    *****************************     提示修改信息DIV                    *******************************************            -->
	</body>

</html>