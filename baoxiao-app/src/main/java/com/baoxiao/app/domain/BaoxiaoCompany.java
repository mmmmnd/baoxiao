package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 子公司管理对象 baoxiao_company
 *
 * @author baoxiao
 * @date 2023-09-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("baoxiao_company")
public class BaoxiaoCompany extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 公司id
     */
    @TableId(value = "company_id")
    private Long companyId;
    /**
     * 公司名称
     */
    private String companyName;
    /**
     * 公司地址
     */
    private String companyAddress;
    /**
     * 公司联系人
     */
    private String companyContact;
    /**
     * 联系电话
     */
    private String phone;
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
