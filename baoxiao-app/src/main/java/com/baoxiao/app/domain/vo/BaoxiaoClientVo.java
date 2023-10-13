package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 客户信息视图对象 baoxiao_client
 *
 * @author baoxiao
 * @date 2023-09-28
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoClientVo {

    private static final long serialVersionUID = 1L;

    /**
     * 客商id
     */
    @ExcelProperty(value = "客商id")
    private Long clientId;

    /**
     * 客商单位名称
     */
    @ExcelProperty(value = "客商单位名称")
    private String clientUnitName;

    /**
     * 客商协议名称
     */
    @ExcelProperty(value = "客商协议名称")
    private String clientAgreementName;

    /**
     * 业务类型
     */
    @ExcelProperty(value = "业务类型")
    private Integer businessType;

    /**
     * 客服人员
     */
    @ExcelProperty(value = "客服人员")
    private String customerName;

    /**
     * 销售人员
     */
    @ExcelProperty(value = "销售人员")
    private String sellName;

    /**
     * 联系人
     */
    @ExcelProperty(value = "联系人")
    private String contactsName;

    /**
     * 联系电话
     */
    @ExcelProperty(value = "联系电话")
    private String phone;

    /**
     * 状态（0显示 1隐藏）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=显示,1=隐藏")
    private Integer status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
