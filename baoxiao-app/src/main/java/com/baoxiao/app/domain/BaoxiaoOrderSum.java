package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 订单金额对象 baoxiao_order_sum
 *
 * @author baoxiao
 * @date 2024-03-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("baoxiao_order_sum")
public class BaoxiaoOrderSum extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 订单金额id
     */
    @TableId(value = "order_sum_id")
    private Long orderSumId;
    /**
     * 订单id
     */
    private Long orderId;
    /**
     * 还款金额
     */
    private BigDecimal repaymentSum;
    /**
     * 支付金额
     */
    private BigDecimal paymentSum;
    /**
     * 冲借款金额
     */
    private BigDecimal offsetLoanSum;

}
