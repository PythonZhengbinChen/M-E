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
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/web.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/font-awesome-4.5.0/css/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pintuer.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
		<script src="${pageContext.request.contextPath}/js/Select-More.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="x12  Manage-line line">
			<div class="tab table-bordered">
				<div class="tab-head">
					<span class="tab-more"><a href="javascript:history.go(-1)">返回上一页</a></span>
					<ul class="tab-nav">
						<li class="active"><a href="#tab-start">电影具体内容</a></li>
					</ul>
				</div>
				<!-- 电影添加页面 -->
			<c:if test="${isChange == '0' }">
				<div class="x9 tab-body">
			<form method="post" action="adminDianying_addDianyingInfo.action" class="form-small"> 
				<input hidden="hidden" name="id" id="hideId">
					<div class="form-group">
					 <div class="label"> 
					 <label for="username">电影名</label> </div>
                 <div class="field"> 
                 <input data-validate="required:必填" type="text" class="input" id="name" name="name" size="30" placeholder="" /> 
                 </div> </div>
                  <div class="form-group"> 
                  <div class="label"> <label for="daoyan"> 导演</label> </div> 
                  <div class="field"> <input type="text" class="input" id="daoyan" name="daoyan" size="30" placeholder="请输入导演名" /> 
                  </div> </div>
                  <div class="form-group"> 
                  <div class="label"> <label for="bianju"> 编剧</label> </div> 
                  <div class="field"> <input type="text" class="input" id="bianju" name="bianju" size="30" placeholder="请输入编剧名" /> 
                  </div> </div>
                  <div class="form-group"> 
                  <div class="label"> <label for="zhuyan"> 主演</label> </div> 
                  <div class="field"> <input type="text" class="input" id="zhuyan" name=""zhuyan"" size="30" placeholder="请输入主演名" /> 
                  </div> </div>
	              <div class="form-group">
						<div class="label"> 
						<label for="age"> 电影类型</label> 
						</div>
					 <div class="field"> 
						 <select class="input" name="leixing"> 
						 <option>喜剧</option> <option>惊悚</option> <option>悬疑</option> <option>爱情</option> 
						 </select>
					 </div> 
				 </div>
				  <div class="form-group">
				  	<div class="label"> 
						<label for="age">制片国家</label> 
					</div>
				  	<div class="field"> <input type="text" class="input" id="guojia" name="guojia" size="30" placeholder="制片国家" /></div> 
	               </div>
                  <div class="form-group">
                  <div class="label"> 
						<label for="age">语言</label> 
					</div>
                   <div class="field"> <input type="text" class="input" id="language" name="language" size="30" placeholder="语言" /> 
                  </div></div>
                   <div class="form-group">
                   <div class="label"> 
						<label for="age">上映时间</label> 
					</div>
                   <div class="field"> <input type="text" class="input" id="shanyingshijian" name="shanyingshijian" size="30" placeholder="上映时间" /> 
                   </div></div>
                    <div class="form-group">
                    <div class="label"> 
						<label for="age">片长</label> 
					</div>
                   <div class="field"> <input type="text" class="input" id="pianchang" name="pianchang" size="30" placeholder="片长" /> 
                  </div></div>
                 <div class="form-group"> 
                  	<div class="label"> <label for="detail"> 电影描述</label> 
                  	</div> 
                  	<div class="field"> 
                  	<textarea class="input padding" style="height: 100px;" id="xiangxi" name="xiangxi" placeholder="电影详细内容" data-validate="required:必填"></textarea>
					</div>
				</div>
				<input hidden="hidden" name="imgurl"/>
				<button style="display: none;" id="addSubmitBtn" type="submit"> 提交</button>
				</form>
				<div class="form-group">
					<div id="imgDiv">
					 </div>
					 <form action="" method="post"   class="form-small" enctype="multipart/form-data" name="upload_form">
					  	<div class="label"> <label for="detail"> 电影海报</label> 
                  		</div>
					 	<input name="picFile" id="picAddFile" type="file" accept="image/gif, image/jpeg"/>
					  	<input name="upload" type="button" onclick="picAdd()" value="上传" />
					</form>
                  </div>
				<div class="form-button"> <button class="button" onclick="$('#addSubmitBtn').click()" type="button"> 提交</button> </div>
				</div> 
			</c:if>
			<!-- 电影修改页面 -->
			<c:if test="${isChange == '1' }">
				<div class="x9 tab-body">
			<form method="post" action="adminDianying_updateDianyingInfo.action" class="form-small"> 
				<input hidden="hidden" name="id" value="${dianying.id }">
					<div class="form-group">
					 <div class="label"> 
					 <label for="username">电影名</label> </div>
                 <div class="field"> 
                 <input data-validate="required:必填" type="text" class="input" id="name" value="${ dianying.name}" name="name" size="30" placeholder="" /> 
                 </div> </div>
                  <div class="form-group"> 
                  <div class="label"> <label for="daoyan"> 导演</label> </div> 
                  <div class="field"> <input type="text" class="input" id="daoyan" value="${ dianying.daoyan}" name="daoyan" size="30" placeholder="请输入导演名" /> 
                  </div> </div>
                  <div class="form-group"> 
                  <div class="label"> <label for="bianju"> 编剧</label> </div> 
                  <div class="field"> <input type="text" class="input" id="bianju" value="${ dianying.bianju}" name="bianju" size="30" placeholder="请输入编剧名" /> 
                  </div> </div>
                  <div class="form-group"> 
                  <div class="label"> <label for="zhuyan"> 主演</label> </div> 
                  <div class="field"> <input type="text" class="input" id="zhuyan" value="${ dianying.zhuyan}" name="zhuyan" size="30" placeholder="请输入主演名" /> 
                  </div> </div>
	              <div class="form-group">
						<div class="label"> 
						<label for="age"> 电影类型</label> 
						</div>
					 <div class="field"> 
						 <select class="input" value="${ dianying.leixing}"  name="leixing"> 
						 <option>喜剧</option> <option>惊悚</option> <option>悬疑</option> <option>爱情</option> 
						 </select>
					 </div> 
				 </div>
				  <div class="form-group">
				  	<div class="label"> 
						<label for="age">制片国家</label> 
					</div>
				  	<div class="field"> <input type="text" class="input" id="guojia" value="${ dianying.guojia}" name="guojia" size="30" placeholder="制片国家" /></div> 
	               </div>
                  <div class="form-group">
                  <div class="label"> 
						<label for="age">语言</label> 
					</div>
                   <div class="field"> <input type="text" class="input" id="language" value="${dianying.language}" name="language" size="30" placeholder="语言" /> 
                  </div></div>
                   <div class="form-group">
                   <div class="label"> 
						<label for="age">上映时间</label> 
					</div>
                   <div class="field"> <input type="text" class="input" id="shanyingshijian" value="${ dianying.shanyingshijian}" name="shanyingshijian" size="30" placeholder="上映时间" /> 
                   </div></div>
                    <div class="form-group">
                    <div class="label"> 
						<label for="age">片长</label> 
					</div>
                   <div class="field"> <input type="text" class="input" id="pianchang" value="${ dianying.pianchang}" name="pianchang" size="30" placeholder="片长" /> 
                  </div></div>
                 <div class="form-group"> 
                  	<div class="label"> <label for="detail"> 电影描述</label> 
                  	</div> 
                  	<div class="field"> 
                  	<textarea class="input padding" style="height: 100px;" id="xiangxi" name="xiangxi" placeholder="电影详细内容" data-validate="required:必填">${ dianying.xiangxi}</textarea>
					</div>
				</div>
				<input hidden="hidden" name="imgurl" value="${ dianying.id}.jpg"/>
				<button style="display: none;" id="submitBtn" type="submit"> 提交</button>
				</form>
				<div class="form-group">
					<div id="imgDiv">
						<img style="width:150px; height:200px;" src="${pageContext.request.contextPath}/moviePic/${dianying.id}.jpg" class="radius"> 
					 </div>
					 <form action="" method="post"   class="form-small" enctype="multipart/form-data" name="upload_form">
					  	<div class="label"> <label for="detail"> 电影海报</label> 
                  		</div>
                  		<input hidden="hidden" name="id" value="${dianying.id }">
					 	<input name="picFile" id="picFile" type="file" accept="image/gif, image/jpeg"/>
					  	<input name="upload" type="button" onclick="picUpdate()" value="上传" />
					</form>
                  </div>
				<div class="form-button"> <button class="button" onclick="submitClick()" type="button"> 提交</button> </div>
				</div> 
			</c:if>
				
			</div>
		</div>

		<!--    *****************************     提示修改信息DIV                    *******************************************            -->
	</body>

