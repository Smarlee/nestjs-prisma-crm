/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : meimei-prisma

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 05/12/2024 17:33:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _prisma_migrations
-- ----------------------------
DROP TABLE IF EXISTS `_prisma_migrations`;
CREATE TABLE `_prisma_migrations`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) NULL DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rolled_back_at` datetime(3) NULL DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _prisma_migrations
-- ----------------------------
INSERT INTO `_prisma_migrations` VALUES ('5844ca88-2071-435a-b0d7-1faea9b724ab', 'e408c7dc9ed071ca6895814b7c5fc5766d0bff6f84827c8496500b27fd849275', '2024-05-17 13:02:57.179', '20240517130255_inte', NULL, NULL, '2024-05-17 13:02:55.455', 1);

-- ----------------------------
-- Table structure for _sys_dept_to_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `_sys_dept_to_sys_role`;
CREATE TABLE `_sys_dept_to_sys_role`  (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE INDEX `_sys_dept_to_sys_role_AB_unique`(`A`, `B`) USING BTREE,
  INDEX `_sys_dept_to_sys_role_B_index`(`B`) USING BTREE,
  CONSTRAINT `_sys_dept_to_sys_role_A_fkey` FOREIGN KEY (`A`) REFERENCES `sys_dept` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_sys_dept_to_sys_role_B_fkey` FOREIGN KEY (`B`) REFERENCES `sys_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_dept_to_sys_role
-- ----------------------------
INSERT INTO `_sys_dept_to_sys_role` VALUES (100, 1);

-- ----------------------------
-- Table structure for _sys_menu_to_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `_sys_menu_to_sys_role`;
CREATE TABLE `_sys_menu_to_sys_role`  (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE INDEX `_sys_menu_to_sys_role_AB_unique`(`A`, `B`) USING BTREE,
  INDEX `_sys_menu_to_sys_role_B_index`(`B`) USING BTREE,
  CONSTRAINT `_sys_menu_to_sys_role_A_fkey` FOREIGN KEY (`A`) REFERENCES `sys_menu` (`menuId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_sys_menu_to_sys_role_B_fkey` FOREIGN KEY (`B`) REFERENCES `sys_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_menu_to_sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for _sys_post_to_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `_sys_post_to_sys_user`;
