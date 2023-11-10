package com.baoxiao.app.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baoxiao.common.core.domain.model.LoginUser;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baoxiao.common.helper.LoginHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baoxiao.app.domain.bo.BaoxiaoAuditBo;
import com.baoxiao.app.domain.vo.BaoxiaoAuditVo;
import com.baoxiao.app.domain.BaoxiaoAudit;
import com.baoxiao.app.mapper.BaoxiaoAuditMapper;
import com.baoxiao.app.service.IBaoxiaoAuditService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 审批流Service业务层处理
 *
 * @author baoxiao
 * @date 2023-11-10
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoAuditServiceImpl implements IBaoxiaoAuditService {

    private final BaoxiaoAuditMapper baseMapper;

    /**
     * 查询审批流
     */
    @Override
    public BaoxiaoAuditVo queryById(Long auditId){
        return baseMapper.selectVoById(auditId);
    }

    /**
     * 查询审批流列表
     */
    @Override
    public TableDataInfo<BaoxiaoAuditVo> queryPageList(BaoxiaoAuditBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoAudit> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoAuditVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询审批流列表
     */
    @Override
    public List<BaoxiaoAuditVo> queryList(BaoxiaoAuditBo bo) {
        LambdaQueryWrapper<BaoxiaoAudit> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoAudit> buildQueryWrapper(BaoxiaoAuditBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoAudit> lqw = Wrappers.lambdaQuery();
        return lqw;
    }

    /**
     * 新增审批流
     */
    @Override
    public Boolean insertByBo(BaoxiaoAuditBo bo) {
        LoginUser loginUser = LoginHelper.getLoginUser();
//        BaoxiaoAudit add = BeanUtil.toBean(bo, BaoxiaoAudit.class);
//        validEntityBeforeSave(add);
//        boolean flag = baseMapper.insert(add) > 0;
//        if (flag) {
//            bo.setAuditId(add.getAuditId());
//        }
//        return flag;
    }

    /**
     * 修改审批流
     */
    @Override
    public Boolean updateByBo(BaoxiaoAuditBo bo) {
        BaoxiaoAudit update = BeanUtil.toBean(bo, BaoxiaoAudit.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoAudit entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除审批流
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
