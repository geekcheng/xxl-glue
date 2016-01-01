/*
Navicat MySQL Data Transfer

Source Server         : meme-127.0.0.1
Source Server Version : 50544
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2016-01-01 23:19:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xxl_groovy_code_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_groovy_code_info`;
CREATE TABLE `xxl_groovy_code_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `source` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xxl_groovy_code_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_groovy_code_log`;
CREATE TABLE `xxl_groovy_code_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `source` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
