package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.annotation.Sensitive;
import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import com.baoxiao.common.enums.SensitiveStrategy;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.math.BigDecimal;

/**
 * 分摊对象 baoxiao_share
 *
 * @author baoxiao
 * @date 2024-04-03
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("baoxiao_share")
public class BaoxiaoShare extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 分摊id
     */
    @TableId(value = "share_id")
    private Long shareId;
    /**
     * 订单id
     */
    private Long orderId;
    /**
     * 客商单位id
     */
    private Long clientUnitId;
    /**
     * 客商单位名称
     */
    private String clientUnitName;
    /**
     * 人员id
     */
    private Long userId;
    /**
     * 人员名称
     */
    private String userName;
    /**
     * 部门id
     */
    private Long deptId;
    /**
     * 部门名称
     */
    @NotBlank(message = "部门名称不能为空")
    private String deptName;
    /**
     * 收支项目id
     */
    private Long projectId;
    /**
     * 收支项目名称
     */
    @NotBlank(message = "收支项目名称不能为空")
    private String projectName;
    /**
     * 分摊金额
     */
    private BigDecimal shareSum;
    /**
     * 不含税费金额
     */
    private String hasCommissionSum;
    /**
     * 税费金额（专票）
     */
    private BigDecimal commissionSum;

}
