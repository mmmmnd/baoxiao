package com.baoxiao.app.domain.vo;

import java.math.BigDecimal;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 收款人信息视图对象 baoxiao_collection
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoCollectionVo {

    private static final long serialVersionUID = 1L;

    /**
     * 费用id
     */
    @ExcelProperty(value = "费用id")
    private Long collectionId;

    /**
     * 金额
     */
    @ExcelProperty(value = "金额")
    private BigDecimal collectionSum;

    /**
     * 收款人姓名
     */
    @ExcelProperty(value = "收款人姓名")
    private String collectionUser;

    /**
     * 银行卡
     */
    @ExcelProperty(value = "银行卡")
    private String collectionBank;

    /**
     * 银行名称
     */
    @ExcelProperty(value = "银行名称")
    private String collectionBankName;

    /**
     * 开户行
     */
    @ExcelProperty(value = "开户行")
    private String collectionBankAddress;


}
