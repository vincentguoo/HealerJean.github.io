/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : hlj-auditflow

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 12/08/2019 21:01:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flow_audit_record_log
-- ----------------------------
DROP TABLE IF EXISTS `flow_audit_record_log`;
CREATE TABLE `flow_audit_record_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_file_ids` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审批附件',
  `instants_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '流程实例流水号',
  `sept` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '流程步骤',
  `flow_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点编码',
  `flow_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点名称',
  `node_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点编号',
  `node_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点名称',
  `audit_sept` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '审核步骤',
  `audit_data` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审批内容',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `opt_user` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '执行人',
  `opt_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '执行人真实名称',
  `opt_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '执行时间',
  `audit_message` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审批意见',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `ref_flow_audit_record_id` bigint(20) UNSIGNED NOT NULL COMMENT '审批记录表主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '审批日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_audit_record_log
-- ----------------------------
INSERT INTO `flow_audit_record_log` VALUES (1, '', '4f3e2d4d89054a29ad0c2ad5bea56f5f', 3, 'auditJob', '审核任务', 'auditAJobDeal', '审核任务A处理', 1, '{\"instanceNo\":\"4f3e2d4d89054a29ad0c2ad5bea56f5f\",\"nextFlow\":true}', '20', 0, '', '2019-08-12 20:52:13', '', '2019-08-12 20:52:13', '2019-08-12 20:52:13', 4);
INSERT INTO `flow_audit_record_log` VALUES (2, 'null', '4f3e2d4d89054a29ad0c2ad5bea56f5f', 3, 'auditJob', '审核任务', 'auditAJobDeal', '审核任务A处理', 1, '{\"instanceNo\":\"4f3e2d4d89054a29ad0c2ad5bea56f5f\",\"nextFlow\":true}', '10', 1, 'healerjean', '2019-08-12 20:57:20', '', '2019-08-12 20:57:25', '2019-08-12 20:57:25', 4);
INSERT INTO `flow_audit_record_log` VALUES (3, '', '4f3e2d4d89054a29ad0c2ad5bea56f5f', 5, 'auditJob', '审核任务', 'auditBJobDeal', '审核任务B处理', 1, '{\"instanceNo\":\"4f3e2d4d89054a29ad0c2ad5bea56f5f\",\"nextFlow\":true}', '20', 0, '', '2019-08-12 20:59:29', '', '2019-08-12 20:59:29', '2019-08-12 20:59:29', 5);

-- ----------------------------
-- Table structure for flow_ref_auditor_event
-- ----------------------------
DROP TABLE IF EXISTS `flow_ref_auditor_event`;
CREATE TABLE `flow_ref_auditor_event`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_flow_audit_record_id` bigint(20) UNSIGNED NOT NULL COMMENT '审批记录表主键',
  `audit_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核类型：角色或ID',
  `audit_object` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '审核对象',
  `create_user` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '审批人和审批事件关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_ref_auditor_event
-- ----------------------------
INSERT INTO `flow_ref_auditor_event` VALUES (1, 4, 'ID', 1, 0, '', '2019-08-12 20:52:23', '2019-08-12 20:57:24');
INSERT INTO `flow_ref_auditor_event` VALUES (2, 4, 'ID', 2, 0, '', '2019-08-12 20:52:23', '2019-08-12 20:57:24');
INSERT INTO `flow_ref_auditor_event` VALUES (3, 4, 'ROLE', 1, 0, '', '2019-08-12 20:52:23', '2019-08-12 20:57:24');
INSERT INTO `flow_ref_auditor_event` VALUES (4, 4, 'ROLE', 2, 0, '', '2019-08-12 20:52:23', '2019-08-12 20:57:24');
INSERT INTO `flow_ref_auditor_event` VALUES (5, 5, 'ID', 1, 0, '', '2019-08-12 20:59:29', '2019-08-12 20:59:29');
INSERT INTO `flow_ref_auditor_event` VALUES (6, 5, 'ROLE', 1, 0, '', '2019-08-12 20:59:29', '2019-08-12 20:59:29');

-- ----------------------------
-- Table structure for scf_flow_audit_record
-- ----------------------------
DROP TABLE IF EXISTS `scf_flow_audit_record`;
CREATE TABLE `scf_flow_audit_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_file_ids` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审批附件',
  `instants_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '流程实例流水号',
  `sept` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '流程步骤',
  `flow_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点编码',
  `flow_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点名称',
  `node_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点编号',
  `node_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点名称',
  `audit_sept` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '审核步骤',
  `audit_data` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审批内容',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `opt_user` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '执行人',
  `opt_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '执行人真实名称',
  `opt_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '执行时间',
  `audit_message` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审批意见',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '审核记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_flow_audit_record
