package com.baoxiao.app.domain.dto;

import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Data
@EqualsAndHashCode()
public class BaoxiaoOffsetLoanDto {

    @NotNull(message = "报销id不能为空", groups = { EditGroup.class })
    private Long orderId;

    @NotNull(message = "金额合计不能为空", groups = { EditGroup.class })
    private BigDecimal totalAmount;

    @NotNull(message = "冲借款金额不能为空", groups = { EditGroup.class })
    private BigDecimal offsetLoanSum;
}
