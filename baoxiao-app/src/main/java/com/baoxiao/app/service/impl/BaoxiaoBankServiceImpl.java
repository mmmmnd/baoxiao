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
import com.baoxiao.app.domain.bo.BaoxiaoBankBo;
import com.baoxiao.app.domain.vo.BaoxiaoBankVo;
import com.baoxiao.app.domain.BaoxiaoBank;
import com.baoxiao.app.mapper.BaoxiaoBankMapper;
import com.baoxiao.app.service.IBaoxiaoBankService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 银行Service业务层处理
 *
 * @author baoxiao
 * @date 2023-09-05
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoBankServiceImpl implements IBaoxiaoBankService {

    private final BaoxiaoBankMapper baseMapper;

    /**
     * 查询银行
     */
    @Override
    public BaoxiaoBankVo queryById(Long bankId){
        return baseMapper.selectVoById(bankId);
    }

    /**
     * 查询银行列表
     */
    @Override
    public TableDataInfo<BaoxiaoBankVo> queryPageList(BaoxiaoBankBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoBank> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoBankVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询银行列表
     */
    @Override
    public List<BaoxiaoBankVo> queryList(BaoxiaoBankBo bo) {
        LambdaQueryWrapper<BaoxiaoBank> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoBank> buildQueryWrapper(BaoxiaoBankBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoBank> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getBankName()), BaoxiaoBank::getBankName, bo.getBankName());
        lqw.eq(bo.getSort() != null, BaoxiaoBank::getSort, bo.getSort());
        lqw.eq(bo.getStatus() != null, BaoxiaoBank::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增银行
     */
    @Override
    public Boolean insertByBo(BaoxiaoBankBo bo) {
        BaoxiaoBank add = BeanUtil.toBean(bo, BaoxiaoBank.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setBankId(add.getBankId());
        }
        return flag;
    }

    /**
     * 修改银行
     */
    @Override
    public Boolean updateByBo(BaoxiaoBankBo bo) {
        BaoxiaoBank update = BeanUtil.toBean(bo, BaoxiaoBank.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoBank entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除银行
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