-- ----------------------------
INSERT INTO `scf_flow_audit_record` VALUES (1, 'null', 'a23f418d2a47479798748455717d849a', 3, 'auditJob', '审核任务', 'auditAJobDeal', '审核任务A处理', 1, '', '10', 1, 'healerjean', '2019-08-12 18:52:02', '同意', '2019-08-11 19:55:27', '2019-08-12 18:52:03');
INSERT INTO `scf_flow_audit_record` VALUES (2, '', '36728967c1de4bc38fd5c2dc6ff1f67e', 3, 'auditJob', '审核任务', 'auditAJobDeal', '审核任务A处理', 1, '', '20', 0, '', '2019-08-12 17:01:49', '', '2019-08-12 17:01:49', '2019-08-12 17:01:49');
INSERT INTO `scf_flow_audit_record` VALUES (3, '', 'a23f418d2a47479798748455717d849a', 5, 'auditJob', '审核任务', 'auditBJobDeal', '审核任务B处理', 1, '', '20', 0, '', '2019-08-12 18:53:32', '', '2019-08-12 18:53:32', '2019-08-12 18:53:32');
INSERT INTO `scf_flow_audit_record` VALUES (4, 'null', '4f3e2d4d89054a29ad0c2ad5bea56f5f', 3, 'auditJob', '审核任务', 'auditAJobDeal', '审核任务A处理', 1, '{\"instanceNo\":\"4f3e2d4d89054a29ad0c2ad5bea56f5f\",\"nextFlow\":true}', '10', 1, 'healerjean', '2019-08-12 20:57:20', '', '2019-08-12 20:52:12', '2019-08-12 20:57:21');
INSERT INTO `scf_flow_audit_record` VALUES (5, '', '4f3e2d4d89054a29ad0c2ad5bea56f5f', 5, 'auditJob', '审核任务', 'auditBJobDeal', '审核任务B处理', 1, '{\"instanceNo\":\"4f3e2d4d89054a29ad0c2ad5bea56f5f\",\"nextFlow\":true}', '20', 0, '', '2019-08-12 20:59:29', '', '2019-08-12 20:59:29', '2019-08-12 20:59:29');

