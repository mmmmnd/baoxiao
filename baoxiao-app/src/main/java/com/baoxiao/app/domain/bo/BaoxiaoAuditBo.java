package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


/**
 * 审批流业务对象 baoxiao_audit
 *
 * @author baoxiao
 * @date 2023-11-10
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoAuditBo extends BaseEntity {

    /**
     *  审批流id
     */
    @NotNull(message = " 审批流id不能为空", groups = { EditGroup.class })
    private Long auditId;

    /**
     * 订单id
     */
    @NotNull(message = "订单id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long orderId;

    /**
     * 用户id
     */
    @NotNull(message = "用户id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long userId;

    /**
     * 用户名
     */
    @NotBlank(message = "用户名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String userName;

    /**
     * 职位
     */
    @NotBlank(message = "职位不能为空", groups = { AddGroup.class, EditGroup.class })
    private String position;

    /**
     * 状态
     */
    @NotBlank(message = "状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 备注
     */
    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;
}
