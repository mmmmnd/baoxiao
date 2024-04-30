package com.baoxiao.app.domain.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 分摊视图对象 baoxiao_share
 *
 * @author baoxiao
 * @date 2024-04-03
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoShareVo  {

    private static final long serialVersionUID = 1L;

    /**
     * 分摊id
     */
    @ExcelProperty(value = "分摊id")
    private Long shareId;

    /**
     * 客商单位id
     */
    @ExcelProperty(value = "客商单位id")
    private Long clientUnitId;

    /**
     * 客商单位名称
     */
    @ExcelProperty(value = "客商单位名称")
    private String clientUnitName;

    /**
     * 人员id
     */
    @ExcelProperty(value = "人员id")
    private Long userId;

    /**
     * 人员名称
     */
    @ExcelProperty(value = "人员名称")
    private String userName;

    /**
     * 部门id
     */
    @ExcelProperty(value = "部门id")
    private Long deptId;

    /**
     * 部门名称
     */
    @ExcelProperty(value = "部门名称")
    private String deptName;

    /**
     * 收支项目id
     */
    @ExcelProperty(value = "收支项目id")
    private Long projectId;

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
     * 不含税费金额
     */
    @ExcelProperty(value = "不含税费金额")
    private String hasCommissionSum;

    /**
     * 税费金额（专票）
     */
    @ExcelProperty(value = "税费金额")
    private BigDecimal commissionSum;


}