CREATE TABLE `_sys_post_to_sys_user`  (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE INDEX `_sys_post_to_sys_user_AB_unique`(`A`, `B`) USING BTREE,
  INDEX `_sys_post_to_sys_user_B_index`(`B`) USING BTREE,
  CONSTRAINT `_sys_post_to_sys_user_A_fkey` FOREIGN KEY (`A`) REFERENCES `sys_post` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_sys_post_to_sys_user_B_fkey` FOREIGN KEY (`B`) REFERENCES `sys_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_post_to_sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for _sys_role_to_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `_sys_role_to_sys_user`;
CREATE TABLE `_sys_role_to_sys_user`  (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE INDEX `_sys_role_to_sys_user_AB_unique`(`A`, `B`) USING BTREE,
  INDEX `_sys_role_to_sys_user_B_index`(`B`) USING BTREE,
  CONSTRAINT `_sys_role_to_sys_user_A_fkey` FOREIGN KEY (`A`) REFERENCES `sys_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_sys_role_to_sys_user_B_fkey` FOREIGN KEY (`B`) REFERENCES `sys_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_role_to_sys_user
-- ----------------------------
INSERT INTO `_sys_role_to_sys_user` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_book_list
-- ----------------------------
DROP TABLE IF EXISTS `sys_book_list`;
CREATE TABLE `sys_book_list`  (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createTime` datetime(3) NULL DEFAULT NULL,
  `updateTime` datetime(3) NULL DEFAULT NULL,
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bookId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_book_list
-- ----------------------------
INSERT INTO `sys_book_list` VALUES (1, '三国演义', '1', '1', '2024-12-05 11:13:03.000', '2024-12-05 07:48:52.000', NULL, 88.50, 'admin');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `configId` int(11) NOT NULL AUTO_INCREMENT,
  `configName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `configKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `configValue` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `configType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N',
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`configId`) USING BTREE,
  UNIQUE INDEX `sys_config_configKey_key`(`configKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-17 16:07:16', '', NULL, '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NULL DEFAULT NULL,
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deptName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `orderNum` int(11) NULL DEFAULT 0,
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `delFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`deptId`) USING BTREE,
  INDEX `sys_dept_parentId_fkey`(`parentId`) USING BTREE,
  CONSTRAINT `sys_dept_parentId_fkey` FOREIGN KEY (`parentId`) REFERENCES `sys_dept` (`deptId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, NULL, ',', '槑槑科技', 0, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, ',100,101,', '合肥总公司', 1, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, ',100,102,', '阜阳分公司', 2, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, ',100,101,103,', '研发部门', 1, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, ',100,101,104,', '市场部门', 2, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, ',100,101,105,', '测试部门', 3, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, ',100,101,106,', '财务部门', 4, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, ',100,101,107,', '运维部门', 5, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, ',100,102,108,', '市场部门', 1, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, ',100,102,109,', '财务部门', 2, '小蒋', '13006133172', '87789771@qq.com', '0', '0', 'admin', '2024-05-17 16:07:16', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dictCode` int(11) NOT NULL AUTO_INCREMENT,
  `dictSort` int(11) NULL DEFAULT 0,
  `dictLabel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `dictValue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `dictType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `cssClass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `listClass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isDefault` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dictCode`) USING BTREE,
  INDEX `sys_dict_data_dictType_fkey`(`dictType`) USING BTREE,
  CONSTRAINT `sys_dict_data_dictType_fkey` FOREIGN KEY (`dictType`) REFERENCES `sys_dict_type` (`dictType`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', NULL, NULL, 'Y', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', NULL, NULL, 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', NULL, NULL, 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', NULL, 'primary', 'Y', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', NULL, 'primary', 'Y', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', NULL, 'primary', 'Y', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', NULL, NULL, 'Y', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', NULL, NULL, 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', NULL, 'primary', 'Y', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', NULL, 'warning', 'Y', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', NULL, 'success', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', NULL, 'primary', 'Y', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', NULL, 'primary', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', NULL, 'primary', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', NULL, 'danger', 'N', '0', 'admin', '2024-05-17 16:07:16', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dictId` int(11) NOT NULL AUTO_INCREMENT,
  `dictName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `dictType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dictId`) USING BTREE,
  UNIQUE INDEX `dictType`(`dictType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-04-18 16:07:17', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `jobId` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `jobGroup` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT',
  `invokeTarget` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cronExpression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `misfirePolicy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '3',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  PRIMARY KEY (`jobId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '测试任务', 'DEFAULT', 'JobService.demo(1,2,3,true)', '0/10 * * * * ?', '1', '1', '1', 'admin', '2024-05-17 14:02:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `jobLogId` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobGroup` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invokeTarget` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobMessage` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `exceptionInfo` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`jobLogId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '测试任务', 'DEFAULT', 'JobService.demo(1,2,3,true)', '执行成功', '0', '', '2024-05-17 14:03:05');

-- ----------------------------
-- Table structure for sys_login_infor
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_infor`;
CREATE TABLE `sys_login_infor`  (
  `infoId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `loginLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `loginTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`infoId`) USING BTREE,
  INDEX `idxSysLogininforLt`(`loginTime`) USING BTREE,
  INDEX `idxSysLogininforS`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_infor
-- ----------------------------
INSERT INTO `sys_login_infor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '1', '用户名或密码错误', '2024-05-17 13:10:19');
INSERT INTO `sys_login_infor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-17 13:43:47');
INSERT INTO `sys_login_infor` VALUES (3, 'meimei', '127.0.0.1', '内网IP', 'Chrome124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:11:18');
INSERT INTO `sys_login_infor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:14:01');
INSERT INTO `sys_login_infor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:16:19');
INSERT INTO `sys_login_infor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:16:28');
INSERT INTO `sys_login_infor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '1', '验证码错误', '2024-05-18 02:16:27');
INSERT INTO `sys_login_infor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:18:01');
INSERT INTO `sys_login_infor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:18:10');
INSERT INTO `sys_login_infor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:18:41');
INSERT INTO `sys_login_infor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:27:47');
INSERT INTO `sys_login_infor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:28:01');
INSERT INTO `sys_login_infor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:28:54');
INSERT INTO `sys_login_infor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Edge124', 'Mac OS10.15.7', '0', '登录成功', '2024-05-18 02:29:45');
INSERT INTO `sys_login_infor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome123', 'Windows10', '0', '登录成功', '2024-12-05 06:13:27');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `orderNum` int(11) NULL DEFAULT 0,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isFrame` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1',
  `isCache` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `menuType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#',
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  PRIMARY KEY (`menuId`) USING BTREE,
  INDEX `sys_menu_parentId_fkey`(`parentId`) USING BTREE,
  CONSTRAINT `sys_menu_parentId_fkey` FOREIGN KEY (`parentId`) REFERENCES `sys_menu` (`menuId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1064 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', NULL, 1, 'system', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'system', 'admin', '2024-04-18 16:07:17', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', NULL, 2, 'monitor', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'monitor', 'admin', '2024-04-18 16:07:17', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', NULL, 3, 'tool', NULL, NULL, '1', '0', 'M', '0', '1', NULL, 'tool', 'admin', '2024-04-18 16:07:17', 'admin', '2024-05-17 13:57:49', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', NULL, '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-04-18 16:07:17', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', NULL, '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-04-18 16:07:17', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', NULL, '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-04-18 16:07:17', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', NULL, '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-04-18 16:07:17', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', NULL, '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-04-18 16:07:17', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', NULL, '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-04-18 16:07:17', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', NULL, '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-04-18 16:07:17', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', NULL, '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-04-18 16:07:17', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'log', 'admin', '2024-04-18 16:07:17', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', NULL, '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-04-18 16:07:17', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', NULL, '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-04-18 16:07:17', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', NULL, '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-04-18 16:07:17', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', NULL, '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-04-18 16:07:17', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', NULL, '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-04-18 16:07:17', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', NULL, '1', '0', 'C', '0', '1', 'tool:build:list', 'build', 'admin', '2024-04-18 16:07:17', 'admin', '2024-05-17 13:57:27', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', NULL, '1', '0', 'C', '0', '1', 'tool:gen:list', 'code', 'admin', '2024-04-18 16:07:17', 'admin', '2024-05-17 13:51:22', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', NULL, '1', '0', 'C', '0', '1', 'tool:swagger:list', 'swagger', 'admin', '2024-04-18 16:07:17', 'admin', '2024-05-17 13:51:28', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', NULL, '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-04-18 16:07:17', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', NULL, '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-04-18 16:07:17', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-04-18 16:07:17', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1061, '图书管理', NULL, 0, 'bookSys', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'druid', 'admin', '2024-12-05 06:14:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '图书库', 1061, 0, 'book', 'bookSys/book/index', NULL, '1', '0', 'C', '0', '0', NULL, '#', 'admin', '2024-12-05 06:15:41', 'admin', '2024-12-05 06:15:52', '');
