package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 费用明细对象 baoxiao_fee
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@Data
@EqualsAndHashCode()
@TableName("baoxiao_fee")
public class BaoxiaoFee {

    private static final long serialVersionUID=1L;

    /**
     * 费用id
     */
    @TableId(value = "fee_id",type = IdType.INPUT)
    private Long feeId;
    /**
     * 收支项目
     */
    private String feeItem;
    /**
     * 报销金额
     */
    private String baoxiaoSum;
    /**
     * 税率%
     */
    private String taxRate;
    /**
     * 进项税额（专票）
     */
    private String specialRicket;







}
