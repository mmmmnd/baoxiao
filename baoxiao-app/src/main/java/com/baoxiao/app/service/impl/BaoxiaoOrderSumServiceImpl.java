package com.baoxiao.app.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baoxiao.app.domain.BaoxiaoOrderSum;
import com.baoxiao.app.mapper.BaoxiaoOrderSumMapper;
import com.baoxiao.app.service.IBaoxiaoOrderSumService;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baoxiao.app.domain.bo.BaoxiaoOrderSumBo;
import com.baoxiao.app.domain.vo.BaoxiaoOrderSumVo;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 订单金额Service业务层处理
 *
 * @author baoxiao
 * @date 2024-03-29
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoOrderSumServiceImpl implements IBaoxiaoOrderSumService {

    private final BaoxiaoOrderSumMapper baseMapper;

    /**
     * 查询订单金额
     */
    @Override
    public BaoxiaoOrderSumVo queryById(Long orderSumId){
        return baseMapper.selectVoById(orderSumId);
    }

    /**
     * 查询订单金额列表
     */
    @Override
    public TableDataInfo<BaoxiaoOrderSumVo> queryPageList(BaoxiaoOrderSumBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoOrderSum> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoOrderSumVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询订单金额列表
     */
    @Override
    public List<BaoxiaoOrderSumVo> queryList(BaoxiaoOrderSumBo bo) {
        LambdaQueryWrapper<BaoxiaoOrderSum> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoOrderSum> buildQueryWrapper(BaoxiaoOrderSumBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoOrderSum> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getOrderSumId() != null, BaoxiaoOrderSum::getOrderSumId, bo.getOrderSumId());
        lqw.eq(bo.getOrderId() != null, BaoxiaoOrderSum::getOrderId, bo.getOrderId());
        lqw.eq(bo.getRepaymentSum() != null, BaoxiaoOrderSum::getRepaymentSum, bo.getRepaymentSum());
        lqw.eq(bo.getPaymentSum() != null, BaoxiaoOrderSum::getPaymentSum, bo.getPaymentSum());
        lqw.eq(bo.getOffsetLoanSum() != null, BaoxiaoOrderSum::getOffsetLoanSum, bo.getOffsetLoanSum());
        return lqw;
    }

    /**
     * 新增订单金额
     */
    @Override
    public Boolean insertByBo(BaoxiaoOrderSumBo bo) {
        BaoxiaoOrderSum add = BeanUtil.toBean(bo, BaoxiaoOrderSum.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setOrderSumId(add.getOrderSumId());
        }
        return flag;
    }

    /**
     * 修改订单金额
     */
    @Override
    public Boolean updateByBo(BaoxiaoOrderSumBo bo) {
        BaoxiaoOrderSum update = BeanUtil.toBean(bo, BaoxiaoOrderSum.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoOrderSum entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除订单金额
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
