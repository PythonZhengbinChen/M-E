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
	</head>

	<body>
		<div class="Manage-line line">
			<div class="tab table-bordered">
				<div class="tab-head">
					<strong><i class="fa fa-user"></i>新闻管理</strong> <span class="tab-more"><a href="javascript:history.go(-1)">返回上一页</a></span>
					<ul class="tab-nav">
						<li ><a href="#tab-start">新闻</a> </li>
						<li><button type="button" class="button-small">添加</button></li>
					</ul>
				</div>
				<div class="tab-body">
					<div class="tab-panel active" id="tab-start">
						<div class="line">
							<div class="x9">

							</div>
							
						</div>
						<table class="table table-striped">
						<thead>
							<tr>
							<th>编号</th>
								<th>
									名称
								</th>
								<th>
									作者
								</th>
								<th>
									内容
								</th>
								<th>
									编辑
								</th>
							</tr>
							</thead>
							<tbody>
									<tr>
									
										<td>1</td>
										<td>志明与春娇</td>
									<td>余文乐</td>
										<td>sdfd</td>
										<td>
										
								<button class="button button-small bg-main dialogs" data-toggle="click" data-target="#mydialog" data-mask="1" data-width="50%"> 编辑</button> 
								<div id="mydialog"> <div class="dialog"> 
								<div class="dialog-head"> <span class="close rotate-hover"></span><strong>编辑新闻内容</strong> </div> 
								<div class="dialog-body">
								<textarea class="input" id="detail" name="detail" placeholder="新闻详细内容" data-validate="required:必填"></textarea>
					
								</div>
								 <div class="dialog-foot"> <button class="button dialog-close"> 取消</button> <button class="button bg-green"> 确认</button> </div> </div> </div>
								 <button class="class="button  bg-main button-small">删除</button>
							
										</td>
									</tr>
									</tbody>
						</table>
					</div>

			</div>
		</div>
		</div>
		<!--    *****************************     提示修改信息DIV                    *******************************************            -->
		<div id="Admin-Info-modify">
			<div class="dialog">
				<div class="dialog-head">
					<span class="close rotate-hover"></span><strong>修改</strong>
				</div>
				<div class="dialog-body">
					<form action="admin_update.action" method="post">
						<div class="line">
							<div class="x3">
								<p><strong>账号：</strong></p>
							</div>
							<div class="x2">

							</div>
							<div class="x3">
								<p><strong>姓名：</strong></p>
							</div>
							<div class="x4">

							</div>
						</div>
						<div class="line">
							<div class="x3">
								<input type="text" class="input" value="${sessionScope.adminLoginer.username}" readonly="readonly"/>
							</div>
							<div class="x2">

							</div>
							<div class="x3">
								<input type="text" class="input" name="name" value="${sessionScope.adminLoginer.name}" />
							</div>
							<div class="x4">

							</div>
						</div>
						
						<div class="line">
							<p><strong>联系方式：</strong></p>
						</div>
						<div class="line">
							<div class="x8">
								<input type="text" class="input" name="phone" value="${sessionScope.adminLoginer.phone}" />
							</div>
							<div class="x4">

							</div>
						</div>
						<div class="line">
							<div class="x3">
								<p><strong>入职年份：</strong></p>
							</div>
							<div class="x2">

							</div>
							
							<div class="x4">

							</div>
						</div>
						<div class="line">
							<div class="x3">
								<input type="text" class="input" value="${sessionScope.adminLoginer.createTime}" readonly="readonly"/>
							</div>
							<div class="x2">

							</div>
							
							<div class="x4">

							</div>
						</div>
												<div class="line">
							<ul>
								<li>&nbsp;</li>
								<li>&nbsp;</li>
							</ul>
						</div>
						<div class="line">
							<div class="x4">
								<input type="submit" class="button bg-green" value="确认修改" onclick="update();"/>
							</div>
							<div class="x4">
								<input type="reset" class="button bg" value="重新填写" />
							</div>
							<div class="x4">

							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
<script type="text/javascript">
function update(){
	alert("修改成功后，重新登录生效！");
}
function uppas(){
	if($("#newpas").val()!=$("#pas").val()){
		alert("两次输入的密码不一致！");
	}else{
	var url="admin_updatepas.action";
	var date={"oldpas":$("#oldpas").val(),"newpas":$("#newpas").val()};
	$.post(url,date,function(reslut){
		alert(reslut);
	});
	}
}
</script>
</html>