-- ----------------------------
-- Table structure for scf_flow_definition
-- ----------------------------
DROP TABLE IF EXISTS `scf_flow_definition`;
CREATE TABLE `scf_flow_definition`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `flow_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点编码',
  `flow_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点名称',
  `flow_definition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点内部定义（目前主要是审核节点使用）',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `create_user` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_flow_definition
-- ----------------------------
INSERT INTO `scf_flow_definition` VALUES (1, 'demoJob', 'Demo任务', '[\"demoJobSubmit\",\"demoAJobDeal\",\"demoBJobDeal\",\"demoCJobDeal\",\"demoJobsuccess\"]', '10', 0, '', '2019-08-11 17:54:45', 0, '', '2019-08-11 18:11:07');
INSERT INTO `scf_flow_definition` VALUES (2, 'auditJob', '审核任务', '[\"auditJobSubmit\",\"auditServiceAJobDeal\",\"auditAJobDeal\",\"auditServiceBJobDeal\",\"auditBJobDeal\",\"auditJobsuccess\"]', '10', 0, '', '2019-08-11 19:07:24', 0, '', '2019-08-11 19:39:29');

-- ----------------------------
-- Table structure for scf_flow_node
-- ----------------------------
DROP TABLE IF EXISTS `scf_flow_node`;
CREATE TABLE `scf_flow_node`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `node_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点编号',
  `node_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点名称',
  `node_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '流程节点或者审核节点',
  `node_detail` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点内部定义（目前主要是审核节点使用）',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `create_user` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '更新人',
  `update_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_flow_node
-- ----------------------------
INSERT INTO `scf_flow_node` VALUES (1, 'demoJobSubmit', '任务提交', 'ServiceNode', '', '10', 0, '', '2019-08-11 17:50:52', 0, '', '2019-08-11 17:50:52');
INSERT INTO `scf_flow_node` VALUES (2, 'demoAJobDeal', '任务A处理', 'ServiceNode', '', '10', 0, '', '2019-08-11 17:51:12', 0, '', '2019-08-11 17:51:12');
INSERT INTO `scf_flow_node` VALUES (3, 'demoBJobDeal', '任务B处理', 'ServiceNode', '', '10', 0, '', '2019-08-11 17:51:26', 0, '', '2019-08-11 17:51:26');
INSERT INTO `scf_flow_node` VALUES (4, 'demoCJobDeal', '任务C处理', 'ServiceNode', '', '10', 0, '', '2019-08-11 17:51:53', 0, '', '2019-08-11 17:51:53');
INSERT INTO `scf_flow_node` VALUES (5, 'demoJobsuccess', '任务完成', 'ServiceNode', '', '10', 0, '', '2019-08-11 17:52:06', 0, '', '2019-08-11 17:52:06');
INSERT INTO `scf_flow_node` VALUES (6, 'auditJobSubmit', '审核任务提交', 'ServiceNode', '', '10', 0, '', '2019-08-11 18:49:28', 0, '', '2019-08-11 18:49:28');
INSERT INTO `scf_flow_node` VALUES (7, 'auditServiceAJobDeal', '审核任务ServiceA处理', 'ServiceNode', '', '10', 0, '', '2019-08-11 18:49:44', 0, '', '2019-08-11 18:49:58');
INSERT INTO `scf_flow_node` VALUES (8, 'auditAJobDeal', '审核任务A处理', 'AuditNode', '[{\"roles\" : [1,2], \"ids\":[1,2]}]', '10', 0, '', '2019-08-11 18:50:11', 0, '', '2019-08-11 19:47:30');
INSERT INTO `scf_flow_node` VALUES (9, 'auditServiceBJobDeal', '审核任务ServiceB处理', 'ServiceNode', '', '10', 0, '', '2019-08-11 18:50:27', 0, '', '2019-08-11 18:53:13');
INSERT INTO `scf_flow_node` VALUES (10, 'auditBJobDeal', '审核任务B处理', 'AuditNode', '[{\"roles\" : [1], \"ids\":[1]},{\"roles\" : [2], \"ids\":[2]}]', '10', 0, '', '2019-08-11 18:50:35', 0, '', '2019-08-11 19:47:14');
INSERT INTO `scf_flow_node` VALUES (11, 'auditServiceBJobDeal', '审核任务ServiceB处理', 'ServiceNode', '', '10', 0, '', '2019-08-11 18:50:57', 0, '', '2019-08-11 18:53:17');
INSERT INTO `scf_flow_node` VALUES (12, 'auditJobsuccess', '审核任务完成', 'ServiceNode', '', '10', 0, '', '2019-08-11 18:51:22', 0, '', '2019-08-11 18:53:19');

-- ----------------------------
-- Table structure for scf_flow_record
-- ----------------------------
DROP TABLE IF EXISTS `scf_flow_record`;
CREATE TABLE `scf_flow_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instants_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '流程实例流水号',
  `flow_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点编码',
  `flow_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点名称',
  `sept` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '流程步骤',
  `node_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点编号',
  `node_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节点名称',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '状态',
  `create_user` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_flow_record
