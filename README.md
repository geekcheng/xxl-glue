# 动态Bean配置平台：xxl-groovy

	技术积累：
	1. 整站静态花：freemarker生成html页面文件，写入物理磁盘；【freemarker】
	2. html格式邮件发送：freemarker生成html页面文件，邮件发送；【freemarker】
	3. dianping-pagelet：pagelet模块(本地module文件+ftl文件)生成html源码字符串，通过占位符${}写入页面；【freemarker】
	4. dianping-widget：widget模块(远程groovy文件+ftl文件)生成html源码字符串，通过占位符${}写入页面【groovy(“远程同步”并“动态编译”) + git + freemarker】
	(pagelet和widget内部API惊人的相似，实际上两者功能在一定程度上是重叠的，即Html生成;但是后者因为groovy和ftl代码“远程同步”并“动态编译”，支持动态更新，这是最大的区别)
	
	技术点：
	1. freemarker生成html;
	2. groovy动态编译，并继承Spring;
	3. groovy和ftl远程获取;
	
	目标：Bean支持在线更新，动态编译；
	1. ServiceImpl类型的Bean，groovy远程同步即可；
	2. 生成页面的Bean，groovy远程同步 + ftl数据库存储；
	
	步骤：
	1. 整合Ace Editor
	2. Code 单模块CRUD
	3. 模块划分
	4. 业务重构
	