package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.app.domain.BaoxiaoCollection;
import com.baoxiao.app.domain.BaoxiaoFee;
import com.baoxiao.app.domain.BaoxiaoOrderFile;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
@ExcelIgnoreUnannotated
public class BaoxiaoOrderInfoVo {

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
     * 订单日期
     */
    @ExcelProperty(value = "订单日期")
    private Date orderDate;

    /**
     * 报销公司id
     */
    @ExcelProperty(value = "报销公司id")
    private Long companyId;

    /**
     * 客商id
     */
    @ExcelProperty(value = "客商id")
    private Long clientId;

    /**
     * 制单人id
     */
    @ExcelProperty(value = "制单人id")
    private Long userId;

    /**
     * 报销人员
     */
    @ExcelProperty(value = "报销人员")
    private String userName;

    /**
     * 报销人员id
     */
    @ExcelProperty(value = "报销人员id")
    private Long baoxiaoUserId;

    /**
     * 报销人员
     */
    @ExcelProperty(value = "报销人员")
    private String baoxiaoUserName;

    /**
     * 报销部门id
     */
    @ExcelProperty(value = "报销部门id")
    private Long deptId;

    /**
     * 报销部门
     */
    @ExcelProperty(value = "报销部门")
    private String deptName;

    /**
     * 报销类型
     */
    @ExcelProperty(value = "报销类型")
    private Integer baoxiaoType;

    /**
     * 订单类型
     */
    @ExcelProperty(value = "报销类型")
    private Integer orderType;

    /**
     * 金额合计
     */
    @ExcelProperty(value = "金额合计")
    private BigDecimal totalAmount;

    /**
     * 报销金额
     */
    @ExcelProperty(value = "报销金额")
    private BigDecimal baoxiaoSum;

    /**
     * 支付金额
     */
    @ExcelProperty(value = "支付金额")
    private BigDecimal paymentSum;

    /**
     * 部门分摊 (0末分 1已分)
     */
    @ExcelProperty(value = "部门分摊")
    private Integer isDeptShare;

    /**
     * 冲借款 (0 未冲 1已冲)
     */
    @ExcelProperty(value = "冲借款")
    private Integer isOffsetLoan;

    /**
     * 冲借款金额
     */
    @ExcelProperty(value = "冲借款金额")
    private BigDecimal offsetLoanSum;

    /**
     * 状态 （0显示 1隐藏）
     */
    @ExcelProperty(value = "状态")
    private Integer orderStatus;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 审批流id
     */
    @ExcelProperty(value = "审批流id")
    private Long auditId;

    /**
     * 费用明细
     */
    @ExcelProperty(value = "费用明细")
    private List<BaoxiaoFee> fees;

    /**
     * 收款人信息
     */
    @ExcelProperty(value = "收款人信息")
    private List<BaoxiaoCollection> collections;

    /**
     * 订单附件
     */
    @ExcelProperty(value = "订单附件")
    private List<BaoxiaoOrderFile> files;
}
