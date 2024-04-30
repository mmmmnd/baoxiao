package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 项目类型对象 baoxiao_project
 *
 * @author baoxiao
 * @date 2024-01-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("baoxiao_project")
public class BaoxiaoProject extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 项目id
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 父id
     */
    private Long pid;
    /**
     * 名称
     */
    private String name;
    /**
     * 布尔值
     */
    private Long disabled;
    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private Integer isDeleted;
    /**
     * 排序
     */
    private Long sort;
    /**
     * 备注
     */
    private String remark;

}
