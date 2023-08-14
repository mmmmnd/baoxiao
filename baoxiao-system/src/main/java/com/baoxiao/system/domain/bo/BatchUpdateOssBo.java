package com.baoxiao.system.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * OSS对象存储分页查询对象 sys_oss
 *
 * @author Lion Li
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class BatchUpdateOssBo extends BaseEntity {

    /**
     * ossId
     */
    private Long ossId;

    /**
     * 分组id
     */
    private Long groupId;

    /**
     * 分组类型id
     */
    @NotNull(message = "分组类型id不能为空", groups = {AddGroup.class, EditGroup.class})
    @Min(message = "分组类型id不存在",value = 0, groups = {AddGroup.class, EditGroup.class})
    private Long groupType;

    /**
     * 文件名
     */
    private String fileName;

    /**
     * 原名
     */
    private String originalName;

    /**
     * 文件后缀名
     */
    private String fileSuffix;

    /**
     * URL地址
     */
    private String url;

    /**
     * 服务商
     */
    private String service;

}
