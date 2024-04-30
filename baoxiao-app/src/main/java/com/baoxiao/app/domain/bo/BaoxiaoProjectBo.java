package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


/**
 * 项目类型业务对象 baoxiao_project
 *
 * @author baoxiao
 * @date 2024-01-03
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoProjectBo extends BaseEntity {

    /**
     * 项目id
     */
    @NotNull(message = "项目id不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 父id
     */
    @NotNull(message = "父id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long pid;

    /**
     * 名称
     */
    @NotBlank(message = "名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 布尔值
     */
    @NotNull(message = "布尔值不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long disabled;

    /**
     * 排序
     */
    @NotNull(message = "排序不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long sort;

    /**
     * 备注
     */
    private String remark;


}
