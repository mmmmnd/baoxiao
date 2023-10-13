package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 收款人信息对象 baoxiao_collection
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@Data
@EqualsAndHashCode()
@TableName("baoxiao_collection")
public class BaoxiaoCollection {

    private static final long serialVersionUID=1L;

    /**
     * 费用id
     */
    @TableId(value = "collection_id", type = IdType.INPUT)
    private Long collectionId;
    /**
     * 金额
     */
    private BigDecimal collectionSum;
    /**
     * 收款人姓名
     */
    private String collectionUser;
    /**
     * 银行卡
     */
    private String collectionBank;
    /**
     * 银行名称
     */
    private String collectionBankName;
    /**
     * 开户行
     */
    private String collectionBankAddress;

}
