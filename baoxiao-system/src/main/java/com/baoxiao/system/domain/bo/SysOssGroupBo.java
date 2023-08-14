package com.baoxiao.system.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * 对象存储配置业务对象分组 sys_oss_groupBo
 *
 * @author
 * @author
 * @date
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysOssGroupBo extends BaseEntity {

    /**
     * id
     */
    private Long groupId;

    /**
     * 分组类型id（0是父id）
     */
    private Long groupType;

    /**
     * 分组名
     */
    @NotBlank(message = "分组名不能为空", groups = {AddGroup.class, EditGroup.class})
    private String name;

}
