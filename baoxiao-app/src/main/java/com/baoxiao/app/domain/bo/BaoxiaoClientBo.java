package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


/**
 * 客户信息业务对象 baoxiao_client
 *
 * @author baoxiao
 * @date 2023-09-28
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoClientBo extends BaseEntity {

    /**
     * 客商id
     */
    @NotNull(message = "客商id不能为空", groups = { EditGroup.class })
    private Long clientId;

    /**
     * 客商单位名称
     */
    @NotBlank(message = "客商单位名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String clientUnitName;

    /**
     * 客商协议名称
     */
    @NotBlank(message = "客商协议名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String clientAgreementName;

    /**
     * 业务类型
     */
    @NotNull(message = "业务类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer businessType;

    /**
     * 客服人员
     */
    @NotBlank(message = "客服人员不能为空", groups = { AddGroup.class, EditGroup.class })
    private String customerName;

    /**
     * 销售人员
     */
    @NotBlank(message = "销售人员不能为空", groups = { AddGroup.class, EditGroup.class })
    private String sellName;

    /**
     * 联系人
     */
    @NotBlank(message = "联系人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String contactsName;

    /**
     * 联系电话
     */
    @NotBlank(message = "联系电话不能为空", groups = { AddGroup.class, EditGroup.class })
    private String phone;

    /**
     * 状态（0显示 1隐藏）
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;


}