-- ----------------------------
INSERT INTO `scf_flow_record` VALUES (1, '0107e3772dba42e1893710b3a752abba', 'demoJob', 'Demo任务', 1, 'demoJobSubmit', '任务提交', '10', 1, 'healerjean', '2019-08-11 18:29:36', '2019-08-11 18:29:36');
INSERT INTO `scf_flow_record` VALUES (2, '0107e3772dba42e1893710b3a752abba', 'demoJob', 'Demo任务', 2, 'demoAJobDeal', '任务A处理', '10', 1, 'healerjean', '2019-08-11 18:29:36', '2019-08-11 18:29:36');
INSERT INTO `scf_flow_record` VALUES (3, '0107e3772dba42e1893710b3a752abba', 'demoJob', 'Demo任务', 3, 'demoBJobDeal', '任务B处理', '10', 1, 'healerjean', '2019-08-11 18:29:36', '2019-08-11 18:30:00');
INSERT INTO `scf_flow_record` VALUES (4, '0107e3772dba42e1893710b3a752abba', 'demoJob', 'Demo任务', 4, 'demoCJobDeal', '任务C处理', '10', 1, 'healerjean', '2019-08-11 18:30:00', '2019-08-11 18:30:00');
INSERT INTO `scf_flow_record` VALUES (5, '0107e3772dba42e1893710b3a752abba', 'demoJob', 'Demo任务', 5, 'demoJobsuccess', '任务完成', '10', 1, 'healerjean', '2019-08-11 18:30:00', '2019-08-11 18:30:00');
INSERT INTO `scf_flow_record` VALUES (6, 'a23f418d2a47479798748455717d849a', 'auditJob', '审核任务', 1, 'auditJobSubmit', '审核任务提交', '10', 1, 'healerjean', '2019-08-11 19:50:57', '2019-08-11 19:50:57');
INSERT INTO `scf_flow_record` VALUES (7, 'a23f418d2a47479798748455717d849a', 'auditJob', '审核任务', 2, 'auditServiceAJobDeal', '审核任务ServiceA处理', '10', 1, 'healerjean', '2019-08-11 19:50:57', '2019-08-11 19:55:27');
INSERT INTO `scf_flow_record` VALUES (8, 'a23f418d2a47479798748455717d849a', 'auditJob', '审核任务', 3, 'auditAJobDeal', '审核任务A处理', '10', 1, 'healerjean', '2019-08-11 19:55:27', '2019-08-12 18:53:32');
INSERT INTO `scf_flow_record` VALUES (9, '36728967c1de4bc38fd5c2dc6ff1f67e', 'auditJob', '审核任务', 1, 'auditJobSubmit', '审核任务提交', '10', 1, 'healerjean', '2019-08-12 17:00:54', '2019-08-12 17:00:54');
INSERT INTO `scf_flow_record` VALUES (10, '36728967c1de4bc38fd5c2dc6ff1f67e', 'auditJob', '审核任务', 2, 'auditServiceAJobDeal', '审核任务ServiceA处理', '10', 1, 'healerjean', '2019-08-12 17:00:55', '2019-08-12 17:01:49');
INSERT INTO `scf_flow_record` VALUES (11, '36728967c1de4bc38fd5c2dc6ff1f67e', 'auditJob', '审核任务', 3, 'auditAJobDeal', '审核任务A处理', '20', 1, 'healerjean', '2019-08-12 17:01:49', '2019-08-12 17:01:49');
INSERT INTO `scf_flow_record` VALUES (12, 'a23f418d2a47479798748455717d849a', 'auditJob', '审核任务', 4, 'auditServiceBJobDeal', '审核任务ServiceB处理', '10', 1, 'healerjean', '2019-08-12 18:53:32', '2019-08-12 18:53:32');
INSERT INTO `scf_flow_record` VALUES (13, 'a23f418d2a47479798748455717d849a', 'auditJob', '审核任务', 5, 'auditBJobDeal', '审核任务B处理', '20', 1, 'healerjean', '2019-08-12 18:53:32', '2019-08-12 18:53:32');
INSERT INTO `scf_flow_record` VALUES (14, '4f3e2d4d89054a29ad0c2ad5bea56f5f', 'auditJob', '审核任务', 1, 'auditJobSubmit', '审核任务提交', '10', 1, 'healerjean', '2019-08-12 20:42:46', '2019-08-12 20:42:46');
INSERT INTO `scf_flow_record` VALUES (15, '4f3e2d4d89054a29ad0c2ad5bea56f5f', 'auditJob', '审核任务', 2, 'auditServiceAJobDeal', '审核任务ServiceA处理', '10', 1, 'healerjean', '2019-08-12 20:42:46', '2019-08-12 20:49:39');
INSERT INTO `scf_flow_record` VALUES (16, '4f3e2d4d89054a29ad0c2ad5bea56f5f', 'auditJob', '审核任务', 3, 'auditAJobDeal', '审核任务A处理', '10', 1, 'healerjean', '2019-08-12 20:49:39', '2019-08-12 20:59:12');
INSERT INTO `scf_flow_record` VALUES (17, '4f3e2d4d89054a29ad0c2ad5bea56f5f', 'auditJob', '审核任务', 4, 'auditServiceBJobDeal', '审核任务ServiceB处理', '10', 1, 'healerjean', '2019-08-12 20:59:12', '2019-08-12 20:59:12');
INSERT INTO `scf_flow_record` VALUES (18, '4f3e2d4d89054a29ad0c2ad5bea56f5f', 'auditJob', '审核任务', 5, 'auditBJobDeal', '审核任务B处理', '20', 1, 'healerjean', '2019-08-12 20:59:12', '2019-08-12 20:59:12');

