package com.baoxiao.app.domain.bo;

import com.baoxiao.common.core.domain.BaseEntity;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;


/**
 * 订单文件业务对象 baoxiao_order_file
 *
 * @author baoxiao
 * @date 2023-09-23
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BaoxiaoOrderFileBo extends BaseEntity {

    /**
     * 文件id
     */
    @NotNull(message = "文件id不能为空", groups = { EditGroup.class })
    private Long fileId;

    /**
     * 订单id
     */
    @NotNull(message = "订单id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long orderId;

    /**
     * ossid
     */
    @NotNull(message = "ossid不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long ossId;

    /**
     * 文件名
     */
    @NotBlank(message = "文件名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String fileName;

    /**
     * 原名
     */
    @NotBlank(message = "原名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String originalName;

    /**
     * URL地址
     */
    @NotBlank(message = "URL地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String url;


}
