<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>

<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center">
				<h1>用户登录</h1>
			</div>
		</div>
		<!-- 登录信息 -->
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form class="form-horizontal" id="form-login">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-10">
				      <input type="text" name="adminName" class="form-control" id="adminName" placeholder="Name">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      <input type="text" name="adminPassword" class="form-control" id="adminPassword" placeholder="Password">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" class="btn btn-success" id="login">Login</button>
				    </div>
				  </div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$("#login").click(function(){
			$.ajax({
				url:"${APP_PATH}/admin",
				type:"GET",
				data:$("#form-login").serialize(),
				success:function(result){
					//console.log(result);
					if(result.code==100){
						//alert(result.extend.adminName);
						window.location.href = "${APP_PATH}/success/"+result.extend.adminName;
					}else{
						alert(result.extend.error);
					}
				}
			});
		});
	</script>
	
</body>

</html>
