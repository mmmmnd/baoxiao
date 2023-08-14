package com.baoxiao.system.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baoxiao.common.core.domain.PageQuery;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.exception.ServiceException;
import com.baoxiao.common.utils.BeanCopyUtils;
import com.baoxiao.common.utils.StringUtils;
import com.baoxiao.system.domain.SysOssGroup;
import com.baoxiao.system.domain.bo.SysOssGroupBo;
import com.baoxiao.system.domain.vo.SysOssGroupVo;
import com.baoxiao.system.mapper.SysOssGroupMapper;
import com.baoxiao.system.service.ISysOssGroupService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 对象存储分组Service业务层处理
 *
 * @author Lion Li
 * @author 孤舟烟雨
 * @date 2021-08-13
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SysOssGroupServiceImpl implements ISysOssGroupService {

    private final SysOssGroupMapper baseMapper;

    private final SysOssServiceImpl sysOssService;

    /**
     * oss分组分页列表
     *
     * @param bo        oss分组
     * @param pageQuery 分页
     * @return 结果
     */
    @Override
    public TableDataInfo<SysOssGroupVo> queryPageList(SysOssGroupBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SysOssGroup> lqw = buildQueryWrapper(bo);
        Page<SysOssGroupVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);

        return TableDataInfo.build(result);
    }

    /**
     * oss分组列表
     *
     * @param bo oss分组
     * @return 结果
     */
    @Override
    public List<SysOssGroupVo> selectOssGroupList(SysOssGroupBo bo) {
        LambdaQueryWrapper<SysOssGroup> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getGroupType() != null, SysOssGroup::getGroupType, bo.getGroupType());
        List<SysOssGroupVo> groupVos = baseMapper.selectVoList(lqw);

        return getTreeMenu(groupVos, 0L);
    }

    /**
     * oss分组新增
     *
     * @param bo oss分组
     * @return 结果
     */
    @Override
    public Integer insertByBo(SysOssGroupBo bo) {
        SysOssGroup sysOssGroup = new SysOssGroup();
        BeanCopyUtils.copy(bo, sysOssGroup);

        if (hasName(bo.getName(), bo.getGroupType())) {
            throw new ServiceException("分组名已存在！");
        }
        return baseMapper.insert(sysOssGroup);
    }

    /**
     * oss分组修改
     *
     * @param bo oss分组
     * @return 结果
     */
    @Override
    public Integer updateByBo(SysOssGroupBo bo) {

        SysOssGroup sysOssGroup = new SysOssGroup();
        BeanCopyUtils.copy(bo, sysOssGroup);

        if (hasName(bo.getName(), bo.getGroupType())) {
            throw new ServiceException("分组名已存在！");
        }
        return baseMapper.updateById(sysOssGroup);
    }

    /**
     * oss分组删除
     *
     * @param groupId oss分组id
     * @return 结果
     */
    @Override
    public Integer DeleteByGroupId(Long groupId) {
        Long flag = sysOssService.ListByGroupId(groupId);

        if (flag > 0) {
            throw new ServiceException("当前分组存在素材，无法删除！");
        }

        return baseMapper.deleteById(groupId);
    }

    /**
     * 查看分组类型下待分组名是否存在
     *
     * @param name        分组名
     * @param groupType 分组id
     * @return 结果
     */
    private Boolean hasName(String name, Long groupType) {
        LambdaQueryWrapper<SysOssGroup> lqw = Wrappers.lambdaQuery();
        lqw.eq(SysOssGroup::getName, name);
        lqw.eq(SysOssGroup::getGroupType, groupType);

        SysOssGroup ossGroup = baseMapper.selectOne(lqw);
        return ObjectUtil.isNotNull(ossGroup);
    }

    private LambdaQueryWrapper<SysOssGroup> buildQueryWrapper(SysOssGroupBo bo) {
        LambdaQueryWrapper<SysOssGroup> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getGroupId() != null && bo.getGroupId() > 0, SysOssGroup::getGroupId, bo.getGroupId());
        lqw.eq(bo.getGroupType() != null, SysOssGroup::getGroupType, bo.getGroupType());
        lqw.like(StringUtils.isNotBlank(bo.getName()), SysOssGroup::getName, bo.getName());

        return lqw;
    }

    /**
     * 递归查找菜单
     *
     * @param list 父菜单
     * @param pid  父节点id
     * @return 递归后的list对象
     */
    public List<SysOssGroupVo> getTreeMenu(List<SysOssGroupVo> list, Long pid) {
        List<SysOssGroupVo> listTree = findChild(list, pid);

        for (SysOssGroupVo tree : listTree) {
            List<SysOssGroupVo> vo = getTreeMenu(list, tree.getGroupId());
            tree.setChildren(!vo.isEmpty() ? vo : null);
        }

        return listTree;
    }

    /**
     * 查找父pid的Child
     *
     * @param listChild 所有分页
     * @param id        父id
     * @return Child对象
     */
    private List<SysOssGroupVo> findChild(List<SysOssGroupVo> listChild, Long id) {
        List<SysOssGroupVo> listChildVo = new ArrayList<>();

        for (SysOssGroupVo child : listChild) {
            if (child.getGroupType().equals(id)) {
                listChildVo.add(child);
            }
        }

        return listChildVo;
    }
}
