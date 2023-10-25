package com.baoxiao.app.domain;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 客户信息对象 baoxiao_client
 *
 * @author baoxiao
 * @date 2023-09-28
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("baoxiao_client")
public class BaoxiaoClient extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 客商id
     */
    @TableId(value = "client_id")
    private Long clientId;
    /**
     * 客商单位名称
     */
    private String clientUnitName;
    /**
     * 客商协议名称
     */
    private String clientAgreementName;
    /**
     * 业务类型
     */
    private Integer businessType;
    /**
     * 客服人员
     */
    private String customerName;
    /**
     * 销售人员
     */
    private String sellName;
    /**
     * 联系人
     */
    private String contactsName;
    /**
     * 联系电话
     */
    private String phone;
    /**
     * 状态（0显示 1隐藏）
     */
    private Integer status;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 备注
     */
    private String remark;
    /**
     * 删除标志（0代表存在 2代表删除）
     */
    @TableLogic
    private Integer delFlag;

}
