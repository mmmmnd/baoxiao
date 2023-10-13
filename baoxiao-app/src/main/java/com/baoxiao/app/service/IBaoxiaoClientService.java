package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoClient;
import com.baoxiao.app.domain.vo.BaoxiaoClientVo;
import com.baoxiao.app.domain.bo.BaoxiaoClientBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 客户信息Service接口
 *
 * @author baoxiao
 * @date 2023-09-28
 */
public interface IBaoxiaoClientService {

    /**
     * 查询客户信息
     */
    BaoxiaoClientVo queryById(Long clientId);

    /**
     * 查询客户信息列表
     */
    TableDataInfo<BaoxiaoClientVo> queryPageList(BaoxiaoClientBo bo, PageQuery pageQuery);

    /**
     * 查询客户信息列表
     */
    List<BaoxiaoClientVo> queryList(BaoxiaoClientBo bo);

    /**
     * 新增客户信息
     */
    Boolean insertByBo(BaoxiaoClientBo bo);

    /**
     * 修改客户信息
     */
    Boolean updateByBo(BaoxiaoClientBo bo);

    /**
     * 校验并批量删除客户信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
