<!DOCTYPE html>
<html>
<head>
  	<!-- Standard Meta -->
  	<meta charset="utf-8" />
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  	<!-- Site Properities -->
  	<title>登陆</title>
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/plugins/semantic-ui/dist/semantic.min.css">
	<style type="text/css">
    	body {
      		background-color: #DADADA;
    	}
    	body > .grid {
      		height: 100%;
    	}
		.image {
      		margin-top: -100px;
		}
    	.column {
      		max-width: 450px;
    	}
	</style>
</head>
<body>

<div class="ui middle aligned center aligned grid">
	<div class="column">
		<h2 class="ui teal image header">
			<img src="${request.contextPath}/static/image/logo.png" class="image">
			<div class="content">登陆您的账号</div>
	    </h2>
	    <form class="ui large form">
	      	<div class="ui stacked segment">
				<div class="field">
		          	<div class="ui left icon input">
		            	<i class="user icon"></i>
		            	<input type="text" name="email" placeholder="请输入邮箱地址">
		          	</div>
				</div>
		        <div class="field">
		          	<div class="ui left icon input">
		            	<i class="lock icon"></i>
		            	<input type="password" name="password" placeholder="请输入密码">
		          	</div>
				</div>
		        <div class="ui fluid large teal submit button">Login</div>
	      	</div>
	      	<div class="ui error message"></div>
	    </form>
		<div class="ui message"> 第一次? <a href="#">注册</a></div>
	</div>
</div>

<script src="${request.contextPath}/static/plugins/jquery/jquery.min.js"></script>
<script src="${request.contextPath}/static/plugins/semantic-ui/dist/components/form.js"></script>
<script src="${request.contextPath}/static/plugins/semantic-ui/dist/components/transition.js"></script>
<script>
var base_url = '${request.contextPath}/';
$(document).ready(function() {
	$('.ui.form').form({
		fields: {
			email: {
				identifier  : 'email',
              	rules: [
                	{
                  		type   : 'empty',
                  		prompt : '请输入邮箱'
                	},
                	{
                  		type   : 'email',
                  		prompt : '请您输入正确的邮箱'
                	}
              	]
            },
            password: {
              	identifier  : 'password',
              	rules: [
                	{
                  		type   : 'empty',
                  		prompt : '请输入密码'
                	},
                	{
                  		type   : 'length[6]',
                  		prompt : '请您输入长度超过6位的密码'
                	}
              	]
			}
		},
		onSuccess: function(){
			toIndex();
		}
	});
	
	function toIndex(){
		window.location.href = base_url;
	}
});
</script>
</body>
</html>
