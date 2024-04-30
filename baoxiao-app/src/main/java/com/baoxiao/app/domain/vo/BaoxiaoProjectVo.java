package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.app.domain.TreeNode;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 项目类型视图对象 baoxiao_project
 *
 * @author baoxiao
 * @date 2024-01-03
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoProjectVo extends TreeNode {

    private static final long serialVersionUID = 1L;

    /**
     * 项目id
     */
    @ExcelProperty(value = "项目id")
    private Long id;

    /**
     * 父id
     */
    @ExcelProperty(value = "父id")
    private Long pid;

    /**
     * 名称
     */
    @ExcelProperty(value = "名称")
    private String name;

    /**
     * 布尔值
     */
    @ExcelProperty(value = "布尔值")
    private Long disabled;

    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Integer sort;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

}
