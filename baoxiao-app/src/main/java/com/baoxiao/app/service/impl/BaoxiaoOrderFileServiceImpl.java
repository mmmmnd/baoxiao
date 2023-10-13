package com.baoxiao.app.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baoxiao.app.domain.dto.BaoxiaoOrderFileAddDto;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baoxiao.common.utils.StringUtils;
import com.baoxiao.system.domain.vo.SysOssVo;
import com.baoxiao.system.service.ISysOssService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baoxiao.app.domain.bo.BaoxiaoOrderFileBo;
import com.baoxiao.app.domain.vo.BaoxiaoOrderFileVo;
import com.baoxiao.app.domain.BaoxiaoOrderFile;
import com.baoxiao.app.mapper.BaoxiaoOrderFileMapper;
import com.baoxiao.app.service.IBaoxiaoOrderFileService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * 订单文件Service业务层处理
 *
 * @author baoxiao
 * @date 2023-09-23
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoOrderFileServiceImpl implements IBaoxiaoOrderFileService {

    private final ISysOssService iSysOssService;

    private final BaoxiaoOrderFileMapper baseMapper;


    /**
     * 查询订单文件
     */
    @Override
    public BaoxiaoOrderFileVo queryById(Long fileId){
        return baseMapper.selectVoById(fileId);
    }

    /**
     * 查询订单文件列表
     */
    @Override
    public TableDataInfo<BaoxiaoOrderFileVo> queryPageList(BaoxiaoOrderFileBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoOrderFile> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoOrderFileVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询订单文件列表
     */
    @Override
    public List<BaoxiaoOrderFileVo> queryList(BaoxiaoOrderFileBo bo) {
        LambdaQueryWrapper<BaoxiaoOrderFile> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoOrderFile> buildQueryWrapper(BaoxiaoOrderFileBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoOrderFile> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getOrderId() != null, BaoxiaoOrderFile::getOrderId, bo.getOrderId());
        lqw.eq(bo.getOssId() != null, BaoxiaoOrderFile::getOssId, bo.getOssId());
        lqw.like(StringUtils.isNotBlank(bo.getFileName()), BaoxiaoOrderFile::getFileName, bo.getFileName());
        lqw.like(StringUtils.isNotBlank(bo.getOriginalName()), BaoxiaoOrderFile::getOriginalName, bo.getOriginalName());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), BaoxiaoOrderFile::getUrl, bo.getUrl());
        return lqw;
    }

    /**
     * 新增订单文件
     */
    @Override
    public Boolean insertByBo(BaoxiaoOrderFileBo bo) {
        BaoxiaoOrderFile add = BeanUtil.toBean(bo, BaoxiaoOrderFile.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setOrderId(add.getOrderId());
        }
        return flag;
    }

    /**
     * 批量添加
     */
    @Override
    public List<BaoxiaoOrderFile> batchInsertByIds(BaoxiaoOrderFileAddDto dto) {
        List<SysOssVo> sysOssVos = iSysOssService.listByIds(dto.getOssId());
        List<BaoxiaoOrderFile> orderFiles = sysOssVos.stream().map(vo ->
            BaoxiaoOrderFile.builder()
                .orderId(0L)
                .ossId(vo.getOssId())
                .fileName(vo.getFileName())
                .originalName(vo.getOriginalName())
                .url(vo.getUrl())
                .build()
        ).collect(Collectors.toList());

        baseMapper.insertBatch(orderFiles);

        return orderFiles;
    }

    /**
     * 修改订单文件
     */
    @Override
    public Boolean updateByBo(BaoxiaoOrderFileBo bo) {
        BaoxiaoOrderFile update = BeanUtil.toBean(bo, BaoxiaoOrderFile.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoOrderFile entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除订单文件
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 批量查找ids
     */
    @Override
    public List<BaoxiaoOrderFile> btachQueryByIds(List<Long> ids) {
        return baseMapper.selectBatchIds(ids);
    }

    /**
     * 批量修改
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean batchUpdateByIds(List<BaoxiaoOrderFile> bo) {
        return baseMapper.updateBatchById(bo);
    }

    /**
     * 批量删除不存在的订单文件
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteWithValidByOrderId() {
        LambdaQueryWrapper<BaoxiaoOrderFile> lqw = Wrappers.<BaoxiaoOrderFile>lambdaQuery().eq(BaoxiaoOrderFile::getOrderId, 0);
        List<BaoxiaoOrderFile> files = baseMapper.selectList(lqw);
        List<Long> fileIds = files.stream().map(BaoxiaoOrderFile::getFileId).collect(Collectors.toList());

        return files.size()>0? deleteWithValidByIds(fileIds,false):false;
    }
}
