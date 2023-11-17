package com.baoxiao.app.domain.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.baoxiao.common.annotation.DictFormat;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 订单视图对象 baoxiao_order
 *
 * @author baoxiao
 * @date 2023-09-12
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoOrderVo {

    private static final long serialVersionUID = 1L;

    /**
     * 订单id
     */
    @ExcelProperty(value = "订单id")
    private Long orderId;

    /**
     * 订单编号
     */
    @ExcelProperty(value = "订单编号")
    private Long orderNumber;

    /**
     * 订单类型
     */
    @DictFormat(dictDataSource = "order_type")
    @ExcelProperty(value = "订单类型")
    private Integer orderType;

    /**
     * 订单日期
     */
    @ExcelProperty(value = "订单日期")
    private Date orderDate;

    /**
     * 报销类型
     */
    @DictFormat(dictDataSource = "order_baoxiao_type")
    @ExcelProperty(value = "报销类型")
    private Integer baoxiaoType;

    /**
     * 报销金额
     */
    @ExcelProperty(value = "报销金额")
    private BigDecimal repaymentSum;

    /**
     * 支付金额
     */
    @ExcelProperty(value = "支付金额")
    private BigDecimal paymentSum;

    /**
     * 冲借款金额
     */
    @ExcelProperty(value = "冲借款金额")
    private BigDecimal offsetLoanSum;

    /**
     * 金额合计
     */
    @ExcelProperty(value = "金额合计")
    private BigDecimal totalAmount;

    /**
     * 收款人
     */
    @ExcelProperty(value = "收款人")
    private Long collectionId;

    /**
     * 费用明细id
     */
    @ExcelProperty(value = "费用明细")
    private Long feeId;

    /**
     * 冲借款 (0 未冲 1已冲)
     */
    @DictFormat(dictDataSource = "order_offset_loan")
    @ExcelProperty(value = "冲借款 (0 未冲 1已冲)")
    private Integer isOffsetLoan;

    /**
     * 部门分摊 (0末分 1已分)
     */
    @DictFormat(dictDataSource = "order_dept_share")
    @ExcelProperty(value = "部门分摊 (0末分 1已分)")
    private Integer isDeptShare;

    /**
     * 状态 （0显示 1隐藏）
     */
    @ExcelProperty(value = "状态 ", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=显示,1=提交")
    private Integer orderStatus;

    /**
     * 制单人id
     */
    @ExcelProperty(value = "制单人id")
    private Long userId;

    /**
     * 制单人
     */
    @ExcelProperty(value = "制单人")
    private String userName;

    /**
     * 报销人id
     */
    @ExcelProperty(value = "报销人id")
    private Long baoxiaoUserId;

    /**
     * 报销人名称
     */
    @ExcelProperty(value = "报销人名称")
    private String baoxiaoUserName;

    /**
     * 报销部门id
     */
    @ExcelProperty(value = "报销部门id")
    private Long deptId;

    /**
     * 报销部门名称
     */
    @ExcelProperty(value = "报销部门名称")
    private String deptName;

    /**
     * 报销公司id
     */
    @ExcelProperty(value = "报销公司id")
    private Long companyId;

    /**
     * 客户id
     */
    @ExcelProperty(value = "客户id")
    private Long clientId;

    /**
     * 事由
     */
    @ExcelProperty(value = "事由")
    private String remark;

    /**
     * 审批流
     */
    @ExcelProperty(value = "审批流")
    private Long auditId;


}
