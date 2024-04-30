package com.baoxiao.app.domain.vo;

import java.math.BigDecimal;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 订单金额视图对象 baoxiao_order_sum
 *
 * @author baoxiao
 * @date 2024-03-29
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoOrderSumVo {

    private static final long serialVersionUID = 1L;

    /**
     * 订单金额id
     */
    @ExcelProperty(value = "订单金额id")
    private Long orderSumId;

    /**
     * 订单id
     */
    @ExcelProperty(value = "订单id")
    private Long orderId;

    /**
     * 还款金额
     */
    @ExcelProperty(value = "还款金额")
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


}
