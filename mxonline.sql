/*
 Navicat Premium Data Transfer

 Source Server         : localmysql
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : mxonline

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 09/11/2018 11:37:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (7, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (8, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (9, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can add 用户信息', 4, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (11, 'Can change 用户信息', 4, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (12, 'Can delete 用户信息', 4, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (13, 'Can add 轮播图', 5, 'add_banner');
INSERT INTO `auth_permission` VALUES (14, 'Can change 轮播图', 5, 'change_banner');
INSERT INTO `auth_permission` VALUES (15, 'Can delete 轮播图', 5, 'delete_banner');
INSERT INTO `auth_permission` VALUES (16, 'Can add 邮箱验证码', 6, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (17, 'Can change 邮箱验证码', 6, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 邮箱验证码', 6, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (19, 'Can add 课程资源', 7, 'add_courseresource');
INSERT INTO `auth_permission` VALUES (20, 'Can change 课程资源', 7, 'change_courseresource');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 课程资源', 7, 'delete_courseresource');
INSERT INTO `auth_permission` VALUES (22, 'Can add 课程', 8, 'add_course');
INSERT INTO `auth_permission` VALUES (23, 'Can change 课程', 8, 'change_course');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 课程', 8, 'delete_course');
INSERT INTO `auth_permission` VALUES (25, 'Can add 视频', 9, 'add_video');
INSERT INTO `auth_permission` VALUES (26, 'Can change 视频', 9, 'change_video');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 视频', 9, 'delete_video');
INSERT INTO `auth_permission` VALUES (28, 'Can add 章节', 10, 'add_lesson');
INSERT INTO `auth_permission` VALUES (29, 'Can change 章节', 10, 'change_lesson');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 章节', 10, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (31, 'Can add 城市', 11, 'add_citydict');
INSERT INTO `auth_permission` VALUES (32, 'Can change 城市', 11, 'change_citydict');
INSERT INTO `auth_permission` VALUES (33, 'Can delete 城市', 11, 'delete_citydict');
INSERT INTO `auth_permission` VALUES (34, 'Can add 教师', 12, 'add_teacher');
INSERT INTO `auth_permission` VALUES (35, 'Can change 教师', 12, 'change_teacher');
INSERT INTO `auth_permission` VALUES (36, 'Can delete 教师', 12, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (37, 'Can add 课程机构', 13, 'add_courseorg');
INSERT INTO `auth_permission` VALUES (38, 'Can change 课程机构', 13, 'change_courseorg');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 课程机构', 13, 'delete_courseorg');
INSERT INTO `auth_permission` VALUES (40, 'Can add 用户咨询', 14, 'add_userask');
INSERT INTO `auth_permission` VALUES (41, 'Can change 用户咨询', 14, 'change_userask');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 用户咨询', 14, 'delete_userask');
INSERT INTO `auth_permission` VALUES (43, 'Can add 用户课程', 15, 'add_usercourse');
INSERT INTO `auth_permission` VALUES (44, 'Can change 用户课程', 15, 'change_usercourse');
INSERT INTO `auth_permission` VALUES (45, 'Can delete 用户课程', 15, 'delete_usercourse');
INSERT INTO `auth_permission` VALUES (46, 'Can add 课程评论', 16, 'add_coursecomments');
INSERT INTO `auth_permission` VALUES (47, 'Can change 课程评论', 16, 'change_coursecomments');
INSERT INTO `auth_permission` VALUES (48, 'Can delete 课程评论', 16, 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES (49, 'Can add 用户收藏', 17, 'add_userfavorite');
INSERT INTO `auth_permission` VALUES (50, 'Can change 用户收藏', 17, 'change_userfavorite');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 用户收藏', 17, 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES (52, 'Can add 用户消息', 18, 'add_usermessage');
INSERT INTO `auth_permission` VALUES (53, 'Can change 用户消息', 18, 'change_usermessage');
INSERT INTO `auth_permission` VALUES (54, 'Can delete 用户消息', 18, 'delete_usermessage');
INSERT INTO `auth_permission` VALUES (55, 'Can add log entry', 19, 'add_logentry');
INSERT INTO `auth_permission` VALUES (56, 'Can change log entry', 19, 'change_logentry');
INSERT INTO `auth_permission` VALUES (57, 'Can delete log entry', 19, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (58, 'Can add session', 20, 'add_session');
INSERT INTO `auth_permission` VALUES (59, 'Can change session', 20, 'change_session');
INSERT INTO `auth_permission` VALUES (60, 'Can delete session', 20, 'delete_session');
INSERT INTO `auth_permission` VALUES (61, 'Can view log entry', 19, 'view_logentry');
INSERT INTO `auth_permission` VALUES (62, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (63, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (64, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (65, 'Can view 课程', 8, 'view_course');
INSERT INTO `auth_permission` VALUES (66, 'Can view 课程资源', 7, 'view_courseresource');
INSERT INTO `auth_permission` VALUES (67, 'Can view 章节', 10, 'view_lesson');
INSERT INTO `auth_permission` VALUES (68, 'Can view 视频', 9, 'view_video');
INSERT INTO `auth_permission` VALUES (69, 'Can view 课程评论', 16, 'view_coursecomments');
INSERT INTO `auth_permission` VALUES (70, 'Can view 用户咨询', 14, 'view_userask');
INSERT INTO `auth_permission` VALUES (71, 'Can view 用户课程', 15, 'view_usercourse');
INSERT INTO `auth_permission` VALUES (72, 'Can view 用户收藏', 17, 'view_userfavorite');
INSERT INTO `auth_permission` VALUES (73, 'Can view 用户消息', 18, 'view_usermessage');
INSERT INTO `auth_permission` VALUES (74, 'Can view 城市', 11, 'view_citydict');
INSERT INTO `auth_permission` VALUES (75, 'Can view 课程机构', 13, 'view_courseorg');
INSERT INTO `auth_permission` VALUES (76, 'Can view 教师', 12, 'view_teacher');
INSERT INTO `auth_permission` VALUES (77, 'Can view session', 20, 'view_session');
INSERT INTO `auth_permission` VALUES (78, 'Can view 轮播图', 5, 'view_banner');
INSERT INTO `auth_permission` VALUES (79, 'Can view 邮箱验证码', 6, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (80, 'Can view 用户信息', 4, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (81, 'Can add Bookmark', 21, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (82, 'Can change Bookmark', 21, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (83, 'Can delete Bookmark', 21, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (84, 'Can add User Setting', 22, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (85, 'Can change User Setting', 22, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (86, 'Can delete User Setting', 22, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (87, 'Can add User Widget', 23, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (88, 'Can change User Widget', 23, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (89, 'Can delete User Widget', 23, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (90, 'Can add log entry', 24, 'add_log');
INSERT INTO `auth_permission` VALUES (91, 'Can change log entry', 24, 'change_log');
INSERT INTO `auth_permission` VALUES (92, 'Can delete log entry', 24, 'delete_log');
INSERT INTO `auth_permission` VALUES (93, 'Can view Bookmark', 21, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (94, 'Can view log entry', 24, 'view_log');
INSERT INTO `auth_permission` VALUES (95, 'Can view User Setting', 22, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (96, 'Can view User Widget', 23, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (97, 'Can add captcha store', 25, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (98, 'Can change captcha store', 25, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (99, 'Can delete captcha store', 25, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (100, 'Can view captcha store', 25, 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  `degree` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_org_id` int(11) NULL DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `need_know` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `teacher_tell` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_course_course_org_id_4d2c4aab_fk_organizat`(`course_org_id`) USING BTREE,
  INDEX `courses_course_teacher_id_846fa526_fk_organization_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES (1, '前端工程师晋升课程', 'Vue全家桶+SSR+Koa2全栈开发美团网', 'Vue全家桶+SSR+Koa2全栈开发美团网\r\n这是一门前端全栈课程，课程中采用了许多新的技术，结合包括Vue2.5、Koa2、MongoDB、Redis等多种前后端技术完成了美团网的开发。课程从新技术的基础讲解入手，通过细致的项目开发过程，带你开发一个美团网PC网页版，同学们通过这门课程的学习可以掌握更全面的项目架构，迅速提升，达到高级工程师的水平。', 0, 5, 2, 'courses/2018/11/sass.jpg', 44, '2018-11-06 21:05:00.000000', 'cj', 1, '编程开发', '前端', '加油你能成功的！努力学习！摆脱困境', NULL, '你给我好好学，不要偷懒，滚去学习', 0);
INSERT INTO `courses_course` VALUES (2, 'EasySwoole', 'EasySwoole+ElasticSearch打造高性能小视频服务系统', 'EasySwoole+ElasticSearch打造高性能小视频服务系统\r\nEasySwoole底层是基于swoole开发的常驻内存型的分布式PHP框架，专为API而生，是swoole专业型上层PHP框架，让开发者以最低的学习成本和精力编写出多进程，可异步，高可用的应用服务。本课程将理论结合实战，带你从基础开始系统学习EasySwoole框架, 同时利用EasySwoole带你打造高性能API服务，并结合分布式搜索引擎-ElasticSearch带你打造一个高性能小视频服务系统，让你从容处理各种高并发高性能业务场景。', 1200, 1, 5, 'courses/2018/11/pic503.png', 0, '2018-11-06 21:09:00.000000', 'zj', 1, '编程开发', '前端', '加油你能成功的！努力学习！摆脱困境', NULL, '你给我好好学，不要偷懒，滚去学习', 0);
INSERT INTO `courses_course` VALUES (3, 'Vue2.5开发', 'Vue2.5开发去哪儿网App  从零基础入门到实战项目 从理论到项目，一个课程涵盖Vue各个层面的基础知识和开发技巧', 'Vue2.5开发去哪儿网App 从零基础入门到实战项目\r\n从Vue基础语法入手，逐层递进，实战项目贴近企业流程，完全按照企业级别代码质量和工程开发流程进行授课，让你理解这套技术在企业中被使用的真实流程。更好的掌握Vue各个基础知识点。', 120, 2, 4, 'courses/2018/11/sass_M4eXzHS.jpg', 21, '2018-11-06 21:11:00.000000', 'cj', 1, '编程开发', '前端', '加油你能成功的！努力学习！摆脱困境', NULL, '你给我好好学，不要偷懒，滚去学习', 0);
INSERT INTO `courses_course` VALUES (4, 'django打造在线教育平台', '25小时Django综合实战，从0打造一个模块完整、功能完善、达到上线标准的在线教育平台，全面掌握Django的同时，得到一套完整的代码', '搞个“大”项目\r\n开发一套功能完备的系统\r\n25小时企业级实战：从0到项目成型\r\n以互联网公司标准开发流程，从零开发出一套可以达到上线标准的在线教育平台\r\n得到一个接近慕课网的在线教育平台\r\n开发一个全新在线教育平台——慕学网，具备一个在线教育网站所应该具有的\r\n所有功能，单是这套系统的完整代码就值得你立刻入手这门课程\r\ndjango综合运用：覆盖所有常用模块\r\nsettings配置、 url配置、 view编码、 model设计、 modelform表单验证、 \r\ntemplates模板、 django常用内置函数，以及通用的django开发库\r\n杀手级xadmin定制后台管理系统\r\nxadmin 搭建后台管理系统，并根据用户权限定制后台功能，让后台管理更人性化\r\n细致全面到你可能不需要其它django课程\r\n通过一个“留言板”的开发带你回顾django基础知识，在整个教育平台开发中\r\n不放过每一个功能的实现细节，让你全面掌握django，让你不再需要其它\r\ndjango课程', 2500, 23, 0, 'courses/2018/11/540e57300001d6d906000338-240-135.jpg', 27, '2018-11-07 14:25:00.000000', 'zj', 1, '编程开发', 'Python', '加油你能成功的！努力学习！摆脱困境', 1, '你给我好好学，不要偷懒，滚去学习', 0);
INSERT INTO `courses_course` VALUES (5, 'Python Flask构建微信小程序订餐系统', '从项目搭建到部署上线，让你快速掌握Python全栈开发！', 'Python flask构建微信小程序订餐系统\r\n本课程是python flask+微信小程序完美结合，从项目搭建到腾讯云部署上线，打造一个全栈订餐系统。从基础语法入手，易于掌握，构建MVC架构，增进对小程序和后端API的理解认识。深入浅出带你进阶全栈工程师课程，帮助你快速提升项目经验，掌握项目开发技巧，提高项目中解决问题的能力。', 120, 2, 0, 'courses/2018/11/57035ff200014b8a06000338-240-135.jpg', 0, '2018-11-08 19:26:00.000000', 'zj', 2, '编程开发', '慕课出品', '加油你能成功的！努力学习！摆脱困境', 1, '你给我好好学，不要偷懒，滚去学习', 1);
INSERT INTO `courses_course` VALUES (6, '微信小程序入门与实战', '微信小程序入门与实战 常用组件API开发技巧项目实战', '微信小程序入门与实战 常用组件API开发技巧项目实战\r\n小程序官方正式公告，开放了更多的入口，个人开发者可以申请注册，公众号菜单可以直接点开，移动App可以直接分享，小程序越来越开放了！别犹豫该不该学小程序开发，在你犹豫的时候，别人的小程序已经开发好了！\r\n作为程序员，竟然想不出\r\n你不学这门课的理由\r\n- 自己去看看课程评价吧!\r\n课程一直紧跟微信官方进行维护\r\n讲师像维护产品一样维护课程，保证课程的项目顺利运行，无论您什么时候打开这门课程，都\r\n可以完整有序的学习小程序的项目实战\r\n不怕你对前端不熟悉！\r\n开发小程序不需要学习AngularJS、Vue或React等复杂的前端框架及类库，学习曲线相当的平\r\n滑。通过小程序入门前端，再反向学习其它前端框架，对于0基础开发者或想进军前端的开发者\r\n是一条非常好的捷径', 200, 4, 0, 'courses/2018/11/python面向对象.jpg', 0, '2018-11-08 19:28:00.000000', 'zj', 2, '编程开发', '微信程序', '加油你能成功的！努力学习！摆脱困境', 2, '你给我好好学，不要偷懒，滚去学习', 0);
INSERT INTO `courses_course` VALUES (7, 'Google资深工程师深度讲解Go语言', '基本语法、函数式编程、面向接口、并发编程、分布式爬虫实战 全面掌握Go语言', '<p>&nbsp; &nbsp;&nbsp;<img src=\"/media/courses/ueditor/python面向对象_20181109100011_190.jpg\" title=\"\" alt=\"python面向对象.jpg\" width=\"539\" height=\"229\" style=\"width: 539px; height: 229px;\"/></p><p>Google资深工程师深度讲解Go语言\r\nGo作为专门为并发和大数据设计的语言，在编程界占据越来越重要的地位！不论是c/c++，php，java，重构首选语言就是Go~本次课程特邀谷歌资深工程师，将Go语言使用经验总结归纳，从Go语言基本语法到函数式编程、并发编程，最后构建分布式爬虫系统，步步深入，带你快速掌握Go语言！\r\nGoogle资深工程师，带你更深层次掌握Go语言精髓\r\n函数式编程与“对象”\r\nGo不需要”对象“，一样可以实现原\r\n本通过封装继承多态所做到的事情！\r\n接口和函数式编程，改变你的三观\r\n\r\n并发编程\r\n学习Goroutine和Channel，使用CSP模\r\n型而不是锁，轻松实现原本繁琐的并\r\n发任务\r\n\r\nGo语言工程化\r\n错误处理，单元测试，性能调优，把\r\n“优美“的代码升级为项</p>', 0, 0, 0, 'courses/2018/11/python文件处理.jpg', 1, '2018-11-08 19:30:00.000000', 'gj', 5, '编程开发', '慕课出品', '加油你能成功的！努力学习！摆脱困境', 1, '你给我好好学，不要偷懒，滚去学习', 0);

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseresource_course_id_5eba1332_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES (1, '图片素材', 'course/resource/2018/11/mysql.jpg', '2018-11-07 15:11:00.000000', 4);

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_lesson_course_id_16bc4882_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES (1, '第1章 课程介绍', '2018-11-07 14:38:00.000000', 4);
INSERT INTO `courses_lesson` VALUES (2, '第2章 windows下搭建开发环境', '2018-11-07 14:38:00.000000', 4);
INSERT INTO `courses_lesson` VALUES (3, '第3章 通过留言版功能回顾django基础知识', '2018-11-07 14:38:00.000000', 4);
INSERT INTO `courses_lesson` VALUES (4, '第4章 需求分析和model设计', '2018-11-07 14:38:00.000000', 4);

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_video_lesson_id_59f2396e_fk_courses_lesson_id`(`lesson_id`) USING BTREE,
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES (1, '1-1 项目演示和课程介绍', '2018-11-07 14:39:00.000000', 1, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (2, '2-1 pycharm、navicat和python的安装', '2018-11-07 14:40:00.000000', 2, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (3, '2-2 virtualenv安装和配置', '2018-11-07 14:40:00.000000', 2, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (4, '2-3 pycharm和navicat的简单使用', '2018-11-07 14:40:00.000000', 2, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (5, '3-1 django目录介绍', '2018-11-07 14:40:00.000000', 3, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (6, '3-2 配置表单页面', '2018-11-07 14:41:00.000000', 3, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (7, '3-3 django orm介绍与model设计', '2018-11-07 14:41:00.000000', 3, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (8, '3-4 django model的增删改', '2018-11-07 14:41:00.000000', 3, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (9, '3-5 django url templates配置', '2018-11-07 14:41:00.000000', 3, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (10, '4-1 使用py3.6和django1.11开发系统前注意事项（补充小节）', '2018-11-07 14:41:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (11, '4-2 用django2.0开始课程的注意事项（补充小节）', '2018-11-07 14:41:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (12, '4-3 django-app 设计', '2018-11-07 14:41:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (13, '4-4 新建项目', '2018-11-07 14:42:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (14, '4-5 自定义userprofile', '2018-11-07 14:42:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (15, '4-6 user modesl.py设计', '2018-11-07 14:42:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (16, '4-7 course models.py设计', '2018-11-07 14:42:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (17, '4-8 organization modesl.py设计', '2018-11-07 14:42:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (18, '4-9 operation models.py设计', '2018-11-07 14:42:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);
INSERT INTO `courses_video` VALUES (19, '4-10 数据表生成以及apps目录建立', '2018-11-07 14:42:00.000000', 4, 'https://coding.imooc.com/class/chapter/78.html#Anchor', 0);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (19, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (25, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (8, 'courses', 'course');
INSERT INTO `django_content_type` VALUES (7, 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES (10, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (9, 'courses', 'video');
INSERT INTO `django_content_type` VALUES (16, 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES (14, 'operation', 'userask');
INSERT INTO `django_content_type` VALUES (15, 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES (17, 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES (18, 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES (11, 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES (13, 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES (12, 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES (20, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (5, 'users', 'banner');
INSERT INTO `django_content_type` VALUES (6, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (4, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (24, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (22, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-11-03 01:21:26.446741');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-11-03 01:21:26.570751');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-11-03 01:21:26.899784');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-11-03 01:21:26.962779');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-11-03 01:21:26.973779');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-11-03 01:21:26.985784');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-11-03 01:21:26.996792');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-11-03 01:21:27.004783');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-11-03 01:21:27.013782');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-11-03 01:21:27.029783');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-11-03 01:21:27.039790');
INSERT INTO `django_migrations` VALUES (12, 'users', '0001_initial', '2018-11-03 01:21:27.527832');
INSERT INTO `django_migrations` VALUES (13, 'courses', '0001_initial', '2018-11-03 02:07:47.582810');
INSERT INTO `django_migrations` VALUES (14, 'organization', '0001_initial', '2018-11-03 03:58:25.747240');
INSERT INTO `django_migrations` VALUES (15, 'operation', '0001_initial', '2018-11-03 05:22:10.000025');
INSERT INTO `django_migrations` VALUES (16, 'users', '0002_auto_20181103_1409', '2018-11-03 14:09:51.179629');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0001_initial', '2018-11-03 14:30:28.896468');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0002_logentry_remove_auto_add', '2018-11-03 14:30:28.923470');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2018-11-03 14:30:28.982478');
INSERT INTO `django_migrations` VALUES (20, 'xadmin', '0001_initial', '2018-11-03 22:15:14.891200');
INSERT INTO `django_migrations` VALUES (21, 'xadmin', '0002_log', '2018-11-03 22:15:15.085209');
INSERT INTO `django_migrations` VALUES (22, 'xadmin', '0003_auto_20160715_0100', '2018-11-03 22:15:15.202218');
INSERT INTO `django_migrations` VALUES (23, 'courses', '0002_course_degree', '2018-11-04 10:11:30.533368');
INSERT INTO `django_migrations` VALUES (24, 'captcha', '0001_initial', '2018-11-04 19:14:09.266074');
INSERT INTO `django_migrations` VALUES (25, 'organization', '0002_auto_20181105_2151', '2018-11-05 21:51:55.008292');
INSERT INTO `django_migrations` VALUES (26, 'organization', '0003_auto_20181106_1241', '2018-11-06 12:42:07.387834');
INSERT INTO `django_migrations` VALUES (27, 'courses', '0003_course_course_org', '2018-11-06 16:15:28.203053');
INSERT INTO `django_migrations` VALUES (28, 'organization', '0004_teacher_image', '2018-11-06 21:24:04.213491');
INSERT INTO `django_migrations` VALUES (29, 'courses', '0004_course_category', '2018-11-07 10:08:37.028426');
INSERT INTO `django_migrations` VALUES (30, 'courses', '0005_course_tag', '2018-11-07 11:11:03.379067');
INSERT INTO `django_migrations` VALUES (31, 'courses', '0006_video_url', '2018-11-07 14:39:34.690688');
INSERT INTO `django_migrations` VALUES (32, 'courses', '0007_video_learn_times', '2018-11-07 14:45:53.208463');
INSERT INTO `django_migrations` VALUES (33, 'courses', '0008_auto_20181107_1451', '2018-11-07 14:51:28.348491');
INSERT INTO `django_migrations` VALUES (34, 'organization', '0005_teacher_age', '2018-11-08 08:58:32.334479');
INSERT INTO `django_migrations` VALUES (35, 'users', '0003_auto_20181108_1428', '2018-11-08 14:29:00.877948');
INSERT INTO `django_migrations` VALUES (36, 'users', '0004_auto_20181108_1443', '2018-11-08 14:43:57.758571');
INSERT INTO `django_migrations` VALUES (37, 'courses', '0009_course_is_banner', '2018-11-08 19:10:48.175059');
INSERT INTO `django_migrations` VALUES (38, 'organization', '0006_courseorg_tag', '2018-11-08 19:10:48.290068');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0z1gpw7ww388745weq55r62hnaz9qopk', 'N2RiYTU0Y2VjNTdjNGZmZjcxMjBkNGJhMGNlMWY5MTRhMzM1MjFlZTp7fQ==', '2018-11-19 10:26:18.995847');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_coursecomm_user_id_f5ff70b3_fk_users_use`(`user_id`) USING BTREE,
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES (1, '评论测试！！！', '2018-11-07 16:30:51.915486', 4, 1);

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES (1, 'test', '13578965432', 'python', '2018-11-06 15:57:14.744569');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES (2, '2018-11-07 10:23:00.000000', 1, 3);
INSERT INTO `operation_usercourse` VALUES (3, '2018-11-07 22:41:00.000000', 3, 1);
INSERT INTO `operation_usercourse` VALUES (4, '2018-11-07 22:41:00.000000', 1, 1);
INSERT INTO `operation_usercourse` VALUES (5, '2018-11-07 22:42:00.000000', 4, 1);

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES (5, 1, 1, '2018-11-07 12:43:24.545614', 1);
INSERT INTO `operation_userfavorite` VALUES (8, 1, 2, '2018-11-08 16:07:41.853134', 1);
INSERT INTO `operation_userfavorite` VALUES (9, 1, 3, '2018-11-08 16:17:44.014662', 1);

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `send_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES (2, 1, '欢迎注册在线慕学网，开启你的学习之旅吧!!', 0, '2018-11-08 16:38:00.000000');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES (1, '北京市', '是我大中国的首都', '2018-11-05 20:04:00.000000');
INSERT INTO `organization_citydict` VALUES (2, '杭州市', '是我大浙江的省会啊', '2018-11-05 20:04:00.000000');
INSERT INTO `organization_citydict` VALUES (3, '南京市', '是个有回忆的地方', '2018-11-05 20:05:00.000000');
INSERT INTO `organization_citydict` VALUES (4, '上海市', '好想去魔都生活', '2018-11-05 20:05:00.000000');
INSERT INTO `organization_citydict` VALUES (5, '深圳市', '北上广 少不了深圳市', '2018-11-05 20:06:00.000000');
INSERT INTO `organization_citydict` VALUES (6, '厦门市', '厦门可漂亮了 好想去', '2018-11-05 22:03:00.000000');
INSERT INTO `organization_citydict` VALUES (7, '镇江市', '在镇江啊啊啊啊', '2018-11-05 22:05:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_courseo_city_id_4a842f85_fk_organizat`(`city_id`) USING BTREE,
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES (1, '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', 0, '2018-11-05 20:07:00.000000', 1, 'org/2018/11/imooc.png', '北京奥鹏文化传媒有限公司', 1, 'pxjg', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (2, '北京大学', '北京大学（Peking University）简称“北大”，诞生于1898年，初名京师大学堂，是中国近代第一所国立大学，也是最早以“大学”之名创办的学校，其成立标志着中国近代高等教育的开端。北大是中国近代以来唯一以国家最高学府身份创立的学校，最初也是国家最高教育行政机关，行使教育部职能，统管全国教育。北大催生了中国最早的现代学制，开创了中国最早的文科、理科、社科、农科、医科等大学学科，是近代以来中', 0, '2018-11-05 20:12:00.000000', 0, 'org/2018/11/bjdx.jpg', '北京市海淀区颐和园路5号', 1, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (3, '清华大学', '清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、东亚研究型大学协会、亚洲大学联盟、环太平洋大学联盟、清华—剑桥—MIT低碳大学联盟成员，被誉为“红色工程师的摇篮”。', 0, '2018-11-05 21:52:00.000000', 0, 'org/2018/11/qhdx-logo.png', '清华当然在清华咯', 1, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (4, '南京大学', '南京大学（Nanjing University），简称“南大”，是中华人民共和国教育部直属、中央直管副部级建制的综合性全国重点大学，是历史悠久、声誉卓著的百年名校。位列首批国家“双一流“世界一流大学A类建设高校、”211工程“、”985工程”，入选“珠峰计划”、“111计划”、“2011计划”、“卓越工程师教育培养计划”、“卓越医生教育培养计划”、“卓越法律人才教育培养计划”，是九校联盟、中国大学校长联谊会、环太平洋大学联盟、21世纪学术联盟和东亚研究型大学协会成员。 [1]', 0, '2018-11-05 21:54:00.000000', 0, 'org/2018/11/njdx.jpg', '南京市栖霞区仙林大道163号', 3, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (5, '南京邮电大学', '南京邮电大学（Nanjing University of Posts and Telecommunications)，简称“南邮”（NJUPT)，坐落于六朝古都南京，是原由工业与信息化部直属，现工业与信息化部、国家邮政局与江苏省共建的以电子信息为特色，工学门类为主体，理、工、经、管、文、教、艺、法等多学科相互交融，博士后、博士、硕士、本科等多层次教育协调发展 [1]  的综合性重点大学，是入选首批国家“双一流”世界一流学科建设 [2]  、首批国家“2011计划”建设 [3]  、国家“111计划”建设 [4]  、国际电信联盟首个学术成员、教育部“卓越工程师教育培养计划”建设 [5]  、江苏高水平大学建设的名牌高校 [6]  。', 0, '2018-11-05 21:58:00.000000', 0, 'org/2018/11/njupt.jpg', '江苏省南京市鼓楼区新模范马路66号', 3, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (6, '浙江大学', '浙江大学（Zhejiang University），简称“浙大”，是由中华人民共和国教育部直属的综合性全国重点大学，中央直管副部级建制，“双一流”世界一流大学A类建设高校，“211工程”、“985工程”重点建设高校，入选珠峰计划、2011计划、111计划、卓越法律人才教育培养计划、卓越医生教育培养计划、卓越工程师教育培养计划、卓越农林人才教育培养计划、国家级大学生创新创业训练计划、国家大学生创新性实验计划、国家建设高水平大学公派研究生项目、新工科研究与实践项目、中国政府奖学金来华留学生接收院校、全国深化创新创业教育改革示范高校，九校联盟（C9）、环太平洋大学联盟、世界大学联盟、中国大学校长联谊会成员，为中国人自己最早创办的新式高等学校之一，曾被英国著名学者李约瑟称誉为“东方剑桥”。', 0, '2018-11-05 22:01:00.000000', 0, 'org/2018/11/zjupt.jpg', '杭州市西湖区余杭塘路866号', 2, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (7, '厦门大学', '厦门大学（Xiamen University），简称厦大（XMU），由著名爱国华侨领袖陈嘉庚先生于1921年创办，是中国近代教育史上第一所华侨创办的大学，是国内最早招收研究生的大学之一，中国首个在海外建设独立校园的大学，被誉为“南方之强” [1]  。\r\n学校是教育部直属的副部级大学，综合性研究型全国重点大学，教育部、国家国防科技工业局、福建省和厦门市共建高校 [2]  ， [3]  是国家“双一流”世界一流大学建设高校、国家“2011计划”牵头高校，入选“211工程”、“985工程”，“111计划”、“珠峰计划”、首批20所学位自主审核高校、“卓越工程师教育培养计划”、“卓越法律人才教育培养计划”、“卓越医生教育培养计划”、“海外高层次人才引进计划”、“国家建设高水平大学公派研究生项目”、“中国政府奖学金来华留学生接收院校” [4]  。', 0, '2018-11-05 22:02:00.000000', 0, 'org/2018/11/xmu.jpg', '福建省厦门市思明区思明南路422号', 6, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (8, '江苏大学', '江苏大学（Jiangsu University）坐落在风景秀丽的国家历史文化名城—江苏省镇江市，是2001年8月经教育部批准，由原江苏理工大学、镇江医学院、镇江师范专科学校合并组建的以工科为特色的重点综合性研究型大学，是江苏省人民政府和农业农村部共建高校、首批江苏省高水平大学建设高校、全国本科教学工作水平优秀高校、全国首批50所毕业生就业典型经验高校、全国创新创业典型经验高校和首批全国来华留学生质量认证高校，入选国家建设高水平大学公派研究生项目、国家级大学生创新创业训练计划、全国74所“特色重点项目”高校、全国首批61所卓越工程师教育培养计划高校、全国首批”卓越工程师教育培养计划2.0“高校。 [1]', 0, '2018-11-05 22:04:00.000000', 0, 'org/2018/11/jsu.jpg', '江苏省镇江市学府路301号', 7, 'gx', 0, 0, '全国知名');
INSERT INTO `organization_courseorg` VALUES (9, '路飞学城', '路飞学城立志帮助有志向的年轻人通过努力学习获得体面的工作和生活！路飞学员通过学习Python ,金融分析,人工智能等互联网最前沿技术,开启职业生涯新可能', 0, '2018-11-05 22:06:00.000000', 0, 'org/2018/11/LNH.png', '老男孩我也不知道在哪里', 1, 'pxjg', 0, 0, '全国知名');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  `fav_nums` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_teacher_org_id_cd000a1a_fk_organizat`(`org_id`) USING BTREE,
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES (1, 'bobby', 5, '慕课', 'python全栈工程师，五年工作经验，喜欢钻研python技术，对爬虫、web开发以及机器学习有浓厚', '，喜欢钻研python技术，对爬虫、web开发以及机器学习有浓厚', 0, '2018-11-06 21:26:00.000000', 1, 1, 'teacher/2018/11/aobama.png', 25);
INSERT INTO `organization_teacher` VALUES (2, 'test', 5, '百度', 'Python工程师', '幽默风趣', 2, '2018-11-06 21:40:00.000000', 4, 1, 'teacher/2018/11/fqy.png', 25);

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES (1, '轮播图1', 'banner/2018/11/57a801860001c34b12000460.jpg', 'https://coding.imooc.com/class/chapter/78.html#Anchor', 1, '2018-11-08 19:19:00.000000');
INSERT INTO `users_banner` VALUES (2, '轮播图2', 'banner/2018/11/57aa86a0000145c512000460.jpg', 'http://www.baidu.com', 2, '2018-11-08 19:19:00.000000');
INSERT INTO `users_banner` VALUES (3, '轮播图3', 'banner/2018/11/57a801860001c34b12000460_z4Vb8zl.jpg', 'https://coding.imooc.com/class/chapter/78.html#Anchor', 3, '2018-11-08 19:20:00.000000');
INSERT INTO `users_banner` VALUES (4, '轮播图4', 'banner/2018/11/57aa86a0000145c512000460_GXIBATC.jpg', 'http://www.baidu.com', 4, '2018-11-08 19:20:00.000000');
INSERT INTO `users_banner` VALUES (5, '轮播图5', 'banner/2018/11/57aa86a0000145c512000460_nMwvoQD.jpg', 'https://coding.imooc.com/class/chapter/78.html#Anchor', 5, '2018-11-08 19:21:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES (1, 'adw4', 'test@test.com', 'register', '2018-11-03 23:25:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES (2, 'gmCxX3rgojWy8qmpmkwu', 'isk2y@qq.com', 'register', '2018-11-04 23:49:57.509558');
INSERT INTO `users_emailverifyrecord` VALUES (3, 'zmQI9ZZtBlcrGLBeuw4I', 'isk2y@qq.com', 'register', '2018-11-05 00:08:21.275629');
INSERT INTO `users_emailverifyrecord` VALUES (4, 'hh2UNHBIQYoeW2InR1xr', 'isk2y@qq.com', 'register', '2018-11-05 00:10:27.871399');
INSERT INTO `users_emailverifyrecord` VALUES (5, 'JS3iUnAa90cu7bvMEZF0', 'isk2y@qq.com', 'register', '2018-11-05 00:15:06.628609');
INSERT INTO `users_emailverifyrecord` VALUES (6, 'Ha62LV80iAV9K8CMXUhG', 'isk2y@qq.com', 'register', '2018-11-05 08:31:34.121529');
INSERT INTO `users_emailverifyrecord` VALUES (7, 'SZq35nCgRMCXK0Xy46Hd', 'isk2y@qq.com', 'register', '2018-11-05 08:36:43.870058');
INSERT INTO `users_emailverifyrecord` VALUES (8, 'wULYtpGA6OthS9f2MlbG', 'isk2y@qq.com', 'register', '2018-11-05 08:56:35.295565');
INSERT INTO `users_emailverifyrecord` VALUES (9, 'weGiuTLnhUW2estGkXvc', 'isk2y@qq.com', 'register', '2018-11-05 08:58:51.424374');
INSERT INTO `users_emailverifyrecord` VALUES (10, 'nDUqiIEzR4jylTEuZ7ij', 'isk2y@qq.com', 'register', '2018-11-05 09:09:39.596410');
INSERT INTO `users_emailverifyrecord` VALUES (11, 'jbuIEfSBqhndlFcX7sll', 'isk2y@qq.com', 'register', '2018-11-05 09:18:26.513971');
INSERT INTO `users_emailverifyrecord` VALUES (12, 'SdxTtJPjGhKlPwKaIn7b', 'isk2y@qq.com', 'register', '2018-11-05 10:21:20.788750');
INSERT INTO `users_emailverifyrecord` VALUES (13, 'jWhT2a9VwDwgqmRrNnJa', 'isk2y@qq.com', 'register', '2018-11-05 12:03:39.680635');
INSERT INTO `users_emailverifyrecord` VALUES (14, '3QxQcc0dhNJACRcRM97R', 'isk2y@qq.com', 'forget', '2018-11-05 15:59:00.489508');
INSERT INTO `users_emailverifyrecord` VALUES (15, 'O3DUnbirbiPlpidfUSqk', 'isk2y@qq.com', 'forget', '2018-11-05 16:16:54.056185');
INSERT INTO `users_emailverifyrecord` VALUES (16, '9Grt', 'isk2y@qq.com', 'update_email', '2018-11-08 14:44:01.829080');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` datetime(6) NULL DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$100000$LtmxO3H2Ilat$Px7Vjx01kKRjfNmtsRGMXzKZQiMVVOwZiZbTcosJXMM=', '2018-11-08 14:18:35.875705', 1, 'admin', '', '', 'admin@mxonline.com', 1, 1, '2018-11-03 14:10:00.000000', '管理员啊', '2018-11-08 00:00:00.000000', 'male', '我不是来自火星而是地', NULL, 'image/2018/11/default_big_14_6qKSaps.png');
INSERT INTO `users_userprofile` VALUES (3, 'pbkdf2_sha256$100000$YeA73mNcb9hd$qpGinAwMvOOVQD8OmWoyBjEYQVoAj0DXrVlRQCuiO/4=', '2018-11-05 12:05:00.000000', 0, 'isk2y@qq.com', '', '', 'isk2y@qq.com', 0, 1, '2018-11-05 12:03:00.000000', 'isk2y', NULL, 'male', 'zhejiang', NULL, 'image/2018/11/default_big_14.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2018-11-03 23:25:48.006997', '127.0.0.1', '1', 'adw4(test@test.com)', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-11-05 20:04:48.733589', '127.0.0.1', '1', '北京市', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-11-05 20:05:10.880286', '127.0.0.1', '2', '杭州市', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-11-05 20:05:31.394064', '127.0.0.1', '3', '南京市', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (5, '2018-11-05 20:05:58.959156', '127.0.0.1', '4', '上海市', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-11-05 20:07:09.995060', '127.0.0.1', '5', '深圳市', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-11-05 20:12:00.129309', '127.0.0.1', '1', '慕课网', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-11-05 20:15:14.484477', '127.0.0.1', '2', '北京大学', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-11-05 20:15:42.654610', '127.0.0.1', '1', '慕课网', 'change', '修改 image', 13, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-11-05 21:54:16.681267', '127.0.0.1', '3', '清华大学', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-11-05 21:55:30.157079', '127.0.0.1', '4', '南京大学', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-11-05 21:57:10.404447', '127.0.0.1', '2', '北京大学', 'change', '修改 category', 13, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-11-05 22:01:00.946411', '127.0.0.1', '5', '南京邮电大学', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-11-05 22:02:23.652857', '127.0.0.1', '6', '浙江大学', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-11-05 22:04:14.838858', '127.0.0.1', '6', '厦门市', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-11-05 22:04:22.608836', '127.0.0.1', '7', '厦门大学', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (17, '2018-11-05 22:05:37.356734', '127.0.0.1', '7', '镇江市', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (18, '2018-11-05 22:06:18.916384', '127.0.0.1', '8', '江苏大学', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (19, '2018-11-05 22:15:14.309712', '127.0.0.1', '9', '路飞学城', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (20, '2018-11-06 21:09:41.769037', '127.0.0.1', '1', '前端工程师晋升课程', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (21, '2018-11-06 21:10:46.908996', '127.0.0.1', '2', 'EasySwoole', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (22, '2018-11-06 21:12:32.668930', '127.0.0.1', '3', 'Vue2.5开发', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (23, '2018-11-06 21:40:32.902518', '127.0.0.1', '1', '[慕课网]bobby', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (24, '2018-11-06 21:41:22.502162', '127.0.0.1', '2', '[慕课网]test', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (25, '2018-11-07 10:23:52.557360', '127.0.0.1', '2', 'isk2y@qq.com - 《前端工程师晋升课程》', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (26, '2018-11-07 11:49:26.572438', '127.0.0.1', '3', 'Vue2.5开发', 'change', '修改 tag', 8, 1);
INSERT INTO `xadmin_log` VALUES (27, '2018-11-07 11:49:44.346186', '127.0.0.1', '2', 'EasySwoole', 'change', '修改 tag', 8, 1);
INSERT INTO `xadmin_log` VALUES (28, '2018-11-07 11:50:01.658015', '127.0.0.1', '1', '前端工程师晋升课程', 'change', '修改 tag', 8, 1);
INSERT INTO `xadmin_log` VALUES (29, '2018-11-07 14:37:50.643525', '127.0.0.1', '4', 'Python2.7到3.6完美升级 强力django+杀手级xadmin', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (30, '2018-11-07 14:38:14.975886', '127.0.0.1', '1', '《Python2.7到3.6完美升级 强力django+杀手级xadmin》章节>第1章 课程介绍', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (31, '2018-11-07 14:38:23.796800', '127.0.0.1', '2', '《Python2.7到3.6完美升级 强力django+杀手级xadmin》章节>第2章 windows下搭建开发环境', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (32, '2018-11-07 14:38:34.481573', '127.0.0.1', '3', '《Python2.7到3.6完美升级 强力django+杀手级xadmin》章节>第3章 通过留言版功能回顾django基础知识', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (33, '2018-11-07 14:38:42.618205', '127.0.0.1', '4', '《Python2.7到3.6完美升级 强力django+杀手级xadmin》章节>第4章 需求分析和model设计', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (34, '2018-11-07 14:40:09.624273', '127.0.0.1', '1', '1-1 项目演示和课程介绍', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (35, '2018-11-07 14:40:28.807696', '127.0.0.1', '2', '2-1 pycharm、navicat和python的安装', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (36, '2018-11-07 14:40:37.896531', '127.0.0.1', '3', '2-2 virtualenv安装和配置', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (37, '2018-11-07 14:40:46.159828', '127.0.0.1', '4', '2-3 pycharm和navicat的简单使用', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (38, '2018-11-07 14:41:03.467592', '127.0.0.1', '5', '3-1 django目录介绍', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (39, '2018-11-07 14:41:10.189066', '127.0.0.1', '6', '3-2 配置表单页面', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (40, '2018-11-07 14:41:17.196333', '127.0.0.1', '7', '3-3 django orm介绍与model设计', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (41, '2018-11-07 14:41:24.799918', '127.0.0.1', '8', '3-4 django model的增删改', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (42, '2018-11-07 14:41:31.666958', '127.0.0.1', '9', '3-5 django url templates配置', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (43, '2018-11-07 14:41:48.126716', '127.0.0.1', '10', '4-1 使用py3.6和django1.11开发系统前注意事项（补充小节）', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (44, '2018-11-07 14:41:54.015774', '127.0.0.1', '11', '4-2 用django2.0开始课程的注意事项（补充小节）', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (45, '2018-11-07 14:42:01.056828', '127.0.0.1', '12', '4-3 django-app 设计', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (46, '2018-11-07 14:42:06.959721', '127.0.0.1', '13', '4-4 新建项目', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (47, '2018-11-07 14:42:13.242287', '127.0.0.1', '14', '4-5 自定义userprofile', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (48, '2018-11-07 14:42:19.559273', '127.0.0.1', '15', '4-6 user modesl.py设计', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (49, '2018-11-07 14:42:26.588674', '127.0.0.1', '16', '4-7 course models.py设计', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (50, '2018-11-07 14:42:34.641292', '127.0.0.1', '17', '4-8 organization modesl.py设计', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (51, '2018-11-07 14:42:41.375653', '127.0.0.1', '18', '4-9 operation models.py设计', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (52, '2018-11-07 14:42:47.800835', '127.0.0.1', '19', '4-10 数据表生成以及apps目录建立', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (53, '2018-11-07 15:11:45.796575', '127.0.0.1', '4', 'django打造在线教育平台', 'change', '修改 name', 8, 1);
INSERT INTO `xadmin_log` VALUES (54, '2018-11-07 15:12:16.399765', '127.0.0.1', '1', '图片素材', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (55, '2018-11-07 15:22:49.491043', '127.0.0.1', '4', 'django打造在线教育平台', 'change', '修改 teacher', 8, 1);
INSERT INTO `xadmin_log` VALUES (56, '2018-11-07 21:06:57.866950', '127.0.0.1', '1', 'admin', 'change', '修改 last_login，nick_name，gender，address 和 image', 4, 1);
INSERT INTO `xadmin_log` VALUES (57, '2018-11-07 21:09:00.201436', '127.0.0.1', '3', 'isk2y@qq.com', 'change', '修改 last_login，nick_name，gender，address 和 image', 4, 1);
INSERT INTO `xadmin_log` VALUES (58, '2018-11-07 22:41:47.485055', '127.0.0.1', '3', 'admin - 《Vue2.5开发》', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (59, '2018-11-07 22:41:54.958326', '127.0.0.1', '4', 'admin - 《前端工程师晋升课程》', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (60, '2018-11-07 22:42:11.074187', '127.0.0.1', '5', 'admin - 《django打造在线教育平台》', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (61, '2018-11-08 16:38:47.527152', '127.0.0.1', '2', '欢迎注册在线慕学网，开启你的学习之旅吧!!', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (62, '2018-11-08 19:19:55.058855', '127.0.0.1', '1', '轮播图1', 'create', '已添加。', 5, 1);
INSERT INTO `xadmin_log` VALUES (63, '2018-11-08 19:20:25.793331', '127.0.0.1', '2', '轮播图2', 'create', '已添加。', 5, 1);
INSERT INTO `xadmin_log` VALUES (64, '2018-11-08 19:20:48.228448', '127.0.0.1', '3', '轮播图3', 'create', '已添加。', 5, 1);
INSERT INTO `xadmin_log` VALUES (65, '2018-11-08 19:21:39.707038', '127.0.0.1', '4', '轮播图4', 'create', '已添加。', 5, 1);
INSERT INTO `xadmin_log` VALUES (66, '2018-11-08 19:21:56.776445', '127.0.0.1', '4', '轮播图4', 'change', '修改 index', 5, 1);
INSERT INTO `xadmin_log` VALUES (67, '2018-11-08 19:22:12.008984', '127.0.0.1', '5', '轮播图5', 'create', '已添加。', 5, 1);
INSERT INTO `xadmin_log` VALUES (68, '2018-11-08 19:28:21.030912', '127.0.0.1', '5', 'Python Flask构建微信小程序订餐系统', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (69, '2018-11-08 19:30:08.155385', '127.0.0.1', '6', '微信小程序入门与实战', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (70, '2018-11-08 19:31:46.328130', '127.0.0.1', '7', 'Google资深工程师深度讲解Go语言', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (71, '2018-11-09 10:00:33.087018', '127.0.0.1', '7', 'Google资深工程师深度讲解Go语言', 'change', '修改 detail', 8, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
INSERT INTO `xadmin_usersettings` VALUES (2, 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
