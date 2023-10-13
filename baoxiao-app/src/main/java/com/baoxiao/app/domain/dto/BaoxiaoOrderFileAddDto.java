package com.baoxiao.app.domain.dto;

import com.baoxiao.common.core.validate.AddGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import java.util.List;

@Data
@EqualsAndHashCode()
public class BaoxiaoOrderFileAddDto {

    @NotNull(message = "ossid不能为空", groups = { AddGroup.class })
    private List<Long> ossId;
}

