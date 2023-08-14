package com.baoxiao.system.service;

import com.baoxiao.common.core.domain.PageQuery;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.system.domain.SysOssGroup;
import com.baoxiao.system.domain.bo.SysOssConfigBo;
import com.baoxiao.system.domain.bo.SysOssGroupBo;
import com.baoxiao.system.domain.vo.SysOssGroupVo;

import java.util.List;

public interface ISysOssGroupService {

    /**
     * oss分组分页列表
     *
     * @param bo            oss分组
     * @param pageQuery     分页
     * @return 结果
     */
    TableDataInfo<SysOssGroupVo> queryPageList(SysOssGroupBo bo, PageQuery pageQuery);

    /**
     * oss分组列表
     *
     * @param bo oss分组
     * @return 结果
     */
    List<SysOssGroupVo> selectOssGroupList(SysOssGroupBo bo);

    /**
     * oss分组新增
     *
     * @param bo oss分组
     * @return 结果
     */
    Integer insertByBo(SysOssGroupBo bo);

    /**
     * oss分组修改
     *
     * @param bo oss分组
     * @return 结果
     */
    Integer updateByBo(SysOssGroupBo bo);

    /**
     * oss分组删除
     *
     * @param groupId oss分组id
     * @return 结果
     */
    Integer DeleteByGroupId(Long groupId);

}
