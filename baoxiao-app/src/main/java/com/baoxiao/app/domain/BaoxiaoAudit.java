package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.*;


/**
 * 审批流对象 baoxiao_audit
 *
 * @author baoxiao
 * @date 2023-11-10
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("baoxiao_audit")
public class BaoxiaoAudit extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     *  审批流id
     */
    @TableId(value = "audit_id")
    private Long auditId;
    /**
     * 订单id
     */
    private Long orderId;
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 职位
     */
    private String position;
    /**
     * 审批节点
     */
    private Integer activeNode;
    /**
     * 节点
     */
    private Integer node;
    /**
     * 最大节点
     */
    private Integer maxNode;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 备注
     */
    private String remark;

}