-- ----------------------------
-- Table structure for scf_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `scf_sys_menu`;
CREATE TABLE `scf_sys_menu`  (
  `id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统CODE',
  `menu_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单调用地址',
  `method` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调用方法（GET，POST，PUT，DELETE）',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `pid` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '父级id',
  `pchain` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父链id，“,”分隔',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` int(8) NULL DEFAULT NULL COMMENT '显示排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单图标',
  `front_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '前端菜单标识（前端菜单唯一标识）',
  `is_permission` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否需要权限拦截，10：需要，99：不需要',
  `menu_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单类型：0: 后端路径, 1:前端菜单，2:非展示前端菜单',
  `create_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `update_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人名称',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统模块-菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_sys_menu
-- ----------------------------
INSERT INTO `scf_sys_menu` VALUES (1, 'hlj-manager', '用户管理', '1', 'get', '10', 0, '0', NULL, NULL, NULL, NULL, '10', '1', NULL, NULL, '2019-06-04 19:28:14', NULL, NULL, '2019-07-09 17:24:01');
INSERT INTO `scf_sys_menu` VALUES (2, 'hlj-manager', '合同管理', '1', 'get', '10', 0, '0', NULL, NULL, NULL, NULL, '10', '1', NULL, NULL, '2019-07-09 15:25:45', NULL, NULL, '2019-07-09 15:49:19');
INSERT INTO `scf_sys_menu` VALUES (3, 'hlj-manager', '用户-修改', '/api/user/*', 'put', '10', 1, '1,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-06-12 17:19:08', NULL, NULL, '2019-07-09 15:29:22');
INSERT INTO `scf_sys_menu` VALUES (4, 'hlj-manager', '用户-删除', '/api/user/*', 'delete', '10', 1, '1,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-06-12 17:19:21', NULL, NULL, '2019-07-09 15:29:23');
INSERT INTO `scf_sys_menu` VALUES (5, 'hlj-manager', '用户-查询', '/api/user/*', 'get', '10', 1, '1,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-06-12 17:19:35', NULL, NULL, '2019-07-09 15:29:24');
INSERT INTO `scf_sys_menu` VALUES (6, 'hlj-manager', '用户-新增', '/api/user/add', 'post', '10', 1, '1,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-06-12 17:21:05', NULL, NULL, '2019-07-09 15:29:26');
INSERT INTO `scf_sys_menu` VALUES (8, 'hlj-client', '用户-查询', '/api/users', 'get', '10', 12, '12,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-06-23 15:45:46', NULL, NULL, '2019-07-09 15:31:24');
INSERT INTO `scf_sys_menu` VALUES (9, 'hlj-manager', '用户-列表查询', '/api/users', 'get', '10', 1, '1,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-06-12 17:16:04', NULL, NULL, '2019-07-09 15:31:30');
INSERT INTO `scf_sys_menu` VALUES (10, 'hlj-manager', '合同-查询', '/api/contract/*', 'get', '10', 2, '2,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-07-09 15:27:23', NULL, NULL, '2019-07-09 15:31:46');
INSERT INTO `scf_sys_menu` VALUES (11, 'hlj-manager', '合同-修改', '/api/contract/*', 'get', '10', 2, '2,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-07-09 15:27:23', NULL, NULL, '2019-07-09 15:31:47');
INSERT INTO `scf_sys_menu` VALUES (12, 'hlj-client', '个人信息', '1', 'get', '10', 0, '0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-06-23 15:45:46', NULL, NULL, '2019-07-09 15:30:31');
INSERT INTO `scf_sys_menu` VALUES (13, 'hlj-manager', '系统管理', '1', 'get', '10', 0, '0', NULL, NULL, NULL, NULL, '10', '1', NULL, NULL, '2019-07-09 17:01:43', NULL, NULL, '2019-07-09 17:24:03');
INSERT INTO `scf_sys_menu` VALUES (14, 'hlj-manager', '系统-当前用户菜单查询', '/api/user/current/menus', 'get', '10', 15, '15,13,0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-07-09 17:02:11', NULL, NULL, '2019-07-09 17:21:32');
INSERT INTO `scf_sys_menu` VALUES (15, 'hlj-manager', '系统菜单', '/menu', 'get', '10', 13, '13,0', NULL, NULL, NULL, NULL, '10', '1', NULL, NULL, '2019-07-09 17:21:17', NULL, NULL, '2019-07-09 17:23:58');
INSERT INTO `scf_sys_menu` VALUES (16, 'hlj-manager', '审批任务', '/api/flow/*', 'get', '10', 0, '0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-08-11 17:55:43', NULL, NULL, NULL);
INSERT INTO `scf_sys_menu` VALUES (17, 'hlj-manager', '审批', '/api/flow/audit', 'post', '10', 0, '0', NULL, NULL, NULL, NULL, '10', '0', NULL, NULL, '2019-08-12 18:45:06', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for scf_sys_ref_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `scf_sys_ref_role_menu`;
CREATE TABLE `scf_sys_ref_role_menu`  (
  `id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_role_id` bigint(16) UNSIGNED NOT NULL COMMENT '角色ID',
  `ref_menu_id` bigint(16) UNSIGNED NOT NULL COMMENT '菜单ID',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `create_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `update_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人名称',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`ref_role_id`) USING BTREE COMMENT '角色id索引'
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统模块-角色与菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_sys_ref_role_menu
-- ----------------------------
INSERT INTO `scf_sys_ref_role_menu` VALUES (1, 1, 1, '10', NULL, NULL, '2019-06-13 15:53:50', NULL, NULL, '2019-06-23 15:28:52');
INSERT INTO `scf_sys_ref_role_menu` VALUES (2, 1, 2, '10', NULL, NULL, '2019-06-13 15:53:58', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (3, 1, 3, '10', NULL, NULL, '2019-06-13 15:54:10', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (4, 1, 4, '10', NULL, NULL, '2019-06-13 15:54:21', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (5, 1, 5, '10', NULL, NULL, '2019-06-13 15:54:29', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (6, 1, 6, '10', NULL, NULL, '2019-06-13 15:54:35', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (7, 1, 9, '10', NULL, NULL, '2019-06-23 15:46:04', NULL, NULL, '2019-07-09 15:32:16');
INSERT INTO `scf_sys_ref_role_menu` VALUES (8, 1, 10, '10', NULL, NULL, '2019-07-09 15:24:45', NULL, NULL, '2019-07-09 15:32:23');
INSERT INTO `scf_sys_ref_role_menu` VALUES (9, 1, 11, '10', NULL, NULL, '2019-07-09 15:24:54', NULL, NULL, '2019-07-09 15:32:24');
INSERT INTO `scf_sys_ref_role_menu` VALUES (10, 2, 9, '10', NULL, NULL, '2019-07-09 15:32:42', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (11, 2, 12, '10', NULL, NULL, '2019-07-09 15:32:49', NULL, NULL, '2019-07-09 15:33:03');
INSERT INTO `scf_sys_ref_role_menu` VALUES (12, 3, 2, '10', NULL, NULL, '2019-07-09 15:33:25', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (13, 3, 10, '10', NULL, NULL, '2019-07-09 15:33:29', NULL, NULL, '2019-07-09 15:33:42');
INSERT INTO `scf_sys_ref_role_menu` VALUES (14, 3, 11, '10', NULL, NULL, '2019-07-09 15:33:47', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (15, 1, 13, '10', NULL, NULL, '2019-07-09 17:02:43', NULL, NULL, '2019-07-09 17:02:59');
INSERT INTO `scf_sys_ref_role_menu` VALUES (16, 1, 14, '10', NULL, NULL, '2019-07-09 17:02:48', NULL, NULL, '2019-07-09 17:03:00');
INSERT INTO `scf_sys_ref_role_menu` VALUES (17, 1, 15, '10', NULL, NULL, '2019-07-09 17:22:11', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (18, 1, 16, '10', NULL, NULL, '2019-08-11 17:55:56', NULL, NULL, NULL);
INSERT INTO `scf_sys_ref_role_menu` VALUES (19, 1, 17, '10', NULL, NULL, '2019-08-12 18:45:18', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for scf_sys_ref_user_role
-- ----------------------------
DROP TABLE IF EXISTS `scf_sys_ref_user_role`;
CREATE TABLE `scf_sys_ref_user_role`  (
  `id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_user_id` bigint(16) UNSIGNED NOT NULL COMMENT '用户ID',
  `ref_role_id` bigint(16) UNSIGNED NOT NULL COMMENT '角色ID',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `create_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `update_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人名称',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`ref_user_id`) USING BTREE COMMENT '用户id索引'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统模块-用户与角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_sys_ref_user_role
-- ----------------------------
INSERT INTO `scf_sys_ref_user_role` VALUES (1, 1, 1, '10', 1, 'HealerJean', '2019-06-13 15:43:02', 1, 'HealerJean', NULL);
INSERT INTO `scf_sys_ref_user_role` VALUES (2, 2, 3, '10', NULL, NULL, '2019-07-09 15:34:05', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for scf_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `scf_sys_role`;
CREATE TABLE `scf_sys_role`  (
  `id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `ref_system_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统CODE',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `create_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `update_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人名称',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统模块-角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_sys_role
-- ----------------------------
INSERT INTO `scf_sys_role` VALUES (1, '系统管理员', 'hlj-manager', '10', '系统管理员', 1, 'HealerJean', '2019-06-13 15:43:42', 1, 'HealerJean', '2019-06-23 15:40:19');
INSERT INTO `scf_sys_role` VALUES (2, '前台用户', 'hlj-client', '10', '前台用户', 1, NULL, '2019-07-05 16:35:19', NULL, NULL, NULL);
INSERT INTO `scf_sys_role` VALUES (3, '运营用户', 'hlj-manager', '10', '系统的运营人员', NULL, NULL, '2019-07-09 15:15:21', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for scf_user_department
-- ----------------------------
DROP TABLE IF EXISTS `scf_user_department`;
CREATE TABLE `scf_user_department`  (
  `id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `department_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '部门名称',
  `department_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '部门描述',
  `pid` bigint(16) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主键',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `create_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `update_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人名称',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统模块-部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_user_department
-- ----------------------------
INSERT INTO `scf_user_department` VALUES (1, '平台部', '最高指挥部', 0, '10', NULL, NULL, '2019-06-23 15:30:33', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for scf_user_info
-- ----------------------------
DROP TABLE IF EXISTS `scf_user_info`;
CREATE TABLE `scf_user_info`  (
  `id` bigint(19) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `real_name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '用户名',
  `username` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '真实姓名',
  `password` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '密码',
  `email` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '邮箱',
  `telephone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '手机号',
  `gender` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '性别',
  `user_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '用户类型',
  `status` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '用户状态',
  `create_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '创建人',
  `create_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(16) UNSIGNED NULL DEFAULT NULL COMMENT '更新人',
  `update_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `new_column` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_user_info
-- ----------------------------
INSERT INTO `scf_user_info` VALUES (1, 'healerjean', 'HealerJean', 'admin', 'healerjean@gmail.com', '18888888888', 'gender', 'admin', '10', NULL, NULL, '2019-06-23 14:30:12', NULL, NULL, '2019-07-05 13:48:48', NULL);
INSERT INTO `scf_user_info` VALUES (2, 'operatorName', 'operator', 'admin', 'operate@gmail.com', '17777777777', 'gender', 'operator', '10', NULL, NULL, '2019-07-09 15:35:29', NULL, NULL, '2019-07-09 15:35:53', NULL);

-- ----------------------------
-- Table structure for scf_user_ref_user_department
-- ----------------------------
DROP TABLE IF EXISTS `scf_user_ref_user_department`;
CREATE TABLE `scf_user_ref_user_department`  (
  `id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_user_id` bigint(16) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户主键',
  `ref_department_id` bigint(16) UNSIGNED NOT NULL DEFAULT 0 COMMENT '部门主键',
  `status` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有效10有效，99废弃',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户模块-用户-部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scf_user_ref_user_department
-- ----------------------------
INSERT INTO `scf_user_ref_user_department` VALUES (1, 1, 1, '10');

SET FOREIGN_KEY_CHECKS = 1;
