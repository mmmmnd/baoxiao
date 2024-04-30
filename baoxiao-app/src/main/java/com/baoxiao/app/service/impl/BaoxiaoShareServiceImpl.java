package com.baoxiao.app.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baoxiao.app.listener.BaoxiaoShareImportListener;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baoxiao.common.excel.ExcelResult;
import com.baoxiao.common.utils.StringUtils;
import com.baoxiao.common.utils.poi.ExcelUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baoxiao.app.domain.bo.BaoxiaoShareBo;
import com.baoxiao.app.domain.vo.BaoxiaoShareVo;
import com.baoxiao.app.domain.BaoxiaoShare;
import com.baoxiao.app.mapper.BaoxiaoShareMapper;
import com.baoxiao.app.service.IBaoxiaoShareService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 分摊Service业务层处理
 *
 * @author baoxiao
 * @date 2024-04-03
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoShareServiceImpl implements IBaoxiaoShareService {

    private final BaoxiaoShareMapper baseMapper;

    /**
     * 查询分摊
     */
    @Override
    public BaoxiaoShareVo queryById(Long shareId){
        return baseMapper.selectVoById(shareId);
    }

    /**
     * 查询分摊列表
     */
    @Override
    public TableDataInfo<BaoxiaoShareVo> queryPageList(BaoxiaoShareBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoShare> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoShareVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询分摊列表
     */
    @Override
    public List<BaoxiaoShareVo> queryList(BaoxiaoShareBo bo) {
        LambdaQueryWrapper<BaoxiaoShare> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoShare> buildQueryWrapper(BaoxiaoShareBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoShare> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getClientUnitId() != null, BaoxiaoShare::getClientUnitId, bo.getClientUnitId());
        lqw.like(StringUtils.isNotBlank(bo.getClientUnitName()), BaoxiaoShare::getClientUnitName, bo.getClientUnitName());
        lqw.eq(bo.getUserId() != null, BaoxiaoShare::getUserId, bo.getUserId());
        lqw.like(StringUtils.isNotBlank(bo.getUserName()), BaoxiaoShare::getUserName, bo.getUserName());
        lqw.eq(bo.getDeptId() != null, BaoxiaoShare::getDeptId, bo.getDeptId());
        lqw.like(StringUtils.isNotBlank(bo.getDeptName()), BaoxiaoShare::getDeptName, bo.getDeptName());
        lqw.eq(bo.getProjectId() != null, BaoxiaoShare::getProjectId, bo.getProjectId());
        lqw.like(StringUtils.isNotBlank(bo.getProjectName()), BaoxiaoShare::getProjectName, bo.getProjectName());
        lqw.eq(bo.getShareSum() != null, BaoxiaoShare::getShareSum, bo.getShareSum());
        lqw.eq(StringUtils.isNotBlank(bo.getHasCommissionSum()), BaoxiaoShare::getHasCommissionSum, bo.getHasCommissionSum());
        lqw.eq(bo.getCommissionSum() != null, BaoxiaoShare::getCommissionSum, bo.getCommissionSum());
        return lqw;
    }

    /**
     * 新增分摊
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean insertByBo(BaoxiaoShareBo bo) {
        BaoxiaoShare add = BeanUtil.toBean(bo, BaoxiaoShare.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setShareId(add.getShareId());
        }
        return flag;
    }

    /**
     * 修改分摊
     */
    @Override
    public Boolean updateByBo(BaoxiaoShareBo bo) {
        BaoxiaoShare update = BeanUtil.toBean(bo, BaoxiaoShare.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoShare entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除分摊
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 导入分摊表
     */
    @Override
    public String importShare(MultipartFile file, Long orderId) throws IOException {
        ExcelResult<BaoxiaoShareVo> result = ExcelUtil.importExcel(file.getInputStream(), BaoxiaoShareVo.class, new BaoxiaoShareImportListener(orderId));
        return result.getAnalysis();
    }
}
