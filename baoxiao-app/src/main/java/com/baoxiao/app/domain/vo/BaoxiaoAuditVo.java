package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.DictFormat;
import lombok.Data;


/**
 * 审批流视图对象 baoxiao_audit
 *
 * @author baoxiao
 * @date 2023-11-10
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoAuditVo {

    private static final long serialVersionUID = 1L;

    /**
     *  审批流id
     */
    @ExcelProperty(value = " 审批流id")
    private Long auditId;

    /**
     * 订单id
     */
    @ExcelProperty(value = "订单id")
    private Long orderId;

    /**
     * 用户id
     */
    @ExcelProperty(value = "用户id")
    private Long userId;

    /**
     * 用户名
     */
    @ExcelProperty(value = "用户名")
    private String userName;

    /**
     * 职位
     */
    @ExcelProperty(value = "职位")
    private String position;

    /**
     * 审批节点
     */
    @ExcelProperty(value = "审批节点")
    @DictFormat(dictDataSource = "audit_active_node")
    private Integer activeNode;

    /**
     * 节点
     */
    @ExcelProperty(value = "节点")
    private Integer node;

    /**
     * 状态
     */
    @ExcelProperty(value = "状态")
    @DictFormat(dictDataSource = "audit_status")
    private Integer status;

    /**
     * 订单次数
     */
    @ExcelProperty(value = "订单次数")
    private Integer orderNum;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;
}
