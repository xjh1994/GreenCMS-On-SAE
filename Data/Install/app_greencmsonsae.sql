-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2014 年 03 月 09 日 09:51
-- 服务器版本: 5.5.23
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `app_greencmsonsae`
--

-- --------------------------------------------------------

--
-- 表的结构 `access`
--

DROP TABLE IF EXISTS `access`;
CREATE TABLE IF NOT EXISTS `access` (
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '1',
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限分配表';

--
-- 转存表中的数据 `access`
--


-- --------------------------------------------------------

--
-- 表的结构 `addons`
--

DROP TABLE IF EXISTS `addons`;
CREATE TABLE IF NOT EXISTS `addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `addons`
--

INSERT INTO `addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"2","comment_uid_youyan":"1894186","comment_short_name_duoshuo":"greencmsduoshuo","comment_form_pos_duoshuo":"buttom","comment_data_list_duoshuo":"10","comment_data_order_duoshuo":"desc"}', 'xjh1994', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cats`
--

DROP TABLE IF EXISTS `cats`;
CREATE TABLE IF NOT EXISTS `cats` (
  `cat_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cat_father` bigint(10) NOT NULL DEFAULT '0',
  `cat_slug` varchar(200) NOT NULL DEFAULT '',
  `cat_name` varchar(200) NOT NULL DEFAULT '',
  `cat_order` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `slug` (`cat_slug`),
  KEY `name` (`cat_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类信息表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cats`
--

INSERT INTO `cats` (`cat_id`, `cat_father`, `cat_slug`, `cat_name`, `cat_order`) VALUES
(1, 0, 'test_cat1', '测试分类', 0),
(2, 1, 'test_cat2', '测试子分类', 0);

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_content` text NOT NULL,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论信息表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `comments`
--


-- --------------------------------------------------------

--
-- 表的结构 `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'anonymous',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Waiting',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='反馈信息' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `feedback`
--


-- --------------------------------------------------------

--
-- 表的结构 `form`
--

DROP TABLE IF EXISTS `form`;
CREATE TABLE IF NOT EXISTS `form` (
  `fa_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direction` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`fa_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='申请表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `form`
--


-- --------------------------------------------------------

--
-- 表的结构 `hooks`
--

DROP TABLE IF EXISTS `hooks`;
CREATE TABLE IF NOT EXISTS `hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `搜索索引` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Hooks表\r\n' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `hooks`
--

INSERT INTO `hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, ''),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'SocialComment,baidushare'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, ''),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, ''),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, '');

-- --------------------------------------------------------

--
-- 表的结构 `kv`
--

DROP TABLE IF EXISTS `kv`;
CREATE TABLE IF NOT EXISTS `kv` (
  `kv_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kv_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kv_value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`kv_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='key-value通用信息存储' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `kv`
--

INSERT INTO `kv` (`kv_id`, `kv_key`, `kv_value`) VALUES
(1, 'home_theme', 'Twentytwelve'),
(2, 'home_url_model', '2'),
(3, 'home_cat_model', 'native'),
(4, 'home_tag_model', 'native'),
(5, 'home_post_model', 'native'),
(7, 'theme_Vena', 'enabled'),
(8, 'theme_2011college', 'enabled'),
(9, 'theme_Twentytwelve', 'enabled'),
(10, 'HTML_CACHE_ON', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_sort` smallint(25) DEFAULT '0',
  `link_url` varchar(255) DEFAULT '',
  `link_name` varchar(255) DEFAULT '',
  `link_tag` varchar(255) DEFAULT '',
  `link_description` varchar(255) DEFAULT '',
  `link_visible` tinyint(20) DEFAULT '1',
  `link_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情链接' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `links`
--

INSERT INTO `links` (`link_id`, `link_sort`, `link_url`, `link_name`, `link_tag`, `link_description`, `link_visible`, `link_img`) VALUES
(1, 123, 'http://www.greencms.net/', 'GreenCMS', 'Home', 'GreenCMS首页', 1, ''),
(2, 124, 'http://www.zts1993.com/', 'Z的博客', 'Home', 'Z的博客', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统日志记录' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `log`
--


-- --------------------------------------------------------

--
-- 表的结构 `login_log`
--

DROP TABLE IF EXISTS `login_log`;
CREATE TABLE IF NOT EXISTS `login_log` (
  `login_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_geo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='登录信息记录' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `login_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_pid` bigint(20) NOT NULL DEFAULT '0',
  `menu_sort` bigint(20) NOT NULL DEFAULT '99',
  `menu_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `menu_action` varchar(255) CHARACTER SET utf8 DEFAULT '_self',
  `menu_function` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `menu_position` varchar(255) CHARACTER SET utf8 DEFAULT 'head',
  `menu_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单栏' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_pid`, `menu_sort`, `menu_name`, `menu_action`, `menu_function`, `menu_position`, `menu_url`) VALUES
(1, 0, 10000, '测试分类', '_self', 'getCatURLByID', 'head', '1'),
(2, 0, 99, '空链接', '_self', 'none', 'head', NULL),
(3, 0, 99, '测试页面', '_self', 'getSingleURLByID', 'head', '["2","page"]'),
(4, 0, 99, '测试文章', '_self', 'getSingleURLByID', 'head', '["1","single"]');

-- --------------------------------------------------------

--
-- 表的结构 `mysql`
--

DROP TABLE IF EXISTS `mysql`;
CREATE TABLE IF NOT EXISTS `mysql` (
  `mysql_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`mysql_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `mysql`
--


-- --------------------------------------------------------

--
-- 表的结构 `node`
--

DROP TABLE IF EXISTS `node`;
CREATE TABLE IF NOT EXISTS `node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限节点表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `node`
--


-- --------------------------------------------------------

--
-- 表的结构 `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='选项表' AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'site_url', 'http://greencmsonsae.sinaapp.com/', 'yes'),
(2, 'title', 'GreenCMS 2014', 'yes'),
(3, 'keywords', 'GreenCMS v2 based on ThinkPHP 3.2.1', 'yes'),
(4, 'description', 'GreenCMS is support by GreenStudio From NJUT', 'yes'),
(5, 'foot', '', 'yes'),
(6, 'ip_geo', '1', 'yes'),
(7, 'software_author', 'GreenStudio', 'yes'),
(8, 'widget_about_us', '关于我们', 'yes'),
(9, 'software_homepage', 'http://www.greencms.net', 'yes'),
(10, 'software_version', 'v2.1.0306', 'yes'),
(11, 'software_name', 'GreenCMS v2', 'yes'),
(12, 'LOG_RECORD', '1', 'yes'),
(13, 'software_build', '20140306', 'yes'),
(14, 'HTML_CACHE_ON', '1', 'yes'),
(15, 'sqlFileSize', '5000000', 'yes'),
(16, 'send_mail', '1', 'yes'),
(17, 'smtp_host', 'mail.njut.edu.cn', 'yes'),
(18, 'smtp_port', '25', 'yes'),
(19, 'smtp_user', 'test@njut.edu.cn', 'yes'),
(20, 'from_email', 'test@njut.edu.cn', 'yes'),
(21, 'smtp_pass', ' ', 'yes'),
(22, 'PAGER', '20', 'yes'),
(23, 'ome_info', 'original', 'yes'),
(24, 'db_fieldtype_check', '0', 'yes'),
(25, 'DEFAULT_FILTER', 'htmlspecialchars', 'yes'),
(26, 'COOKIE_PREFIX', 'greencms_', 'yes'),
(27, 'COOKIE_EXPIRE', '3600', 'yes'),
(28, 'COOKIE_DOMAIN', '', 'yes'),
(29, 'COOKIE_PATH', '/', 'yes'),
(30, 'DB_FIELDS_CACHE', '1', 'yes'),
(31, 'DB_SQL_BUILD_CACHE', '1', 'yes'),
(32, 'sql_mail', '', 'yes'),
(33, 'SHOW_CHROME_TRACE', '0', 'yes'),
(34, 'users_can_register', 'on', 'yes'),
(35, 'feed_open', '1', 'yes'),
(36, 'feed_num', '20', 'yes'),
(37, 'Weixin_reply_subscribe', '欢迎使用Z的博客微信服务平台！回复help获得使用帮助', 'yes'),
(38, 'Weixin_appid', ' ', 'yes'),
(39, 'Weixin_secret', ' ', 'yes'),
(40, 'Weixin_menu', ' ', 'yes'),
(41, 'weixin_token', ' ', 'yes');

-- --------------------------------------------------------

--
-- 表的结构 `plugin`
--

DROP TABLE IF EXISTS `plugin`;
CREATE TABLE IF NOT EXISTS `plugin` (
  `plugin_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `plugin_title` char(20) NOT NULL,
  `plugin_description` text NOT NULL,
  `plugin_author` char(20) NOT NULL,
  `plugin_copyright` char(50) NOT NULL,
  `plugin_pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`plugin_id`),
  KEY `status` (`plugin_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件信息表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `plugin`
--

INSERT INTO `plugin` (`plugin_id`, `plugin_status`, `plugin_title`, `plugin_description`, `plugin_author`, `plugin_copyright`, `plugin_pubdate`) VALUES
(1, 1, 'Duoshuo', '多说第三方评论', 'XJH1994', 'GreenCMS', '2014-03-09 09:48:47');

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT '0',
  `post_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `post_content` longtext NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_status` varchar(20) DEFAULT 'publish',
  `post_comment_status` varchar(20) DEFAULT 'open',
  `post_password` varchar(20) DEFAULT '',
  `post_name` varchar(200) DEFAULT NULL,
  `post_template` varchar(255) NOT NULL DEFAULT 'single',
  `post_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `post_comment_count` bigint(20) DEFAULT '0',
  `post_view_count` bigint(20) DEFAULT '0',
  `post_type` varchar(255) NOT NULL DEFAULT 'single',
  `post_img` varchar(255) DEFAULT NULL,
  `post_top` smallint(6) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_status`,`post_date`,`post_id`),
  KEY `post_author` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章列表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `post_date`, `post_content`, `post_title`, `post_status`, `post_comment_status`, `post_password`, `post_name`, `post_template`, `post_modified`, `post_comment_count`, `post_view_count`, `post_type`, `post_img`, `post_top`) VALUES
(1, 1, '2014-03-09 09:48:47', '你好,世界', '欢迎使用GreenCMS', 'publish', 'open', '', 'helloworld', 'detail', '2014-03-09 09:48:47', 0, 3, 'single', NULL, 0),
(2, 1, '2014-03-09 09:48:47', '欢迎使用', '这是一个文章测试页面', 'publish', 'open', '', 'testpage', 'detail', '2014-03-09 09:48:47', 0, 0, 'page', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `post_cat`
--

DROP TABLE IF EXISTS `post_cat`;
CREATE TABLE IF NOT EXISTS `post_cat` (
  `pc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_id` bigint(20) NOT NULL DEFAULT '0',
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章分类' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `post_cat`
--

INSERT INTO `post_cat` (`pc_id`, `cat_id`, `post_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `post_meta`
--

DROP TABLE IF EXISTS `post_meta`;
CREATE TABLE IF NOT EXISTS `post_meta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章meta' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `post_meta`
--


-- --------------------------------------------------------

--
-- 表的结构 `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE IF NOT EXISTS `post_tag` (
  `pt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) NOT NULL DEFAULT '0',
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pt_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章标签' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `post_tag`
--

INSERT INTO `post_tag` (`pt_id`, `tag_id`, `post_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `name`, `pid`, `status`, `remark`) VALUES
(1, '超级管理员', 1, 1, '系统内置超级管理员组'),
(2, '网站管理员', 2, 1, '拥有系统仅此于超级管理员的权限'),
(3, '内容管理员', 3, 1, '拥有发布文章权利'),
(4, '投稿员', 4, 1, '只能投稿默认为未审核'),
(5, '游客', 5, 1, '基本信息修改');

-- --------------------------------------------------------

--
-- 表的结构 `role_users`
--

DROP TABLE IF EXISTS `role_users`;
CREATE TABLE IF NOT EXISTS `role_users` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` bigint(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色表';

--
-- 转存表中的数据 `role_users`
--

INSERT INTO `role_users` (`role_id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(200) NOT NULL DEFAULT '',
  `tag_slug` varchar(200) NOT NULL DEFAULT '',
  `tag_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `slug` (`tag_slug`),
  KEY `name` (`tag_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='标签页' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`, `tag_slug`, `tag_group`) VALUES
(1, '测试标签', 'test_tag', 0),
(2, 'hello', 'hello', 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_pass` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `user_registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_activation_key` varchar(60) CHARACTER SET utf8 DEFAULT '',
  `user_status` int(11) DEFAULT '1',
  `user_intro` text CHARACTER SET utf8,
  `user_level` smallint(6) NOT NULL DEFAULT '10',
  `user_session` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `user`
--


-- --------------------------------------------------------

--
-- 表的结构 `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE IF NOT EXISTS `user_detail` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_into` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户详细信息' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `user_detail`
--


-- --------------------------------------------------------

--
-- 表的结构 `weixinaction`
--

DROP TABLE IF EXISTS `weixinaction`;
CREATE TABLE IF NOT EXISTS `weixinaction` (
  `wx_action_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `action_name` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `reply_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `reply_id` bigint(20) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wx_action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信事件表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `weixinaction`
--


-- --------------------------------------------------------

--
-- 表的结构 `weixinlog`
--

DROP TABLE IF EXISTS `weixinlog`;
CREATE TABLE IF NOT EXISTS `weixinlog` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MsgId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FromUserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ToUserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MsgType` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Location_X` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Location_Y` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Scale` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `PicUrl` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isread` smallint(5) DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `createtime` (`CreateTime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信记录表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `weixinlog`
--


-- --------------------------------------------------------

--
-- 表的结构 `weixinre`
--

DROP TABLE IF EXISTS `weixinre`;
CREATE TABLE IF NOT EXISTS `weixinre` (
  `wx_re_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `mediaId` varchar(64) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `group` varchar(20) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wx_re_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信模块预设定回复 表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `weixinre`
--


-- --------------------------------------------------------

--
-- 表的结构 `weixinsend`
--

DROP TABLE IF EXISTS `weixinsend`;
CREATE TABLE IF NOT EXISTS `weixinsend` (
  `weixin_send_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MsgId_to` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `CreateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`weixin_send_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `weixinsend`
--


-- --------------------------------------------------------

--
-- 表的结构 `weixinuser`
--

DROP TABLE IF EXISTS `weixinuser`;
CREATE TABLE IF NOT EXISTS `weixinuser` (
  `weixin_userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT '',
  `subscribe` smallint(5) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `sex` smallint(5) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `subscribe_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`weixin_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信模块用户信息表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `weixinuser`
--

