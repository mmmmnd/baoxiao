package com.baoxiao.system.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_oss_group")
public class SysOssGroup extends BaseEntity {

    /**
     * 主建
     */
    @TableId(value = "group_id")
    private Long groupId;

    /**
     * 分组类型id（0是父id）
     */
    private Long groupType;

    /**
     * 分组名
     */
    private String name;

}
