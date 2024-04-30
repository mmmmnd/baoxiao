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
import com.baoxiao.app.domain.bo.BaoxiaoClientBo;
import com.baoxiao.app.domain.vo.BaoxiaoClientVo;
import com.baoxiao.app.domain.BaoxiaoClient;
import com.baoxiao.app.mapper.BaoxiaoClientMapper;
import com.baoxiao.app.service.IBaoxiaoClientService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 客户信息Service业务层处理
 *
 * @author baoxiao
 * @date 2023-09-28
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoClientServiceImpl implements IBaoxiaoClientService {

    private final BaoxiaoClientMapper baseMapper;

    /**
     * 查询客户信息
     */
    @Override
    public BaoxiaoClientVo queryById(Long clientId){
        return baseMapper.selectVoById(clientId);
    }

    /**
     * 通过名字查询客户信息
     *
     * @param name
     */
    @Override
    public BaoxiaoClientVo queryByName(String name) {
        LambdaQueryWrapper<BaoxiaoClient> lqw = Wrappers.lambdaQuery();
        lqw.eq(name != null, BaoxiaoClient::getClientUnitName, name);
        return baseMapper.selectVoOne(lqw);
    }

    /**
     * 查询客户信息列表
     */
    @Override
    public TableDataInfo<BaoxiaoClientVo> queryPageList(BaoxiaoClientBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoClient> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoClientVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询客户信息列表
     */
    @Override
    public List<BaoxiaoClientVo> queryList(BaoxiaoClientBo bo) {
        LambdaQueryWrapper<BaoxiaoClient> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoClient> buildQueryWrapper(BaoxiaoClientBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoClient> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getClientUnitName()), BaoxiaoClient::getClientUnitName, bo.getClientUnitName());
        lqw.like(StringUtils.isNotBlank(bo.getClientAgreementName()), BaoxiaoClient::getClientAgreementName, bo.getClientAgreementName());
        lqw.eq(bo.getBusinessType() != null, BaoxiaoClient::getBusinessType, bo.getBusinessType());
        lqw.like(StringUtils.isNotBlank(bo.getCustomerName()), BaoxiaoClient::getCustomerName, bo.getCustomerName());
        lqw.like(StringUtils.isNotBlank(bo.getSellName()), BaoxiaoClient::getSellName, bo.getSellName());
        lqw.like(StringUtils.isNotBlank(bo.getContactsName()), BaoxiaoClient::getContactsName, bo.getContactsName());
        lqw.eq(StringUtils.isNotBlank(bo.getPhone()), BaoxiaoClient::getPhone, bo.getPhone());
        lqw.eq(bo.getStatus() != null, BaoxiaoClient::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增客户信息
     */
    @Override
    public Boolean insertByBo(BaoxiaoClientBo bo) {
        if(bo.getRemark() == null){
            bo.setRemark("");
        }
        BaoxiaoClient add = BeanUtil.toBean(bo, BaoxiaoClient.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setClientId(add.getClientId());
        }
        return flag;
    }

    /**
     * 修改客户信息
     */
    @Override
    public Boolean updateByBo(BaoxiaoClientBo bo) {
        BaoxiaoClient update = BeanUtil.toBean(bo, BaoxiaoClient.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoClient entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除客户信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
