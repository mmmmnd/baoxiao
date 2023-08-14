package com.baoxiao.system.domain.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class SysOssGroupVo {

    private static final long serialVersionUID = 1L;

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
    private String name;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 上传人
     */
    private String createBy;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 子分组
     */
    private List<SysOssGroupVo> children;


}
