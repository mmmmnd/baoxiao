package com.baoxiao.common.translation.impl;

import com.baoxiao.common.core.service.DeptService;
import com.baoxiao.common.translation.TranslationInterface;
import com.baoxiao.common.annotation.TranslationType;
import com.baoxiao.common.constant.TransConstant;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 部门翻译实现
 *
 * @author Lion Li
 */
@Component
@AllArgsConstructor
@TranslationType(type = TransConstant.DEPT_ID_TO_NAME)
public class DeptNameTranslationImpl implements TranslationInterface<String> {

    private final DeptService deptService;

    @Override
    public String translation(Object key, String other) {
        return deptService.selectDeptNameByIds(key.toString());
    }
}
