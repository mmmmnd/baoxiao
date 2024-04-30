package com.baoxiao.app.domain.bo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import com.baoxiao.framework.config.typehandler.ArrayStringTypeHandler;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.ibatis.type.JdbcType;

import javax.validation.constraints.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * 费用明细业务对象 baoxiao_fee
 *
 * @author baoxiao
 * @date 2023-10-07
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoFeeBo extends BaseEntity {

    /**
     * 费用id
     */
    @NotNull(message = "费用id不能为空", groups = { EditGroup.class })
    private Long feeId;

    /**
     * 费用key
     */
    @NotBlank(message = "费用key不能为空", groups = { AddGroup.class, EditGroup.class })
    private String feeKey;

    /**
     * 费用value
     */
    @NotBlank(message = "费用value不能为空", groups = { AddGroup.class, EditGroup.class })
    private String feeValue;

    /**
     * 收支项目
     */
    @NotBlank(message = "收支项目不能为空", groups = { AddGroup.class, EditGroup.class })
    private String feeItem;
    /**
     * 还款金额
     */
    @NotBlank(message = "还款金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal baoxiaoSum;
    /**
     * 税率%
     */
    @NotBlank(message = "税率%不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal taxRate;
    /**
     * 进项税额（专票）
     */
    @NotBlank(message = "进项税额（专票）不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal specialRicket;
    /**
     * 出发日期
     */
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
