package com.baoxiao.system.mapper;

import com.baoxiao.common.core.mapper.BaseMapperPlus;
import com.baoxiao.system.domain.vo.SysOssVo;
import com.baoxiao.system.domain.SysOss;
import org.apache.ibatis.annotations.Param;

/**
 * 文件上传 数据层
 *
 * @author Lion Li
 */
public interface SysOssMapper extends BaseMapperPlus<SysOssMapper, SysOss, SysOssVo> {
    /**
     * 查找文件名是否存在
     *
     * @return 权限列表
     */
    String hasOssFileName(@Param("fileName") String fileName);
}
