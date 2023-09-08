package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 银行对象 baoxiao_bank
 *
 * @author baoxiao
 * @date 2023-09-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("baoxiao_bank")
public class BaoxiaoBank extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 银行id
     */
    @TableId(value = "bank_id")
    private Long bankId;
    /**
     * 银行名称
     */
    private String bankName;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 状态（0显示 1隐藏）
     */
    private Integer status;
    /**
     * 备注
     */
    private String remark;

}
