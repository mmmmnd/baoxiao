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
import com.baoxiao.app.domain.bo.BaoxiaoCollectionBo;
import com.baoxiao.app.domain.vo.BaoxiaoCollectionVo;
import com.baoxiao.app.domain.BaoxiaoCollection;
import com.baoxiao.app.mapper.BaoxiaoCollectionMapper;
import com.baoxiao.app.service.IBaoxiaoCollectionService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 收款人信息Service业务层处理
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoCollectionServiceImpl implements IBaoxiaoCollectionService {

    private final BaoxiaoCollectionMapper baseMapper;

    /**
     * 查询收款人信息
     */
    @Override
    public BaoxiaoCollectionVo queryById(Long collectionId){
        return baseMapper.selectVoById(collectionId);
    }

    /**
     * 查询收款人信息列表
     */
    @Override
    public TableDataInfo<BaoxiaoCollectionVo> queryPageList(BaoxiaoCollectionBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoCollection> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoCollectionVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询收款人信息列表
     */
    @Override
    public List<BaoxiaoCollectionVo> queryList(BaoxiaoCollectionBo bo) {
        LambdaQueryWrapper<BaoxiaoCollection> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoCollection> buildQueryWrapper(BaoxiaoCollectionBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoCollection> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getCollectionSum() != null, BaoxiaoCollection::getCollectionSum, bo.getCollectionSum());
        lqw.eq(StringUtils.isNotBlank(bo.getCollectionUser()), BaoxiaoCollection::getCollectionUser, bo.getCollectionUser());
        lqw.eq(StringUtils.isNotBlank(bo.getCollectionBank()), BaoxiaoCollection::getCollectionBank, bo.getCollectionBank());
        lqw.like(StringUtils.isNotBlank(bo.getCollectionBankName()), BaoxiaoCollection::getCollectionBankName, bo.getCollectionBankName());
        lqw.eq(StringUtils.isNotBlank(bo.getCollectionBankAddress()), BaoxiaoCollection::getCollectionBankAddress, bo.getCollectionBankAddress());
        return lqw;
    }

    /**
     * 新增收款人信息
     */
    @Override
    public Boolean insertByBo(BaoxiaoCollectionBo bo) {
        BaoxiaoCollection add = BeanUtil.toBean(bo, BaoxiaoCollection.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setCollectionId(add.getCollectionId());
        }
        return flag;
    }

    /**
     * 修改收款人信息
     */
    @Override
    public Boolean updateByBo(BaoxiaoCollectionBo bo) {
        BaoxiaoCollection update = BeanUtil.toBean(bo, BaoxiaoCollection.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoCollection entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除收款人信息
     */
    @Override
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
    public void batchInsertByList(List<BaoxiaoCollection> list) {
        baseMapper.insertBatch(list);
    }
}
