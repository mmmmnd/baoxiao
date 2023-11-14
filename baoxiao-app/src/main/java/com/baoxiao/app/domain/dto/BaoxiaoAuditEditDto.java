package com.baoxiao.app.domain.dto;

import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@EqualsAndHashCode()
public class BaoxiaoAuditEditDto {

    @NotNull(message = " 审批流id不能为空", groups = { EditGroup.class })
    private Long auditId;

    @NotNull(message = "状态不能为空", groups = { EditGroup.class })
    private Integer status;

    @NotBlank(message = "备注不能为空", groups = { EditGroup.class })
    private String remark;
}
