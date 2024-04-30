package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.math.BigDecimal;

/**
 * 订单金额业务对象 baoxiao_order_sum
 *
 * @author baoxiao
 * @date 2024-03-29
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoOrderSumBo extends BaseEntity {

    /**
     * 订单金额id
     */
    @NotNull(message = "订单金额id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long orderSumId;

    /**
     * 订单id
     */
    @NotNull(message = "订单id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long orderId;

    /**
     * 还款金额
     */
    @NotNull(message = "还款金额不能为空", groups = { AddGroup.class, EditGroup.class })
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


}
