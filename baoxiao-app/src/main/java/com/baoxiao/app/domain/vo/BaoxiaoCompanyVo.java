package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.DictFormat;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 子公司管理视图对象 baoxiao_company
 *
 * @author baoxiao
 * @date 2023-09-05
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoCompanyVo {

    private static final long serialVersionUID = 1L;

    /**
     * 公司id
     */
    @ExcelProperty(value = "公司id")
    private Long companyId;

    /**
     * 公司名称
     */
    @ExcelProperty(value = "公司名称")
    private String companyName;

    /**
     * 公司地址
     */
    @ExcelProperty(value = "公司地址")
    private String companyAddress;

    /**
     * 公司联系人
     */
    @ExcelProperty(value = "公司联系人")
    private String companyContact;

    /**
     * 联系电话
     */
    @ExcelProperty(value = "联系电话")
    private String phone;

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