INSERT INTO `sys_menu` VALUES (1063, '阅读计划', 1061, 1, 'readPlan', 'bookSys/readPlan/index', NULL, '1', '0', 'C', '0', '0', NULL, '#', 'admin', '2024-12-05 06:16:29', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noticeType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noticeContent` longblob NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `warningLevel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`noticeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '测试一个小公告', '1', 0x3C703EE6B58BE8AF95E4B880E4B88BE585ACE5918A2E2E2E2E2E2020203C2F703E, '0', 'admin', '2024-05-17 13:50:01', '', NULL, NULL, '严重');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `operId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `businessType` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `requestMethod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `operatorType` int(11) NULL DEFAULT 0,
  `operName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `deptName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `operUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `operIp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `operLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `operParam` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `jsonResult` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `errorMsg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `operTime` datetime NULL DEFAULT NULL,
  `costTime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`operId`) USING BTREE,
  INDEX `idxSysOperLogBt`(`businessType`) USING BTREE,
  INDEX `idxSysOperLogOt`(`operTime`) USING BTREE,
  INDEX `idxSysOperLogS`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '菜单管理', '3', 'SysMenuController.delete()', 'DELETE', 0, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{\"params\":{\"menuIds\":\"4\"},\"query\":{},\"body\":{}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:44:03', 323);
INSERT INTO `sys_oper_log` VALUES (2, '菜单管理', '3', 'SysMenuController.delete()', 'DELETE', 0, 'admin', '研发部门', '/system/menu/111', '127.0.0.1', '内网IP', '{\"params\":{\"menuIds\":\"111\"},\"query\":{},\"body\":{}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:44:13', 326);
INSERT INTO `sys_oper_log` VALUES (3, '系统参数', '3', 'SysConfigController.delete()', 'DELETE', 0, 'admin', '研发部门', '/system/config/1,3,5,6', '127.0.0.1', '内网IP', '{\"params\":{\"configIds\":\"1,3,5,6\"},\"query\":{},\"body\":{}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:47:25', 113);
INSERT INTO `sys_oper_log` VALUES (4, '公告管理', '1', 'SysNoticeController.add()', 'POST', 0, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', NULL, '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:50:01', 260);
INSERT INTO `sys_oper_log` VALUES (5, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":115,\"menuName\":\"表单构建\",\"parentId\":3,\"orderNum\":1,\"path\":\"build\",\"component\":\"tool/build/index\",\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"1\",\"perms\":\"tool:build:list\",\"icon\":\"build\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":\"表单构建菜单\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:51:17', 361);
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":116,\"menuName\":\"代码生成\",\"parentId\":3,\"orderNum\":2,\"path\":\"gen\",\"component\":\"tool/gen/index\",\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"1\",\"perms\":\"tool:gen:list\",\"icon\":\"code\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":\"代码生成菜单\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:51:22', 350);
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":117,\"menuName\":\"系统接口\",\"parentId\":3,\"orderNum\":3,\"path\":\"swagger\",\"component\":\"tool/swagger/index\",\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"1\",\"perms\":\"tool:swagger:list\",\"icon\":\"swagger\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":\"系统接口菜单\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:51:28', 249);
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":3,\"menuName\":\"系统工具\",\"parentId\":0,\"orderNum\":3,\"path\":\"tool\",\"component\":null,\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"1\",\"perms\":null,\"icon\":\"tool\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":\"系统工具目录\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:51:32', 247);
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":3,\"menuName\":\"系统工具\",\"parentId\":0,\"orderNum\":3,\"path\":\"tool\",\"component\":null,\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":null,\"icon\":\"tool\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-17T13:51:31.000Z\",\"remark\":\"系统工具目录\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:51:41', 214);
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":3,\"menuName\":\"系统工具\",\"parentId\":0,\"orderNum\":3,\"path\":\"tool\",\"component\":null,\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"1\",\"perms\":null,\"icon\":\"tool\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-17T13:51:40.000Z\",\"remark\":\"系统工具目录\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:51:44', 213);
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":115,\"menuName\":\"表单构建\",\"parentId\":3,\"orderNum\":1,\"path\":\"build\",\"component\":\"tool/build/index\",\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"tool:build:list\",\"icon\":\"build\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-17T13:51:17.000Z\",\"remark\":\"表单构建菜单\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:51:50', 249);
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":3,\"menuName\":\"系统工具\",\"parentId\":0,\"orderNum\":3,\"path\":\"tool\",\"component\":null,\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"1\",\"perms\":null,\"icon\":\"tool\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-17T13:51:44.000Z\",\"remark\":\"系统工具目录\"}}', '{\"code\":500,\"msg\":\"该菜单下存在其他正在使用的菜单，无法停用！\"}', '1', '该菜单下存在其他正在使用的菜单，无法停用！', '2024-05-17 13:57:15', 174);
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":115,\"menuName\":\"表单构建\",\"parentId\":3,\"orderNum\":1,\"path\":\"build\",\"component\":\"tool/build/index\",\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"1\",\"perms\":\"tool:build:list\",\"icon\":\"build\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-17T13:51:50.000Z\",\"remark\":\"表单构建菜单\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:57:27', 442);
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":3,\"menuName\":\"系统工具\",\"parentId\":0,\"orderNum\":3,\"path\":\"tool\",\"component\":null,\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"1\",\"perms\":null,\"icon\":\"tool\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-17T13:51:44.000Z\",\"remark\":\"系统工具目录\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-17 13:57:49', 292);
INSERT INTO `sys_oper_log` VALUES (15, '用户管理', '2', 'SysUserController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"userId\":2,\"avatar\":null,\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:16.000Z\",\"delFlag\":\"0\",\"deptId\":105,\"email\":\"87789771@qq.com\",\"loginDate\":null,\"loginIp\":\"\",\"nickName\":\"槑槑\",\"password\":\"$2b$10$eOA3TW08QKta3zRSlhY6f.RXnOuzDwM0OGWAYh8zwVYMFwCkF.dme\",\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":null,\"userName\":\"meimei\",\"userType\":\"00\",\"dept\":{\"deptId\":105,\"parentId\":101,\"ancestors\":\",100,101,105,\",\"deptName\":\"测试部门\",\"orderNum\":3,\"leader\":\"若依\",\"phone\":\"15888888888\",\"email\":\"ry@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:16.000Z\",\"updateBy\":\"\",\"updateTime\":null},\"posts\":[],\"roles\":[{\"roleId\":2,\"createBy\":\"admin\",\"createTime\":\"2024-04-18T16:07:17.000Z\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"remark\":\"普通角色\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":null}],\"postIds\":[],\"roleIds\":[2]}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-05-18 02:16:38', 771);
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', '1', 'SysMenuController.add()', 'POST', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"parentId\":0,\"menuName\":\"图书管理\",\"icon\":\"druid\",\"menuType\":\"M\",\"orderNum\":0,\"isFrame\":\"1\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"bookSys\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-12-05 06:14:29', 142);
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', '1', 'SysMenuController.add()', 'POST', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"parentId\":1061,\"menuName\":\"图书卡\",\"menuType\":\"C\",\"orderNum\":0,\"isFrame\":\"1\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"book\",\"component\":\"bookSys/book/index\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-12-05 06:15:41', 181);
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', '2', 'SysMenuController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"menuId\":1062,\"menuName\":\"图书库\",\"parentId\":1061,\"orderNum\":0,\"path\":\"book\",\"component\":\"bookSys/book/index\",\"query\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":null,\"icon\":\"#\",\"createBy\":\"admin\",\"createTime\":\"2024-12-05T06:15:41.000Z\",\"updateBy\":\"\",\"updateTime\":null,\"remark\":\"\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-12-05 06:15:52', 139);
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', '1', 'SysMenuController.add()', 'POST', 0, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"params\":{},\"query\":{},\"body\":{\"parentId\":1061,\"menuName\":\"阅读计划\",\"menuType\":\"C\",\"orderNum\":1,\"isFrame\":\"1\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"readPlan\",\"component\":\"bookSys/readPlan/index\"}}', '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-12-05 06:16:29', 64);
INSERT INTO `sys_oper_log` VALUES (20, '图书管理', '2', 'SysBookController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/bookList', '127.0.0.1', '内网IP', NULL, '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-12-05 06:16:46', 78);
INSERT INTO `sys_oper_log` VALUES (21, '图书管理', '1', 'SysBookController.add()', 'POST', 0, 'admin', '研发部门', '/system/bookList', '127.0.0.1', '内网IP', NULL, '{\"code\":400,\"msg\":[\"bookName must be a string\",\"price must be a string\",\"menuType must be a string\"]}', '1', 'bookName must be a string,price must be a string,menuType must be a string', '2024-12-05 06:28:14', 4);
INSERT INTO `sys_oper_log` VALUES (22, '图书管理', '1', 'SysBookController.add()', 'POST', 0, 'admin', '研发部门', '/system/bookList', '127.0.0.1', '内网IP', NULL, '{\"code\":400,\"msg\":[\"bookName must be a string\",\"price must be a string\",\"menuType must be a string\"]}', '1', 'bookName must be a string,price must be a string,menuType must be a string', '2024-12-05 06:29:50', 4);
INSERT INTO `sys_oper_log` VALUES (23, '图书计划', '1', 'SysBookController.add()', 'POST', 0, 'admin', '研发部门', '/system/bookPlan', '127.0.0.1', '内网IP', NULL, '{\"code\":500,\"msg\":\"PrismaClientValidationError: \\nInvalid `this.prisma.sysReadPlan.create()` invocation in\\nD:\\\\www3\\\\meimei-nestjs-admin-main\\\\meimei-prisma-vue3\\\\meimei-admin\\\\src\\\\modules\\\\sys\\\\sys-read-plan\\\\sys-plan.service.ts:54:42\\n\\n  51 // /* 新增 */\\n  52 async add(addSysNoticeDto: AddSysNoticeDto) {\\n  53   const data = Object.assign({}, addSysNoticeDto,);\\n→ 54   return await this.prisma.sysReadPlan.create({\\n         data: {\\n           planName: \\\"每日一读\\\",\\n           startTime: \\\"2024-10-11\\\",\\n                      ~~~~~~~~~~~~\\n           endTime: \\\"2024-10-21\\\",\\n           userId: 2,\\n           createBy: \\\"admin\\\",\\n           createTime: \\\"2024-12-05T14:31:46+08:00\\\"\\n         }\\n       })\\n\\nInvalid value for argument `startTime`: premature end of input. Expected ISO-8601 DateTime.\"}', '1', 'PrismaClientValidationError: \nInvalid `this.prisma.sysReadPlan.create()` invocation in\nD:\\www3\\meimei-nestjs-admin-main\\meimei-prisma-vue3\\meimei-admin\\src\\modules\\sys\\sys-read-plan\\sys-plan.service.ts:54:42\n\n  51 // /* 新增 */\n  52 async add(addSysNoticeDto: AddSysNoticeDto) {\n  53   const data = Object.assign({}, addSysNoticeDto,);\n→ 54   return await this.prisma.sysReadPlan.create({\n         data: {\n           planName: \"每日一读\",\n           startTime: \"2024-10-11\",\n                      ~~~~~~~~~~~~\n           endTime: \"2024-10-21\",\n           userId: 2,\n           createBy: \"admin\",\n           createTime: \"2024-12-05T14:31:46+08:00\"\n         }\n       })\n\nInvalid value for argument `startTime`: premature end of input. Expected ISO-8601 DateTime.', '2024-12-05 06:31:46', 66);
INSERT INTO `sys_oper_log` VALUES (24, '图书计划', '1', 'SysBookController.add()', 'POST', 0, 'admin', '研发部门', '/system/bookPlan', '127.0.0.1', '内网IP', NULL, '{\"code\":500,\"msg\":\"PrismaClientValidationError: \\nInvalid `this.prisma.sysReadPlan.create()` invocation in\\nD:\\\\www3\\\\meimei-nestjs-admin-main\\\\meimei-prisma-vue3\\\\meimei-admin\\\\src\\\\modules\\\\sys\\\\sys-read-plan\\\\sys-plan.service.ts:54:42\\n\\n  51 // /* 新增 */\\n  52 async add(addSysNoticeDto: AddSysNoticeDto) {\\n  53   const data = Object.assign({}, addSysNoticeDto,);\\n→ 54   return await this.prisma.sysReadPlan.create({\\n         data: {\\n           planName: \\\"每日一读\\\",\\n           startTime: \\\"2024-10-11 00:00:00\\\",\\n                      ~~~~~~~~~~~~~~~~~~~~~\\n           endTime: \\\"2024-10-21 00:00:00\\\",\\n           userId: 2,\\n           createBy: \\\"admin\\\",\\n           createTime: \\\"2024-12-05T14:32:22+08:00\\\"\\n         }\\n       })\\n\\nInvalid value for argument `startTime`: input contains invalid characters. Expected ISO-8601 DateTime.\"}', '1', 'PrismaClientValidationError: \nInvalid `this.prisma.sysReadPlan.create()` invocation in\nD:\\www3\\meimei-nestjs-admin-main\\meimei-prisma-vue3\\meimei-admin\\src\\modules\\sys\\sys-read-plan\\sys-plan.service.ts:54:42\n\n  51 // /* 新增 */\n  52 async add(addSysNoticeDto: AddSysNoticeDto) {\n  53   const data = Object.assign({}, addSysNoticeDto,);\n→ 54   return await this.prisma.sysReadPlan.create({\n         data: {\n           planName: \"每日一读\",\n           startTime: \"2024-10-11 00:00:00\",\n                      ~~~~~~~~~~~~~~~~~~~~~\n           endTime: \"2024-10-21 00:00:00\",\n           userId: 2,\n           createBy: \"admin\",\n           createTime: \"2024-12-05T14:32:22+08:00\"\n         }\n       })\n\nInvalid value for argument `startTime`: input contains invalid characters. Expected ISO-8601 DateTime.', '2024-12-05 06:32:22', 36);
INSERT INTO `sys_oper_log` VALUES (25, '图书计划', '1', 'SysBookController.add()', 'POST', 0, 'admin', '研发部门', '/system/bookPlan', '127.0.0.1', '内网IP', NULL, '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-12-05 06:36:16', 95);
INSERT INTO `sys_oper_log` VALUES (26, '图书管理', '2', 'SysBookController.uplate()', 'PUT', 0, 'admin', '研发部门', '/system/bookList', '127.0.0.1', '内网IP', NULL, '{\"code\":200,\"msg\":\"操作成功\"}', '0', NULL, '2024-12-05 07:48:52', 143);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `postCode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postSort` int(11) NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`postId`) USING BTREE,
  UNIQUE INDEX `sys_post_postCode_key`(`postCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-04-18 16:07:16', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-04-18 16:07:16', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-04-18 16:07:16', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-04-18 16:07:16', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_read_plan
-- ----------------------------
DROP TABLE IF EXISTS `sys_read_plan`;
CREATE TABLE `sys_read_plan`  (
  `planId` int(11) NOT NULL AUTO_INCREMENT,
  `planName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` datetime(3) NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updateTime` datetime(3) NULL DEFAULT NULL,
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `startTime` datetime(3) NULL DEFAULT NULL,
  `endTime` datetime(3) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`planId`) USING BTREE,
  INDEX `sys_read_plan_userId_fkey`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_read_plan
