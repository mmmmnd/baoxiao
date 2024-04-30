package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import com.baoxiao.framework.config.typehandler.ArrayStringTypeHandler;
import lombok.Data;
import org.apache.ibatis.type.JdbcType;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


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
    @TableField(typeHandler = ArrayStringTypeHandler.class,jdbcType = JdbcType.VARCHAR)
    private String[] feeItem;
    /**
     * 还款金额
     */
    @ExcelProperty(value = "还款金额")
    private BigDecimal baoxiaoSum;
    /**
     * 税率%
     */
    @ExcelProperty(value = "税率%")
    private BigDecimal taxRate;
    /**
     * 进项税额（专票）
     */
    @ExcelProperty(value = "进项税额（专票）")
    private BigDecimal specialRicket;
    /**
     * 出发日期
     */
    @ExcelProperty(value = "出发日期")
    private Date departureDate;
    /**
     * 出发地点
     */
    @ExcelProperty(value = "出发地点")
    private String departureLocation;
    /**
     * 到达地点
     */
    @ExcelProperty(value = "到达地点")
    private String arrivalLocation;
    /**
     * 返程日期
     */
    @ExcelProperty(value = "返程日期")
    private Date returnDate;
    /**
     * 出差人数
     */
    @ExcelProperty(value = "出差人数")
    private Integer numberOfPeople;
    /**
     * 出差天数
     */
    @ExcelProperty(value = "出差天数")
    private Integer tripDays;
    /**
     * 交通工具
     */
    @ExcelProperty(value = "交通工具")
    private String transportation;
    /**
     * 交通费
     */
    @ExcelProperty(value = "交通费")
    private BigDecimal transportationFee;
    /**
     * 出差津贴
     */
    @ExcelProperty(value = "出差津贴")
    private BigDecimal travelAllowance;
    /**
     * 住宿费
     */
    @ExcelProperty(value = "住宿费")
    private BigDecimal accommodationFee;
    /**
     * 交通补助
     */
    @ExcelProperty(value = "交通补助")
    private BigDecimal transportationSubsidy;
    /**
     * 伙食补助
     */
    @ExcelProperty(value = "伙食补助")
    private BigDecimal mealSubsidy;
    /**
     * 其他
     */
    @ExcelProperty(value = "其他")
    private String otherExpenses;
}
