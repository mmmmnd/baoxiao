package com.baoxiao.common.translation.impl;

import com.baoxiao.common.core.service.OssService;
import com.baoxiao.common.translation.TranslationInterface;
import com.baoxiao.common.annotation.TranslationType;
import com.baoxiao.common.constant.TransConstant;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * OSS翻译实现
 *
 * @author Lion Li
 */
@Component
@AllArgsConstructor
@TranslationType(type = TransConstant.OSS_ID_TO_URL)
public class OssUrlTranslationImpl implements TranslationInterface<String> {

    private final OssService ossService;

    @Override
    public String translation(Object key, String other) {
        return ossService.selectUrlByIds(key.toString());
    }
}
