package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


/**
 * 银行业务对象 baoxiao_bank
 *
 * @author baoxiao
 * @date 2023-09-05
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoBankBo extends BaseEntity {

    /**
     * 银行id
     */
    @NotNull(message = "银行id不能为空", groups = { EditGroup.class })
    private Long bankId;

    /**
     * 银行名称
     */
    @NotBlank(message = "银行名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String bankName;

    /**
     * 排序
     */
    @NotNull(message = "排序不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer sort;

    /**
     * 状态（0显示 1隐藏）
     */
    @NotNull(message = "状态（0显示 1隐藏）不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer status;

    /**
     * 备注
     */
    private String remark;


}
