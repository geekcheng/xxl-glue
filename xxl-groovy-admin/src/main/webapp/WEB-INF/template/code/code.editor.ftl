<#import "/common/common.macro.ftl" as netCommon>
<!DOCTYPE html>
<html>
<head>
  	<!-- Standard Meta -->
  	<meta charset="utf-8" />
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  	<!-- Site Properities -->
  	<title>Groovy配置中心</title>
	<@netCommon.commonStyle />
    <style>
    html {height: 100%;width: 100%;overflow: hidden;}
	body {overflow: hidden;margin: 0;padding: 0;height: 100%;width: 100%;font-size: 12px;font-family: Arial, Helvetica, sans-serif, Tahoma, Verdana, sans-serif;/*background: rgb(14, 98, 165);color: white;*/}
	#ace-editor {position: absolute;top: 50px;left: 10px;bottom: 10px;right: 0px;/*background: white;*/}
    </style>
</head>
<body>
<!-- tools -->
<div class="ui fixed inverted menu">
	<div class="ui container">
	    <a href="${request.contextPath}/" class="item">返回</a>
	    <a href="javascript:;" class="item right" id="save" >保存</a>
    </div>
</div>

<!-- editor -->
<div id="ace-editor"></div>
<<<<<<< HEAD
<textarea rows="3" cols="20" id="codeInfo_source" style="display:none;" >${codeInfo.source}</textarea>
=======
<textarea rows="3" cols="20" id="codeInfo_source">${codeInfo.source}</textarea>
>>>>>>> branch 'master' of https://github.com/xuxueli/xxl-groovy.git

<script src="${request.contextPath}/static/plugins/requirejs/requirejs.2.1.22.min.js" data-main="${request.contextPath}/static/js/requirejs.config" ></script>
<script>
<<<<<<< HEAD
<#if !codeInfo?exists>
	alert("CODE ID不存在");
	return;		
</#if>

=======
>>>>>>> branch 'master' of https://github.com/xuxueli/xxl-groovy.git
// 更新字段
var codeInfo_id = '${codeInfo.id}';
var codeInfo_source = document.getElementById('codeInfo_source').value;
var codeInfo_remark = "${codeInfo.remark}";

// 加载js
var base_url = '${request.contextPath}/';
require(['code.editor']);
</script>

</body>
</html>