package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoOrder;
import com.baoxiao.app.domain.dto.BaoxiaoOrderAddDto;
import com.baoxiao.app.domain.vo.BaoxiaoOrderVo;
import com.baoxiao.app.domain.bo.BaoxiaoOrderBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 订单Service接口
 *
 * @author baoxiao
 * @date 2023-09-12
 */
public interface IBaoxiaoOrderService {

    /**
     * 查询订单
     */
    BaoxiaoOrderVo queryById(Long orderId);

    /**
     * 查询订单列表
     */
    TableDataInfo<BaoxiaoOrderVo> queryPageList(BaoxiaoOrderBo bo, PageQuery pageQuery);

    /**
     * 查询订单列表
     */
    List<BaoxiaoOrderVo> queryList(BaoxiaoOrderBo bo);

    /**
     * 新增订单
     */
    Boolean insertByBo(BaoxiaoOrderAddDto dto);

    /**
     * 修改订单
     */
    Boolean updateByBo(BaoxiaoOrderBo bo);

    /**
     * 校验并批量删除订单信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
