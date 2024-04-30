package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoProject;
import com.baoxiao.app.domain.vo.BaoxiaoProjectVo;
import com.baoxiao.app.domain.bo.BaoxiaoProjectBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 项目类型Service接口
 *
 * @author baoxiao
 * @date 2024-01-03
 */
public interface IBaoxiaoProjectService {

    /**
     * 查询项目类型
     */
    BaoxiaoProjectVo queryById(Long id);

    /**
     * 通过名字查询项目类型
     */
    BaoxiaoProjectVo queryByName(String name);

    /**
     * 查询项目类型列表
     */
    TableDataInfo<BaoxiaoProjectVo> queryPageList(BaoxiaoProjectBo bo, PageQuery pageQuery);

    /**
     * 查询所有项目类型列表
     */
    List<BaoxiaoProjectVo> queryAllList(BaoxiaoProjectBo bo);
    /**
     * 查询项目类型列表
     */
    List<BaoxiaoProjectVo> queryList(BaoxiaoProjectBo bo);

    /**
     * 新增项目类型
     */
    Boolean insertByBo(BaoxiaoProjectBo bo);

    /**
     * 修改项目类型
     */
    Boolean updateByBo(BaoxiaoProjectBo bo);

    /**
     * 校验并批量删除项目类型信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
