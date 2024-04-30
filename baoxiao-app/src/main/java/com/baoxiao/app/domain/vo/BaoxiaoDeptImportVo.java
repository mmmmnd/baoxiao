package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.math.BigDecimal;

@Data
@ExcelIgnoreUnannotated
public class BaoxiaoDeptImportVo {

    /**
     * 部门名称
     */
    @ExcelProperty(value = "部门名称")
    private String deptName;

    /**
     * 收支项目名称
     */
    @ExcelProperty(value = "收支项目名称")
    private String projectName;

    /**
     * 分摊金额
     */
    @ExcelProperty(value = "分摊金额")
    private BigDecimal shareSum;

    /**
     * 税费金额（专票）
     */
    @ExcelProperty(value = "税费金额")
    private BigDecimal commissionSum;

    /**
     * 不含税费金额
     */
    @ExcelProperty(value = "不含税费金额")
    private String hasCommissionSum;
}
