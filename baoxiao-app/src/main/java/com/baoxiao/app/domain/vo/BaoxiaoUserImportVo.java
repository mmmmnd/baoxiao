package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

@Data
@ExcelIgnoreUnannotated
public class BaoxiaoUserImportVo extends BaoxiaoDeptImportVo{

    /**
     * 人员名称
     */
    @ExcelProperty(value = "人员名称")
    private String userName;
}
