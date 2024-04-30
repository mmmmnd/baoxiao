package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.math.BigDecimal;

/**
 * 分摊业务对象 baoxiao_share
 *
 * @author baoxiao
 * @date 2024-04-03
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoShareBo extends BaseEntity {

    /**
     * 分摊id
     */
    @NotNull(message = "分摊id不能为空", groups = { EditGroup.class })
    private Long shareId;

    /**
     * 订单id
     */
    @NotNull(message = "订单id不能为空", groups = { AddGroup.class,EditGroup.class })
    private Long orderId;

    /**
     * 客商单位id
     */
    @NotNull(message = "客商单位id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long clientUnitId;

    /**
     * 客商单位名称
     */
    @NotBlank(message = "客商单位名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String clientUnitName;

    /**
     * 人员id
     */
    @NotNull(message = "人员id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long userId;

    /**
     * 人员名称
     */
    @NotBlank(message = "人员名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String userName;

    /**
     * 部门id
     */
    @NotNull(message = "部门id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long deptId;

    /**
     * 部门名称
     */
    @NotBlank(message = "部门名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String deptName;

    /**
     * 收支项目id
     */
    @NotNull(message = "收支项目id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long projectId;

    /**
     * 收支项目名称
     */
    @NotBlank(message = "收支项目名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String projectName;

    /**
     * 分摊金额
     */
    @NotNull(message = "分摊金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal shareSum;

    /**
     * 不含税费金额
     */
    @NotBlank(message = "不含税费金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private String hasCommissionSum;

    /**
     * 税费金额（专票）
     */
    @NotNull(message = "税费金额（专票）不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal commissionSum;


}
