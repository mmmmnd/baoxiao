package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;
import java.math.BigDecimal;


/**
 * 费用明细业务对象 baoxiao_fee
 *
 * @author baoxiao
 * @date 2023-10-07
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoFeeBo extends BaseEntity {

    /**
     * 费用id
     */
    @NotNull(message = "费用id不能为空", groups = { EditGroup.class })
    private Long feeId;

    /**
     * 费用key
     */
    @NotBlank(message = "费用key不能为空", groups = { AddGroup.class, EditGroup.class })
    private String feeKey;

    /**
     * 费用value
     */
    @NotBlank(message = "费用value不能为空", groups = { AddGroup.class, EditGroup.class })
    private String feeValue;

    /**
     * 收支项目
     */
    @NotBlank(message = "收支项目不能为空", groups = { AddGroup.class, EditGroup.class })
    private String feeItem;
    /**
     * 报销金额
     */
    @NotBlank(message = "报销金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal baoxiaoSum;
    /**
     * 税率%
     */
    @NotBlank(message = "税率%不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal taxRate;
    /**
     * 进项税额（专票）
     */
    @NotBlank(message = "进项税额（专票）不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal specialRicket;
}
