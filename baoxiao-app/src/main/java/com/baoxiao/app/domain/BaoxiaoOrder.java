package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单对象 baoxiao_order
 *
 * @author baoxiao
 * @date 2023-09-12
 */
@Data
@Builder
@EqualsAndHashCode(callSuper = true)
@TableName("baoxiao_order")
public class BaoxiaoOrder extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 订单id
     */
    @TableId(value = "order_id")
    private Long orderId;
    /**
     * 订单编号
     */
    private Long orderNumber;
    /**
     * 订单类型
     */
    private Integer orderType;
    /**
     * 订单日期
     */
    private Date orderDate;
    /**
     * 报销类型
     */
    private Integer baoxiaoType;
    /**
     * 报销金额
     */
    private BigDecimal baoxiaoSum;
    /**
     * 支付金额
     */
    private BigDecimal paymentSum;
    /**
     * 冲借款金额
     */
    private BigDecimal offsetLoanSum;
    /**
     * 金额合计
     */
    private BigDecimal totalAmount;
    /**
     * 收款人
     */
    private Long collectionId;
    /**
     * 费用明细id
     */
    private Long feeId;
    /**
     * 冲借款 (0 未冲 1已冲)
     */
    private Integer isOffsetLoan;
    /**
     * 部门分摊 (0末分 1已分)
     */
    private Integer isDeptShare;
    /**
     * 状态 （0显示 1隐藏）
     */
    private Integer orderStatus;
    /**
     * 制单人id
     */
    private Long userId;
    /**
     * 制单人
     */
    private String userName;
    /**
     * 报销人id
     */
    private Long baoxiaoUserId;
    /**
     * 报销人名称
     */
    private String baoxiaoUserName;
    /**
     * 报销部门id
     */
    private Long deptId;
    /**
     * 报销部门名称
     */
    private String deptName;
    /**
     * 报销公司id
     */
    private Long companyId;
    /**
     * 客户id
     */
    private Long clientId;
    /**
     * 事由
     */
    private String remark;
    /**
     * 审批流
     */
    private Long auditId;
    /**
     * 删除标志（0代表存在 2代表删除）
     */
    @TableLogic
    private Integer delFlag;
}
