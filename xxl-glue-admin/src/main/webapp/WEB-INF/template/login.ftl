<#import "/common/common.macro.ftl" as netCommon>
<!DOCTYPE html>
<html>
<head>
  	<!-- Standard Meta -->
  	<meta charset="utf-8" />
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  	<!-- Site Properities -->
  	<title>登陆</title>
	<@netCommon.commonStyle />
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
				<div class="content">Glue</div>
		    </h2>
		    <form class="ui large form" id="loginForm">
		      	<div class="ui stacked segment">
					<div class="field">
			          	<div class="ui left icon input">
			            	<i class="user icon"></i>
			            	<input type="text" name="email" placeholder="请输入邮箱地址" value="admin@qq.com" >
			          	</div>
					</div>
			        <div class="field">
			          	<div class="ui left icon input">
			            	<i class="lock icon"></i>
			            	<input type="password" name="password" placeholder="请输入密码" value="123456" >
			          	</div>
					</div>
			        <div class="ui fluid large teal submit button">Login</div>
		      	</div>
		      	<div class="ui error message"></div>
		    </form>
			<div class="ui message"> 第一次? <a href="#">注册</a></div>
		</div>
	</div>
	<#-- 
	1、避免阻塞，提高了 js 的加载性能；
	2、通过编程使用 require 方法加载，而不是<script>硬写，更加灵活。
	主数据:加载requirejs脚本的script标签加入了data-main属性，这个属性指定的js将在加载完reuqire.js后处理，我们把require.config的配置加入到data-main后，就可以使每一个页面都使用这个配置
	data-main还有一个重要的功能，当script标签指定data-main属性时，require会默认的将data-main指定的js为根路径
	require参数而为callback函数中发现有$参数，这个就是依赖的jquery模块的输出变量，如果你依赖多个模块，可以依次写入多个参数来使用
	通过require加载的模块一般都需要符合AMD规范即使用define来申明模块，但是部分时候需要加载非AMD规范的js，这时候就需要用到另一个功能：shim
	shim解释起来也比较难理解，shim直接翻译为"垫"，其实也是有这层意思的，目前我主要用在两个地方
	1. 插件形式的非AMD模块，我们经常会用到jquery插件，而且这些插件基本都不符合AMD规范，比如jquery.form插件，这时候就需要将form插件"垫"到jquery中：
	-->

<script src="${request.contextPath}/static/plugins/requirejs/requirejs.2.1.22.min.js" data-main="${request.contextPath}/static/js/requirejs.config" ></script>
<script>
// 全局入参
var base_url = '${request.contextPath}/';
// 模块引入
require(['login'], function(status) {
	console.log(status);	// callback
});
</script>
</body>
</html>
