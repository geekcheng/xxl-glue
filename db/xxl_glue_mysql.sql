/*
Navicat MySQL Data Transfer

Source Server         : meme-127.0.0.1
Source Server Version : 50544
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2016-01-08 22:50:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xxl_groovy_code_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_groovy_code_info`;
CREATE TABLE `xxl_groovy_code_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `source` text,
  `remark` varchar(255) NOT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_groovy_code_info
-- ----------------------------
INSERT INTO `xxl_groovy_code_info` VALUES ('8', 'code_07', 'package com.xxl.groovy.example.service.impl;\n\nimport java.util.Map;\n\nimport com.xxl.groovy.example.service.IDemoHandler;\n\nimport javax.annotation.Resource;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport com.xxl.groovy.core.GlueLoader;\n\npublic class DemoHandlerImpl implements IDemoHandler {\n\n    @Resource\n	private GlueLoader dbGlueLoader;\n	\n	@Override\n	public Object handle(Map<String, Object> params) {\n	    System.out.println(dbGlueLoader);\n		return 1 + 8;\n	}\n	\n}\n', '修改返回值信息', '2016-01-02 16:28:43', '2016-01-08 21:46:06');
INSERT INTO `xxl_groovy_code_info` VALUES ('9', 'load_timestamp_util', 'package com.xxl.groovy.example.service.impl;\n\nimport java.util.Map;\n\nimport com.xxl.groovy.example.service.IDemoHandler;\n\nimport javax.annotation.Resource;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport com.xxl.groovy.core.GlueLoader;\n\npublic class DemoHandlerImpl implements IDemoHandler {\n\n    // 支持注入您的自定义服务\n    //@Resource \n	//private DemoServiceLoader demoService;\n	\n	@Override\n	public Object handle(Map<String, Object> params) {\n		return System.currentTimeMillis();\n	}\n	\n}\n', '内部代码重构优化', '2016-01-08 21:52:24', '2016-01-08 21:55:39');

-- ----------------------------
-- Table structure for xxl_groovy_code_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_groovy_code_log`;
CREATE TABLE `xxl_groovy_code_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `source` text,
  `remark` varchar(255) NOT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxl_groovy_code_log
-- ----------------------------
