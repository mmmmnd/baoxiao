package com.baoxiao.app.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baoxiao.app.domain.BaoxiaoAudit;
import com.baoxiao.app.domain.vo.BaoxiaoAuditVo;
import com.baoxiao.common.annotation.DataColumn;
import com.baoxiao.common.annotation.DataPermission;
import com.baoxiao.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;


/**
 * 审批流Mapper接口
 *
 * @author baoxiao
 * @date 2023-11-10
 */
public interface BaoxiaoAuditMapper extends BaseMapperPlus<BaoxiaoAuditMapper, BaoxiaoAudit, BaoxiaoAuditVo> {

    @DataPermission({
        @DataColumn(key = "userName", value = "user_id")
    })
    IPage<BaoxiaoAuditVo> selectAuditVoPage(@Param("page") IPage<BaoxiaoAudit> page, @Param("ew") Wrapper<BaoxiaoAudit> wrapper);
}