-- ----------------------------
INSERT INTO `sys_read_plan` VALUES (1, '阅读计划2', NULL, NULL, NULL, NULL, NULL, '2024-12-05 14:31:00.000', '2025-03-21 14:31:04.000', 1);
INSERT INTO `sys_read_plan` VALUES (2, '每日一读', '2024-12-05 06:36:16.000', NULL, NULL, 'admin', NULL, '2025-01-21 14:31:04.000', '2025-03-21 14:31:04.000', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `dataScope` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '4',
  `delFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `deptCheckStrictly` tinyint(1) NULL DEFAULT 1,
  `menuCheckStrictly` tinyint(1) NULL DEFAULT 1,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `roleKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleSort` int(11) NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '2024-05-17 16:07:16', '1', '0', 1, 1, '超级管理员', 'admin', '超级管理员', 1, '0', '', NULL);
INSERT INTO `sys_role` VALUES (2, 'admin', '2024-05-17 16:07:16', '2', '0', 1, 1, '普通角色', 'common', '普通角色', 2, '0', '', NULL);

-- ----------------------------
-- Table structure for sys_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_table`;
CREATE TABLE `sys_table`  (
  `tableId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `tableJsonConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`tableId`, `createBy`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_table
-- ----------------------------
INSERT INTO `sys_table` VALUES ('system_user_1', 'admin', '2024-05-17 14:11:38', '', NULL, '[{\"minWidth\":40,\"showOverflowTooltip\":false,\"align\":\"center\",\"hide\":false,\"noExport\":false,\"sort\":0,\"prop\":\"勾选框\",\"label\":\"勾选框\",\"type\":\"selection\"},{\"minWidth\":100,\"showOverflowTooltip\":true,\"align\":\"center\",\"hide\":false,\"noExport\":false,\"sort\":1,\"prop\":\"userId\",\"label\":\"用户编号\"},{\"minWidth\":100,\"showOverflowTooltip\":true,\"align\":\"left\",\"hide\":false,\"noExport\":false,\"sort\":2,\"prop\":\"userName\",\"label\":\"用户名称\"},{\"minWidth\":100,\"showOverflowTooltip\":true,\"align\":\"left\",\"hide\":false,\"noExport\":false,\"sort\":3,\"prop\":\"nickName\",\"label\":\"用户昵称\"},{\"minWidth\":140,\"showOverflowTooltip\":true,\"align\":\"left\",\"hide\":false,\"noExport\":false,\"sort\":4,\"prop\":\"dept.deptName\",\"label\":\"部门\"},{\"minWidth\":80,\"showOverflowTooltip\":true,\"align\":\"center\",\"hide\":false,\"noExport\":false,\"sort\":5,\"prop\":\"status\",\"label\":\"状态\",\"slot\":\"status\"},{\"minWidth\":160,\"showOverflowTooltip\":true,\"align\":\"center\",\"hide\":false,\"noExport\":false,\"sort\":6,\"prop\":\"createTime\",\"label\":\"创建时间\",\"slot\":\"createTime\"},{\"minWidth\":160,\"showOverflowTooltip\":false,\"align\":\"center\",\"hide\":false,\"noExport\":false,\"sort\":7,\"prop\":\"操作\",\"label\":\"操作\",\"slot\":\"operate\"}]');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `createTime` datetime NULL DEFAULT NULL,
  `delFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `deptId` int(11) NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `loginDate` datetime NULL DEFAULT NULL,
  `loginIp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `nickName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00',
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `sys_user_userName_key`(`userName`) USING BTREE,
  INDEX `sys_user_deptId_fkey`(`deptId`) USING BTREE,
  CONSTRAINT `sys_user_deptId_fkey` FOREIGN KEY (`deptId`) REFERENCES `sys_dept` (`deptId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, 'admin', '2024-05-17 16:07:16', '0', 103, '87789771@qq.com', NULL, '', '小蒋', '$2b$10$dfDByASRziLltpJ9OQ8cTuSeaz3Kqv.BR1MWQoQ1bR3UfgEKYE0w6', '15888888888', '管理员', '1', '0', 'admin', NULL, 'admin', '00');
INSERT INTO `sys_user` VALUES (2, NULL, 'admin', '2024-05-17 16:07:16', '0', 105, '87789771@qq.com', NULL, '', '槑槑', '$2b$10$eOA3TW08QKta3zRSlhY6f.RXnOuzDwM0OGWAYh8zwVYMFwCkF.dme', '15666666666', '测试员', '1', '0', 'admin', '2024-05-18 02:16:37', 'meimei', '00');

-- ----------------------------
-- Table structure for sys_web
-- ----------------------------
DROP TABLE IF EXISTS `sys_web`;
CREATE TABLE `sys_web`  (
  `webId` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#409EFF',
  `sideTheme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `topNav` tinyint(1) NULL DEFAULT NULL,
  `tagsView` tinyint(1) NULL DEFAULT NULL,
  `fixedHeader` tinyint(1) NULL DEFAULT NULL,
  `sidebarLogo` tinyint(1) NULL DEFAULT NULL,
  `dynamicTitle` tinyint(1) NULL DEFAULT NULL,
  `createBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateBy` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `updateTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`webId`) USING BTREE,
  UNIQUE INDEX `sys_web_createBy_key`(`createBy`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_web
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
