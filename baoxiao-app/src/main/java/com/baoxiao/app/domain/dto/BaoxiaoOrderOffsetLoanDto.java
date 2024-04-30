package com.baoxiao.app.domain.dto;

import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

@Data
@EqualsAndHashCode()
public class BaoxiaoOrderOffsetLoanDto {

    @NotNull(message = "报销id不能为空", groups = { EditGroup.class })
    private Long orderId;

    @NotNull(message = "金额合计不能为空", groups = { EditGroup.class })
    private BigDecimal totalAmount;

    @NotNull(message = "冲借款金额不能为空", groups = { EditGroup.class })
    private BigDecimal offsetLoanSum;

    @NotEmpty(message = "冲借款列表不能为空", groups = {EditGroup.class})
    private List<BaoxiaoOffsetLoanDto> offsetLoans;
}
