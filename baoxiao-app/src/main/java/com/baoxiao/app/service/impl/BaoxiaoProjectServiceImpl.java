package com.baoxiao.app.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baoxiao.app.utils.TreeUtil;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baoxiao.common.utils.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baoxiao.app.domain.bo.BaoxiaoProjectBo;
import com.baoxiao.app.domain.vo.BaoxiaoProjectVo;
import com.baoxiao.app.domain.BaoxiaoProject;
import com.baoxiao.app.mapper.BaoxiaoProjectMapper;
import com.baoxiao.app.service.IBaoxiaoProjectService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 项目类型Service业务层处理
 *
 * @author baoxiao
 * @date 2024-01-03
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoProjectServiceImpl implements IBaoxiaoProjectService {

    private final BaoxiaoProjectMapper baseMapper;

    /**
     * 查询项目类型
     */
    @Override
    public BaoxiaoProjectVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 通过名字查询项目类型
     *
     * @param name
     */
    @Override
    public BaoxiaoProjectVo queryByName(String name) {
        LambdaQueryWrapper<BaoxiaoProject> lqw = Wrappers.lambdaQuery();
        lqw.eq(name != null, BaoxiaoProject::getName, name);
        return baseMapper.selectVoOne(lqw);
    }

    /**
     * 查询项目类型列表
     */
    @Override
    public TableDataInfo<BaoxiaoProjectVo> queryPageList(BaoxiaoProjectBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoProject> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoProjectVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询所有项目类型列表
     */
    @Override
    public List<BaoxiaoProjectVo> queryAllList(BaoxiaoProjectBo bo) {
        LambdaQueryWrapper<BaoxiaoProject> lqw = buildQueryWrapper(bo);
        List<BaoxiaoProjectVo> baoxiaoProjectVos = baseMapper.selectVoList(lqw);
        return TreeUtil.getTreeMenu(baoxiaoProjectVos, 0L);
    }

    /**
     * 查询项目类型列表
     */
    @Override
    public List<BaoxiaoProjectVo> queryList(BaoxiaoProjectBo bo) {
        LambdaQueryWrapper<BaoxiaoProject> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoProject> buildQueryWrapper(BaoxiaoProjectBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoProject> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getPid() != null, BaoxiaoProject::getPid, bo.getPid());
        lqw.like(StringUtils.isNotBlank(bo.getName()), BaoxiaoProject::getName, bo.getName());
        lqw.eq(bo.getDisabled() != null, BaoxiaoProject::getDisabled, bo.getDisabled());
        lqw.eq(bo.getSort() != null, BaoxiaoProject::getSort, bo.getSort());
        return lqw;
    }

    /**
     * 新增项目类型
     */
    @Override
    public Boolean insertByBo(BaoxiaoProjectBo bo) {
        BaoxiaoProject add = BeanUtil.toBean(bo, BaoxiaoProject.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改项目类型
     */
    @Override
    public Boolean updateByBo(BaoxiaoProjectBo bo) {
        BaoxiaoProject update = BeanUtil.toBean(bo, BaoxiaoProject.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoProject entity){
        //TODO 做一些数据校验,如唯一约束
        if (entity.getRemark() == null){
            entity.setRemark("");
        }
    }

    /**
     * 批量删除项目类型
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
