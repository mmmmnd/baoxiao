package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

@Data
@ExcelIgnoreUnannotated
public class BaoxiaoClientUnitImportVo extends BaoxiaoDeptImportVo{

    /**
     * 客商单位名称
     */
    @ExcelProperty(value = "客商单位名称")
    private String clientUnitName;
}
