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
										<th>电影名</th>
										<th>导演</th>
										<th>主演</th>
										<th>国家</th>
										<th>上映时间</th>
										<th>类型</th>
										<th >操作</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="dianyingList" status="l">
									<tr>
										<td>${l.index+1}</td>
										<td><a href="adminDianying_dianyingChange.action?id=${id }" target="main">${name}</a></td>
										<td>${daoyan}</td>
										<td>${zhuyan}</td>
										<td>${guojia}</td>
										<td>${shanyingshijian}</td>
										<td>${leixing}</td>
										<td><a href="adminDianying_dianyingChange.action?id=${id }" style="color: white;text-decoration: none;" target="main" class="button button-small bg-main text-">修改</a>
									<form method="post" style="display: inline" action="adminDianying_deleteDianyingInfo.action">
										<input type="hidden" name="id" value="${id}">
										<button type="submit" style="color: white;text-decoration: none;"  class="button button-small bg-red margin-left">删除</button>
									</form>
										</td>
									</form>
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