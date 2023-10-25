package com.baoxiao.app.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baoxiao.common.utils.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baoxiao.app.domain.bo.BaoxiaoFeeBo;
import com.baoxiao.app.domain.vo.BaoxiaoFeeVo;
import com.baoxiao.app.domain.BaoxiaoFee;
import com.baoxiao.app.mapper.BaoxiaoFeeMapper;
import com.baoxiao.app.service.IBaoxiaoFeeService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 费用明细Service业务层处理
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoFeeServiceImpl implements IBaoxiaoFeeService {

    private final BaoxiaoFeeMapper baseMapper;

    /**
     * 查询费用明细
     */
    @Override
    public BaoxiaoFeeVo queryById(Long feeId){
        return baseMapper.selectVoById(feeId);
    }

    /**
     * 查询费用明细列表
     */
    @Override
    public TableDataInfo<BaoxiaoFeeVo> queryPageList(BaoxiaoFeeBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoFee> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoFeeVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询费用明细列表
     */
    @Override
    public List<BaoxiaoFeeVo> queryList(BaoxiaoFeeBo bo) {
        LambdaQueryWrapper<BaoxiaoFee> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoFee> buildQueryWrapper(BaoxiaoFeeBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoFee> lqw = Wrappers.lambdaQuery();
        return lqw;
    }

    /**
     * 新增费用明细
     */
    @Override
    public Boolean insertByBo(BaoxiaoFeeBo bo) {
        BaoxiaoFee add = BeanUtil.toBean(bo, BaoxiaoFee.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setFeeId(add.getFeeId());
        }
        return flag;
    }

    /**
     * 修改费用明细
     */
    @Override
    public Boolean updateByBo(BaoxiaoFeeBo bo) {
        BaoxiaoFee update = BeanUtil.toBean(bo, BaoxiaoFee.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoFee entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除费用明细
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 批量添加List
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void batchInsertByList(List<BaoxiaoFee> list) {
        baseMapper.insertBatch(list);
    }


}
