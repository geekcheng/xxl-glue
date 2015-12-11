<#macro commonStyle>
  	<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/plugins/semantic-ui/dist/semantic.min.css">
  	<style type="text/css">
	body {
		background-color: #FFFFFF;
  	}
  	.ui.menu .item img.logo {
    	margin-right: 1.5em;
  	}
  	.main.container {
    	margin-top: 7em;
  	}
  	.wireframe {
    	margin-top: 2em;
  	}
  	.ui.footer.segment {
		margin: 5em 0em 0em;
    	padding: 5em 0em;
  	}
  	</style>
</#macro>

<#macro commonScript>
	
</#macro>

<#macro commonHeader>
<div class="ui fixed inverted menu">
	<div class="ui container">
		<a href="#" class="header item">
			<img class="logo" src="${request.contextPath}/static/image/logo.png">
	    	Groovy
	  	</a>
	    <a href="#" class="item">首页</a>
	  	<div class="ui simple dropdown item">
			父菜单下拉 <i class="dropdown icon"></i>
			<div class="menu">
				<a class="item" href="#">子菜单A</a>
				<a class="item" href="#">子菜单B</a>
				<div class="divider"></div>
				<div class="header">组标题</div>
				<div class="item">
	            	<i class="dropdown icon"></i>
	            	子菜单组
		            <div class="menu">
		              <a class="item" href="#">子菜单C</a>
		              <a class="item" href="#">子菜单D</a>
		            </div>
				</div>
				<a class="item" href="#">子菜单E</a>
			</div>
		</div>
		<a href="${request.contextPath}/login" class="item right">登陆</a>
		<a href="#" class="item">注册</a>
    </div>
</div>
</#macro>

<#macro commonFooter >
<div class="ui inverted vertical footer segment">
	<div class="ui container">
		<div class="ui stackable inverted divided equal height stackable grid">
			<div class="three wide column">
				<h4 class="ui inverted header teal">About</h4>
	          	<div class="ui inverted link list">
		            <a href="#" class="item">网站地图</a>
		            <a href="#" class="item">联系我们</a>
		            <a href="#" class="item">意见反馈</a>
		            <a href="#" class="item disabled">赞助</a>
	          	</div>
			</div>
	        <div class="three wide column">
	          	<h4 class="ui inverted header teal">服务</h4>
	          	<div class="ui inverted link list">
		            <a href="#" class="item">在线教程</a>
		            <a href="#" class="item">接入文档</a>
		            <a href="#" class="item">问题汇总</a>
	          	</div>
			</div>
			<div class="seven wide column">
				<h4 class="ui inverted header">热米饭里拌什么最好吃？</h4>
				<p>土豆烧牛肉。赫鲁晓夫说土豆烧牛肉是共产主义，此言不虚。</p>
			</div>
		</div>
	</div>
</div>
</#macro>

<#macro comAlert >
	<!-- ComAlert.模态框Modal -->
	<div class="modal fade" id="ComAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!--	<div class="modal-header"><h4 class="modal-title"><strong>提示:</strong></h4></div>	-->
	         	<div class="modal-body"><div class="alert alert-success"></div></div>
	         	<div class="modal-footer">
	         		<div class="text-center" >
	            		<button type="button" class="btn btn-default ok" data-dismiss="modal" >确认</button>
	            	</div>
	         	</div>
			</div>
		</div>
	</div>
	<!-- ComConfirm.模态框Modal -->
	<div class="modal fade" id="ComConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
	         	<div class="modal-body"><div class="alert alert-success"></div></div>
	         	<div class="modal-footer">
	         		<div class="text-center" >
	            		<button type="button" class="btn btn-primary ok" data-dismiss="modal" >确认</button>
	            		<button type="button" class="btn btn-default cancel" data-dismiss="modal" >取消</button>
	            	</div>
	         	</div>
			</div>
		</div>
	</div>
	<script>
		// 通用提示
		var ComAlert = {
			show:function(type, msg, callback){
				// 弹框初始
				if (type == 1) {
					$('#ComAlert .alert').attr('class', 'alert alert-success');
				} else {
					$('#ComAlert .alert').attr('class', 'alert alert-warning');
				}
				$('#ComAlert .alert').html(msg);
				$('#ComAlert').modal('show');
				
				$('#ComAlert .ok').click(function(){
					$('#ComAlert').modal('hide');
					if(typeof callback == 'function') {
						callback();
					}
				});
				
				// $("#ComAlert").on('hide.bs.modal', function () {	});	// 监听关闭
			}
		};
		// 通用确认弹框
		var ComConfirm = {
			show:function(msg, callback){
				// 弹框初始
				$('#ComConfirm .alert').attr('class', 'alert alert-warning');
				$('#ComConfirm .alert').html(msg);
				$('#ComConfirm').modal('show');
				
				$('#ComConfirm .ok').unbind("click");	// 解绑陈旧事件
				$('#ComConfirm .ok').click(function(){
					$('#ComConfirm').modal('hide');
					if(typeof callback == 'function') {
						callback();
						return;
					}
				});
				
				$('#ComConfirm .cancel').click(function(){
					$('#ComConfirm').modal('hide');
					return;
				});
			}
		};
	</script>
</#macro>