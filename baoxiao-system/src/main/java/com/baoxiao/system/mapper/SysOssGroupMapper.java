package com.baoxiao.system.mapper;

import com.baoxiao.common.annotation.DataColumn;
import com.baoxiao.common.annotation.DataPermission;
import com.baoxiao.common.core.mapper.BaseMapperPlus;
import com.baoxiao.system.domain.SysOssGroup;
import com.baoxiao.system.domain.vo.SysOssGroupVo;

@DataPermission({
    @DataColumn(key = "deptName", value = "dept_id"),
    @DataColumn(key = "userName", value = "user_id")
})
public interface SysOssGroupMapper extends BaseMapperPlus<SysOssGroupMapper, SysOssGroup, SysOssGroupVo> {
}
