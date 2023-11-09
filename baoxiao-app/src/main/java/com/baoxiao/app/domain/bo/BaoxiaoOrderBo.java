package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单业务对象 baoxiao_order
 *
 * @author baoxiao
 * @date 2023-09-12
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoOrderBo extends BaseEntity {

    /**
     * 订单id
     */
    @NotNull(message = "订单id不能为空", groups = { EditGroup.class })
    private Long orderId;

    /**
     * 订单编号
     */
    @NotBlank(message = "订单编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long orderNumber;

    /**
     * 订单类型
     */
    @NotNull(message = "订单类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer orderType;

    /**
     * 订单日期
     */
    @NotNull(message = "订单日期不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date orderDate;

    /**
     * 报销类型
     */
    @NotNull(message = "报销类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer baoxiaoType;

    /**
     * 报销金额
     */
    @NotNull(message = "报销金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal repaymentSum;

    /**
     * 支付金额
     */
    @NotNull(message = "支付金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal paymentSum;

    /**
     * 冲借款金额
     */
    @NotNull(message = "冲借款金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal offsetLoanSum;

    /**
     * 金额合计
     */
    @NotNull(message = "金额合计不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalAmount;

    /**
     * 收款人
     */
    @NotNull(message = "收款人不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long collectionId;

    /**
     * 费用明细id
     */
    @NotNull(message = "费用明细不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long feeId;

    /**
     * 冲借款 (0 未冲 1已冲)
     */
    @NotNull(message = "冲借款 (0 未冲 1已冲)不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isOffsetLoan;

    /**
     * 部门分摊 (0末分 1已分)
     */
    @NotNull(message = "部门分摊 (0末分 1已分)不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isDeptShare;

    /**
     * 状态 （0显示 1隐藏）
     */
    @NotNull(message = "状态 （0显示 1隐藏）不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer orderStatus;

    /**
     * 制单人id
     */
    @NotNull(message = "制单人id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long userId;

    /**
     * 报销人id
     */
    @NotNull(message = "报销人id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long baoxiaoUserId;

    /**
     * 报销人名称
     */
    @NotNull(message = "报销人员名称不能为空", groups = {AddGroup.class, EditGroup.class})
    private String baoxiaoUserName;

    /**
     * 报销部门id
     */
    @NotNull(message = "报销部门id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long deptId;

    /**
     * 报销部门名称
     */
    @NotNull(message = "报销部门名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String deptName;

    /**
     * 报销公司id
     */
    @NotNull(message = "报销公司id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long companyId;

    /**
     * 客户id
     */
    @NotNull(message = "客户id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long clientId;

    /**
     * 事由
     */
    @NotBlank(message = "事由不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

    /**
     * 审批流
     */
    @NotNull(message = "审批流不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long auditId;


}
