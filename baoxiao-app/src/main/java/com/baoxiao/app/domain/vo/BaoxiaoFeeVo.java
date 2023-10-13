package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 费用明细视图对象 baoxiao_fee
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoFeeVo {

    private static final long serialVersionUID = 1L;

    /**
     * 费用id
     */
    @ExcelProperty(value = "费用id")
    private Long feeId;
    /**
     * 收支项目
     */
    @ExcelProperty(value = "收支项目")
    private String feeItem;
    /**
     * 报销金额
     */
    @ExcelProperty(value = "报销金额")
    private String baoxiaoSum;
    /**
     * 税率%
     */
    @ExcelProperty(value = "税率%")
    private String taxRate;
    /**
     * 进项税额（专票）
     */
    @ExcelProperty(value = "进项税额（专票）")
    private String specialRicket;
}
