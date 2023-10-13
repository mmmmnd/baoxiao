package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.math.BigDecimal;

/**
 * 收款人信息业务对象 baoxiao_collection
 *
 * @author baoxiao
 * @date 2023-10-07
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoCollectionBo extends BaseEntity {

    /**
     * 费用id
     */
    @NotNull(message = "费用id不能为空", groups = { EditGroup.class })
    private Long collectionId;

    /**
     * 金额
     */
    @NotNull(message = "金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal collectionSum;

    /**
     * 收款人姓名
     */
    @NotBlank(message = "收款人姓名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String collectionUser;

    /**
     * 银行卡
     */
    @NotBlank(message = "银行卡不能为空", groups = { AddGroup.class, EditGroup.class })
    private String collectionBank;

    /**
     * 银行名称
     */
    @NotBlank(message = "银行名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String collectionBankName;

    /**
     * 开户行
     */
    @NotBlank(message = "开户行不能为空", groups = { AddGroup.class, EditGroup.class })
    private String collectionBankAddress;


}
