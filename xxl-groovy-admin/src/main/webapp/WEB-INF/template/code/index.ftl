<#import "/common/common.macro.ftl" as netCommon>
<!DOCTYPE html>
<html>
<head>
  	<!-- Standard Meta -->
  	<meta charset="utf-8" />
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  	<!-- Site Properities -->
  	<title>Glue</title>
	<@netCommon.commonStyle />
	<!-- input -->
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/plugins/semantic-ui/dist/components/input.css">
	<!-- datatables -->
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/plugins/datatables/media/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/plugins/datatables/media/css/jquery.dataTables_themeroller.css">
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/static/plugins/datatables/media/css/dataTables.bootstrap.min.css">
</head>
<body>
	<@netCommon.commonHeader />
	
	<!-- code搜索框 -->
	<div class="ui five column stackable grid" style="padding: 1em;margin-top: 50px;">
	  	<div class="column">
			<div class="ui action left icon input">
		      	<i class="search icon"></i>
		      	<input type="text" placeholder="请输入codeName..." id="codeName" >
		      	<div class="ui teal button" id="searchBtn" >Search</div>
		      	
		      	<div class="ui teal button" id="addBtn" >新增</div>
		    </div>
	    </div>
    </div>
    
	<!-- code列表 -->
	<div class="column" style="padding: 1em;margin-top: 5px;">
		<table class="ui right aligned table" id="code_list" >
			<thead>
		        <th class="left aligned">id</th>
		        <th>name</th>
		        <th>源码</th>
		        <th>备注</th>
		        <th>新增时间</th>
		        <th>更新时间</th>
		        <th>操作</th>
			</thead>
	      	<tbody></tbody>
		</table>
	</div>
	
	<@netCommon.commonFooter />

<script src="${request.contextPath}/static/plugins/requirejs/requirejs.2.1.22.min.js" data-main="${request.contextPath}/static/js/requirejs.config" ></script>
<script>
var base_url = '${request.contextPath}/';
require(['index']);
require(['code.index']);
</script>
</body>
</html>