<script type="text/javascript">
function submitClick() {
	$('#submitBtn').click();
}

function picUpdate() { 
	//console.log($("#picFile").val());
	$.ajaxFileUpload({
	      url: "fileUpdate.action", 
	      data : {
	    	  id : "${id}",
          },
	      //data:{path:$("input[type='file']").val()},  
	      fileElementId: "picFile",  
	      dataType: "text",  
	      success: function(data, status){
	    	  console.log(data);
	    	  if(data != "isUpdateDianying") {
	    		  $("#hideId").val(data);
	    	  }
	          $("#imgDiv").html("");
	          var str = '<img style="width:150px; height:200px;" src="${pageContext.request.contextPath}/moviePic/${dianying.id}.jpg?number='+Math.random()+'" class="radius"/>';
	          $("#imgDiv").append(str);
	      },
	      error: function(e) {
	    	  console.log(e);
	      }
	});
}

function picAdd() { 
	//console.log($("#picFile").val());
	$.ajaxFileUpload({
	      url: "fileUpdate.action",
	      //data:{path:$("input[type='file']").val()},  
	      fileElementId: "picAddFile",  
	      dataType: "text",  
	      success: function(data, status){
	    	  console.log(data);
	    	  if(data != "isUpdateDianying") {
	    		  $("#hideId").val(data);
	    	  }
	          $("#imgDiv").html("");
	          var str = '<img style="width:150px; height:200px;" src="${pageContext.request.contextPath}/moviePic/'+data+'.jpg?number='+Math.random()+'" class="radius"/>';
	          $("#imgDiv").append(str);
	      },
	      error: function(e) {
	    	  console.log(e);
	      }
	});
}
</script>
</html>