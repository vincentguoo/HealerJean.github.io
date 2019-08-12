/*
 * Copyright (C) 2019 xiaomi.com, Inc. All Rights Reserved.
 */package com.hlj.proj.data.pojo.flow;

import java.io.Serializable;
import lombok.Data;
/**
 * @author zhangyujin
 * @ClassName: FlowAuditRecordLog
 * @date 2099/1/1
 * @Description: FlowAuditRecordLog
 */
@Data
public class FlowAuditRecordLog implements Serializable{
	private static final long serialVersionUID = 1L;

	/** 主键 */
	private Long id;
	/** 审批记录表主键 */
	private Long refFlowAuditRecordId;
	/** 审批附件 */
	private String refFileIds;
	/** 流程实例流水号 */
	private String instantsNo;
	/** 流程步骤 */
	private Integer sept;
	/** 节点编码 */
	private String flowCode;
	/** 节点名称 */
	private String flowName;
	/** 节点编号 */
	private String nodeCode;
	/** 节点名称 */
	private String nodeName;
	/** 审核步骤 */
	private Integer auditSept;
	/** 审批内容 */
	private String auditData;
	/** 状态 */
	private String status;
	/** 执行人 */
	private Long optUser;
	/** 执行人真实名称 */
	private String optUserName;
	/** 执行时间 */
	private java.util.Date optTime;
	/** 审批意见 */
	private String auditMessage;
	/** 创建时间 */
	private java.util.Date createTime;
	/** 更新时间 */
	private java.util.Date updateTime;

}
