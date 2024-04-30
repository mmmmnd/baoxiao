package com.baoxiao.app.domain.dto;

import com.baoxiao.app.domain.BaoxiaoCollection;
import com.baoxiao.app.domain.BaoxiaoFee;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

@Data
@EqualsAndHashCode()
public class BaoxiaoOrderEditDto {

    @NotNull(message = "报销id不能为空", groups = { EditGroup.class })
    private Long orderId;

    @NotNull(message = "报销公司不能为空", groups = { EditGroup.class })
    private Long companyId;

    @NotNull(message = "客商不能为空", groups = {EditGroup.class})
    private Long clientId;

    @NotNull(message = "报销人员不能为空", groups = {EditGroup.class})
    private Long baoxiaoUserId;

    @NotNull(message = "报销人员名称不能为空", groups = {EditGroup.class})
    private String baoxiaoUserName;

    @NotNull(message = "报销部门不能为空", groups = {EditGroup.class})
    private Long deptId;

    @NotNull(message = "报销部门名称不能为空", groups = {EditGroup.class})
    private String deptName;

    @NotNull(message = "金额合计不能为空", groups = {EditGroup.class })
    private BigDecimal totalAmount;

    private BigDecimal editableTotalAmount;

    private String personnels;

    private String remark;

    @NotNull(message = "费用明细不能为空", groups = {EditGroup.class})
    private List<BaoxiaoFee> fees;

    @NotNull(message = "收款人信息不能为空", groups = {EditGroup.class})
    private List<BaoxiaoCollection> collections;

    private List<Long> fileIds;
}
