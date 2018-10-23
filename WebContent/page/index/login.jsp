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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/font-awesome-4.5.0/css/font-awesome.min.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pintuer.js"></script>
	</head>

	<body>
		<!--********************************          首栏              ***********************************-->
		<div class="navbar bg-green-light bg-inverse radius ">
			<div class="navbar-container container">
				<div class="line">
				<a href="user_index.action">
					<div class="x3">
						<img src="${pageContext.request.contextPath}/img/me.png"
							class="nav_logo" />
					</div>
					</a>
					
				</div>
			</div>
		</div>
		<!--********************************          中部登录              ***********************************-->
		<div class="bg-blue ">
			<div class="container">
				<div class="line-login line">
					<div class="x7">
						<div class="line">
							<div class="x6">
								<img src="${pageContext.request.contextPath}/img/timg.jpg" />
							</div>
						</div>

					</div>
					<div class="x5">
						<div class="login-x5">
							<form method="post" class="form-inline" action="user_login.action" id="form1">
								<div class="form-group">
									<div class="field">
										<div class="input-group">
											<h3>账户登录</h3>
											<hr />
										</div>
									</div>
									<div class="field">
										<div class="input-group">
											<span class="addon fa fa-user"></span>
											<input type="text" class="input" size="27" name="username" placeholder="账号/手机号" />
										</div>
									</div>
									<div class="field">
										<div class="input-group">
											<span class="addon fa fa-lock"></span>
											<input type="password" class="input" size="27" name="password" placeholder="密码" />
										</div>
									</div>
									<div class="field">
										<div class="input-group">
											<span class="addon fa fa-photo"></span>
											<input type="hidden" id="hd" value="${authCode}"/>
											<input type="text" class="input" id="verify-input" size="10" placeholder="输入验证码" maxlength="4" onblur="yanzheng();"/>
											<img src="${pageContext.request.contextPath}/AuthImg" id="authCode"  onclick="changeImg()"/>
										</div>
									</div>
									<div class="field">
										<div class="input-group">
											<input type="button" id="tj" class="button bg-yellow button-small button-block" value="登录" onclick="return yanzheng();"/>
										</div>
									</div>
									<div class="line">
										<div class="x7">
											<a>忘记密码</a>
										</div>
										<div class="x7-1 x7">
											<a href="user_regar.action">立即注册</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--********************************          底部导航              ***********************************-->
		<%@include file="../common/bottom.jspf" %>
	</body>
<script type="text/javascript">
//alert("${authCode}");
function changeImg(){    
    $("#authCode").attr("src","${pageContext.request.contextPath}/AuthImg?d="+new Date().getTime());    
}  
function yanzheng(){
	var url="user_yanzhengma.action";
	$.post(url,function(code){		
		document.getElementById("form1").submit();
		return true;
	/* if($("#verify-input").val()==code){
		
		document.getElementById("form1").submit();
		return true;
	}else{
		alert("验证码错误，请重试！");
		return false;
	} */
	});
	}
</script>
</html>