package com.baoxiao.app.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.*;


/**
 * 订单文件对象 baoxiao_order_file
 *
 * @author baoxiao
 * @date 2023-09-23
 */
@Data
@Builder
@EqualsAndHashCode()
@NoArgsConstructor
@AllArgsConstructor
@TableName("baoxiao_order_file")
public class BaoxiaoOrderFile {

    private static final long serialVersionUID=1L;

    /**
     * 文件id
     */
    @TableId(value = "file_id")
    private Long fileId;
    /**
     * 订单id
     */
    private Long orderId;
    /**
     * ossid
     */
    private Long ossId;
    /**
     * 文件名
     */
    private String fileName;
    /**
     * 原名
     */
    private String originalName;
    /**
     * URL地址
     */
    private String url;

}
