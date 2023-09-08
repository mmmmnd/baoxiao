package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


/**
 * 子公司管理业务对象 baoxiao_company
 *
 * @author baoxiao
 * @date 2023-09-05
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoCompanyBo extends BaseEntity {

    /**
     * 公司id
     */
    @NotNull(message = "公司id不能为空", groups = { EditGroup.class })
    private Long companyId;

    /**
     * 公司名称
     */
    @NotBlank(message = "公司名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String companyName;

    /**
     * 公司地址
     */
    @NotBlank(message = "公司地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String companyAddress;

    /**
     * 公司联系人
     */
    @NotBlank(message = "公司联系人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String companyContact;

    /**
     * 联系电话
     */
    @NotBlank(message = "联系电话不能为空", groups = { AddGroup.class, EditGroup.class })
    private String phone;

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
