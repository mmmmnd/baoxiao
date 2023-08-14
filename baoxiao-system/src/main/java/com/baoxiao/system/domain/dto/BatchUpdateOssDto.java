package com.baoxiao.system.domain.dto;

import com.baoxiao.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class BatchUpdateOssDto extends BaseEntity {

    /**
     * id
     */
    private Long groupId;


    /**
     * ossIds
     */
    private List<Long> ossIds;
}
