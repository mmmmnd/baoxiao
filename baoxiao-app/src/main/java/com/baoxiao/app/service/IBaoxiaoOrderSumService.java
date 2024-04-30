package com.baoxiao.app.service;

import com.baoxiao.app.domain.vo.BaoxiaoOrderSumVo;
import com.baoxiao.app.domain.bo.BaoxiaoOrderSumBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 订单金额Service接口
 *
 * @author baoxiao
 * @date 2024-03-29
 */
public interface IBaoxiaoOrderSumService {

    /**
     * 查询订单金额
     */
    BaoxiaoOrderSumVo queryById(Long orderSumId);

    /**
     * 查询订单金额列表
     */
    TableDataInfo<BaoxiaoOrderSumVo> queryPageList(BaoxiaoOrderSumBo bo, PageQuery pageQuery);

    /**
     * 查询订单金额列表
     */
    List<BaoxiaoOrderSumVo> queryList(BaoxiaoOrderSumBo bo);

    /**
     * 新增订单金额
     */
    Boolean insertByBo(BaoxiaoOrderSumBo bo);

    /**
     * 修改订单金额
     */
    Boolean updateByBo(BaoxiaoOrderSumBo bo);

    /**
     * 校验并批量删除订单金额信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
