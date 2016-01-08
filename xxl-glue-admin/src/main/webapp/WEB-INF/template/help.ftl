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
</head>
<body>
	<@netCommon.commonHeader />
	<div class="ui main text container">
	    <h1 class="ui header">Glue</h1>
	    <p>Cease to struggle and you cease to live.</p>
	    <p>Accept what was and what is, and you’ll have more positive energy to pursue what will be.</p>
	    <img class="wireframe" src="${request.contextPath}/static/image/media-paragraph.png">
	    <img class="wireframe" src="${request.contextPath}/static/image/paragraph.png">
	    <img class="wireframe" src="${request.contextPath}/static/image/paragraph.png">
	    <img class="wireframe" src="${request.contextPath}/static/image/paragraph.png">
	    <img class="wireframe" src="${request.contextPath}/static/image/paragraph.png">
	    <img class="wireframe" src="${request.contextPath}/static/image/paragraph.png">
	    <img class="wireframe" src="${request.contextPath}/static/image/paragraph.png">
  	</div>
	<@netCommon.commonFooter />

<script src="${request.contextPath}/static/plugins/requirejs/requirejs.2.1.22.min.js" data-main="${request.contextPath}/static/js/requirejs.config" ></script>
<script>
var base_url = '${request.contextPath}/';
require(['common'], function(status) {
	console.log(status);
});
</script>
</body>
</html>
