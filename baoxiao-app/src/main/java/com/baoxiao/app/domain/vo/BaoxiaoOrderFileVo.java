package com.baoxiao.app.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baoxiao.common.annotation.ExcelDictFormat;
import com.baoxiao.common.convert.ExcelDictConvert;
import lombok.Data;


/**
 * 订单文件视图对象 baoxiao_order_file
 *
 * @author baoxiao
 * @date 2023-09-23
 */
@Data
@ExcelIgnoreUnannotated
public class BaoxiaoOrderFileVo {

    private static final long serialVersionUID = 1L;

    /**
     * 文件id
     */
    @ExcelProperty(value = "文件id")
    private Long fileId;

    /**
     * 订单id
     */
    @ExcelProperty(value = "订单id")
    private Long orderId;

    /**
     * ossid
     */
    @ExcelProperty(value = "ossid")
    private Long ossId;

    /**
     * 文件名
     */
    @ExcelProperty(value = "文件名")
    private String fileName;

    /**
     * 原名
     */
    @ExcelProperty(value = "原名")
    private String originalName;

    /**
     * URL地址
     */
    @ExcelProperty(value = "URL地址")
    private String url;


}
