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
import com.baoxiao.app.domain.bo.BaoxiaoCompanyBo;
import com.baoxiao.app.domain.vo.BaoxiaoCompanyVo;
import com.baoxiao.app.domain.BaoxiaoCompany;
import com.baoxiao.app.mapper.BaoxiaoCompanyMapper;
import com.baoxiao.app.service.IBaoxiaoCompanyService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 子公司管理Service业务层处理
 *
 * @author baoxiao
 * @date 2023-09-05
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoCompanyServiceImpl implements IBaoxiaoCompanyService {

    private final BaoxiaoCompanyMapper baseMapper;

    /**
     * 查询子公司管理
     */
    @Override
    public BaoxiaoCompanyVo queryById(Long companyId){
        return baseMapper.selectVoById(companyId);
    }

    /**
     * 查询子公司管理列表
     */
    @Override
    public TableDataInfo<BaoxiaoCompanyVo> queryPageList(BaoxiaoCompanyBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoCompany> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoCompanyVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询子公司管理列表
     */
    @Override
    public List<BaoxiaoCompanyVo> queryList(BaoxiaoCompanyBo bo) {
        LambdaQueryWrapper<BaoxiaoCompany> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoCompany> buildQueryWrapper(BaoxiaoCompanyBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoCompany> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getCompanyName()), BaoxiaoCompany::getCompanyName, bo.getCompanyName());
        lqw.eq(StringUtils.isNotBlank(bo.getCompanyAddress()), BaoxiaoCompany::getCompanyAddress, bo.getCompanyAddress());
        lqw.eq(StringUtils.isNotBlank(bo.getCompanyContact()), BaoxiaoCompany::getCompanyContact, bo.getCompanyContact());
        lqw.eq(StringUtils.isNotBlank(bo.getPhone()), BaoxiaoCompany::getPhone, bo.getPhone());
        lqw.eq(bo.getSort() != null, BaoxiaoCompany::getSort, bo.getSort());
        lqw.eq(bo.getStatus() != null, BaoxiaoCompany::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增子公司管理
     */
    @Override
    public Boolean insertByBo(BaoxiaoCompanyBo bo) {
        if(bo.getRemark() == null){
            bo.setRemark("");
        }
        BaoxiaoCompany add = BeanUtil.toBean(bo, BaoxiaoCompany.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setCompanyId(add.getCompanyId());
        }
        return flag;
    }

    /**
     * 修改子公司管理
     */
    @Override
    public Boolean updateByBo(BaoxiaoCompanyBo bo) {
        BaoxiaoCompany update = BeanUtil.toBean(bo, BaoxiaoCompany.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoCompany entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除子公司管理
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
