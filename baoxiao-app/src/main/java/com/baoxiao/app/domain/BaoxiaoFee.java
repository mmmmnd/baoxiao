package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.framework.config.typehandler.ArrayStringTypeHandler;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.ibatis.type.JdbcType;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


/**
 * 费用明细对象 baoxiao_fee
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@Data
@EqualsAndHashCode()
@TableName("baoxiao_fee")
public class BaoxiaoFee {

    private static final long serialVersionUID=1L;

    /**
     * 费用id
     */
    @TableId(value = "fee_id",type = IdType.INPUT)
    private Long feeId;
    /**
     * 收支项目
     */
    @TableField(typeHandler = ArrayStringTypeHandler.class,jdbcType = JdbcType.VARCHAR)
    private String[] feeItem;
    /**
     * 还款金额
     */
    private BigDecimal baoxiaoSum;
    /**
     * 税率%
     */
    private BigDecimal taxRate;
    /**
     * 进项税额（专票）
     */
    private BigDecimal specialRicket;

    /**
     * 出发日期
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date departureDate;
    /**
     * 出发地点
     */
    private String departureLocation;
    /**
     * 到达地点
     */
    private String arrivalLocation;
    /**
     * 返程日期
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date returnDate;
    /**
     * 出差人数
     */
    private Integer numberOfPeople;
    /**
     * 出差天数
     */
    private Integer tripDays;
    /**
     * 交通工具
     */
    private String transportation;
    /**
     * 交通费
     */
    private BigDecimal transportationFee;
    /**
     * 出差津贴
     */
    private BigDecimal travelAllowance;
    /**
     * 住宿费
     */
    private BigDecimal accommodationFee;
    /**
     * 交通补助
     */
    private BigDecimal transportationSubsidy;
    /**
     * 伙食补助
     */
    private BigDecimal mealSubsidy;
    /**
     * 其他
     */
    private String otherExpenses;
}
