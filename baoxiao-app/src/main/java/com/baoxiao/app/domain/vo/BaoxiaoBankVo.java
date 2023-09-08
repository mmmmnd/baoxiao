package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.DictFormat;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 银行视图对象 baoxiao_bank
 *
 * @author baoxiao
 * @date 2023-09-05
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoBankVo {

    private static final long serialVersionUID = 1L;

    /**
     * 银行id
     */
    @ExcelProperty(value = "银行id")
    private Long bankId;

    /**
     * 银行名称
     */
    @ExcelProperty(value = "银行名称")
    private String bankName;

    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Integer sort;

    /**
     * 状态（0显示 1隐藏）
     */
    @DictFormat(dictDataSource = "sys_show_hide")
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=显示,1=隐藏")
    private Integer status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
