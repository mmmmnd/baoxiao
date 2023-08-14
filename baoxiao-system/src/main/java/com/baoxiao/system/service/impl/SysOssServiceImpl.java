package com.baoxiao.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baoxiao.system.domain.SysOssGroup;
import com.baoxiao.system.domain.bo.BatchUpdateOssBo;
import com.baoxiao.system.domain.dto.BatchUpdateOssDto;
import com.baoxiao.system.domain.vo.SysOssVo;
import com.baoxiao.system.mapper.SysOssGroupMapper;
import com.baoxiao.system.mapper.SysOssMapper;
import com.baoxiao.system.service.ISysOssService;
import com.baoxiao.common.constant.CacheNames;
import com.baoxiao.common.core.domain.PageQuery;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.service.OssService;
import com.baoxiao.common.exception.ServiceException;
import com.baoxiao.common.utils.StringUtils;
import com.baoxiao.common.utils.file.FileUtils;
import com.baoxiao.common.utils.spring.SpringUtils;
import com.baoxiao.oss.core.OssClient;
import com.baoxiao.oss.entity.UploadResult;
import com.baoxiao.oss.enumd.AccessPolicyType;
import com.baoxiao.oss.factory.OssFactory;
import com.baoxiao.system.domain.SysOss;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**buildOrderItem
 * 文件上传 服务层实现
 *
 * @author Lion Li
 */
@RequiredArgsConstructor
@Service
public class SysOssServiceImpl implements ISysOssService, OssService {

    private final SysOssMapper baseMapper;

    private final SysOssGroupMapper sysOssGroupMapper;

    @Override
    public TableDataInfo<SysOssVo> queryPageList(BatchUpdateOssBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SysOss> lqw = buildQueryWrapper(bo);
        Page<SysOssVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        List<SysOssVo> filterResult = result.getRecords().stream().map(this::matchingUrl).collect(Collectors.toList());
        result.setRecords(filterResult);
        return TableDataInfo.build(result);
    }

    @Override
    public List<SysOssVo> listByIds(Collection<Long> ossIds) {
        List<SysOssVo> list = new ArrayList<>();
        for (Long id : ossIds) {
            SysOssVo vo = SpringUtils.getAopProxy(this).getById(id);
            if (ObjectUtil.isNotNull(vo)) {
                list.add(this.matchingUrl(vo));
            }
        }
        return list;
    }

    @Override
    public String selectUrlByIds(String ossIds) {
        List<String> list = new ArrayList<>();
        for (Long id : StringUtils.splitTo(ossIds, Convert::toLong)) {
            SysOssVo vo = SpringUtils.getAopProxy(this).getById(id);
            if (ObjectUtil.isNotNull(vo)) {
                list.add(this.matchingUrl(vo).getUrl());
            }
        }
        return String.join(StringUtils.SEPARATOR, list);
    }

    @Cacheable(cacheNames = CacheNames.SYS_OSS, key = "#ossId")
    @Override
    public SysOssVo getById(Long ossId) {
        return baseMapper.selectVoById(ossId);
    }

    @Override
    public void download(Long ossId, HttpServletResponse response) throws IOException {
        SysOssVo sysOss = SpringUtils.getAopProxy(this).getById(ossId);
        if (ObjectUtil.isNull(sysOss)) {
            throw new ServiceException("文件数据不存在!");
        }
        FileUtils.setAttachmentResponseHeader(response, sysOss.getOriginalName());
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE + "; charset=UTF-8");
        OssClient storage = OssFactory.instance(sysOss.getService());
        try(InputStream inputStream = storage.getObjectContent(sysOss.getUrl())) {
            int available = inputStream.available();
            IoUtil.copy(inputStream, response.getOutputStream(), available);
            response.setContentLength(available);
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

    @Override
    public SysOssVo upload(MultipartFile file, BatchUpdateOssBo sysOssBo) {
        String originalfileName = file.getOriginalFilename();
        String suffix = StringUtils.substring(originalfileName, originalfileName.lastIndexOf("."), originalfileName.length());
        OssClient storage = OssFactory.instance();
        UploadResult uploadResult;
        try {
            uploadResult = storage.uploadSuffix(file.getBytes(), suffix, file.getContentType());
        } catch (IOException e) {
            throw new ServiceException(e.getMessage());
        }
        // 保存文件信息
        return buildResultEntity(originalfileName, suffix, storage.getConfigKey(), uploadResult, sysOssBo);
    }

    private SysOssVo buildResultEntity(String originalfileName, String suffix, String configKey, UploadResult uploadResult) {
        SysOss oss = new SysOss();
        oss.setUrl(uploadResult.getUrl());
        oss.setFileSuffix(suffix);
        oss.setFileName(uploadResult.getFilename());
        oss.setOriginalName(originalfileName);
        oss.setService(configKey);
        baseMapper.insert(oss);
        SysOssVo sysOssVo = BeanUtil.toBean(oss, SysOssVo.class);
        return this.matchingUrl(sysOssVo);
    }

    private SysOssVo buildResultEntity(String originalfileName, String suffix, String configKey, UploadResult uploadResult, BatchUpdateOssBo sysOssBo) {
        SysOss oss = new SysOss();
        oss.setUrl(uploadResult.getUrl());
        oss.setUrl(uploadResult.getUrl());
        oss.setFileSuffix(suffix);
        oss.setFileName(uploadResult.getFilename());
        oss.setOriginalName(originalfileName);
        oss.setService(configKey);
        oss.setGroupId(sysOssBo.getGroupId());
        oss.setGroupType(sysOssBo.getGroupType());
        baseMapper.insert(oss);
        SysOssVo sysOssVo = BeanUtil.toBean(oss, SysOssVo.class);
        return this.matchingUrl(sysOssVo);
    }

    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            // 做一些业务上的校验,判断是否需要校验
            if (batchQueryByIds(ids).isEmpty()) {
                throw new ServiceException("分组ids不存在");
            }
        }
        List<SysOss> list = baseMapper.selectBatchIds(ids);
        for (SysOss sysOss : list) {
            OssClient storage = OssFactory.instance(sysOss.getService());
            storage.delete(sysOss.getUrl());
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    private List<SysOss> batchQueryByIds(Collection<Long> ids){
        return baseMapper.selectBatchIds(ids);
    }
    /**
     * 通过分组id查询所有oss
     *
     * @param groupId 分组id
     * @return 结果
     */
    @Override
    public Long ListByGroupId(Long groupId) {
        LambdaQueryWrapper<SysOss> lqw = Wrappers.lambdaQuery();
        lqw.eq(SysOss::getGroupId, groupId);

        return baseMapper.selectCount(lqw);
    }

    /**
     * 批量修改oss分组名
     *
     * @param batchUpdateOssDto 实体
     * @return 结果
     */
    @Override
    public Integer batchUpdateByGroupId(BatchUpdateOssDto batchUpdateOssDto) {
        SysOssGroup sysOssGroup = sysOssGroupMapper.selectById(batchUpdateOssDto.getGroupId());

        if (ObjectUtil.isNull(sysOssGroup)){
            throw new ServiceException("分组不存在！");
        }

        List<Long> ossIds = batchUpdateOssDto.getOssIds();
        SysOss sysOss = BeanUtil.toBean(batchUpdateOssDto, SysOss.class);

        return batchUpdate(sysOss, ossIds);
    }

    /**
     * 查找文件名是否存在
     *
     * @param fileName 文件名
     * @return 结果
     */
    @Override
    public String hasOssFileName(String fileName) {
        return baseMapper.hasOssFileName(fileName);
    }

    /**
     * 批量修改
     */
    private Integer batchUpdate(SysOss sysOss,Collection<Long> ids){
        return baseMapper.update(sysOss,Wrappers.<SysOss>lambdaQuery().in(SysOss::getOssId, ids));
    }

    /**
     * 匹配Url
     *
     * @param oss OSS对象
     * @return oss 匹配Url的OSS对象
     */
    private SysOssVo matchingUrl(SysOssVo oss) {
        OssClient storage = OssFactory.instance(oss.getService());
        // 仅修改桶类型为 private 的URL，临时URL时长为120s
        if (AccessPolicyType.PRIVATE == storage.getAccessPolicy()) {
            oss.setUrl(storage.getPrivateUrl(oss.getFileName(), 120));
        }
        return oss;
    }

    private LambdaQueryWrapper<SysOss> buildQueryWrapper(BatchUpdateOssBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<SysOss> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getFileName()), SysOss::getFileName, bo.getFileName());
        lqw.like(StringUtils.isNotBlank(bo.getOriginalName()), SysOss::getOriginalName, bo.getOriginalName());
        lqw.eq(StringUtils.isNotBlank(bo.getFileSuffix()), SysOss::getFileSuffix, bo.getFileSuffix());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), SysOss::getUrl, bo.getUrl());
        lqw.between(params.get("beginCreateTime") != null && params.get("endCreateTime") != null, SysOss::getCreateTime, params.get("beginCreateTime"), params.get("endCreateTime"));
        lqw.eq(StringUtils.isNotBlank(bo.getCreateBy()), SysOss::getCreateBy, bo.getCreateBy());
        lqw.eq(StringUtils.isNotBlank(bo.getService()), SysOss::getService, bo.getService());
        lqw.eq(StringUtils.isNotBlank(bo.getService()), SysOss::getService, bo.getService());
        lqw.eq(bo.getGroupType() != null, SysOss::getGroupType, bo.getGroupType());

        if(bo.getGroupId() != null) {
            if(bo.getGroupId() == 4L){
                lqw.eq(SysOss::getGroupType, 1);
            } else if(bo.getGroupId() == 5L){
                lqw.eq(SysOss::getGroupType, 2);
            }else if(bo.getGroupId() == 6L){
                lqw.eq(SysOss::getGroupType, 3);
            }else{
                lqw.eq(SysOss::getGroupId, bo.getGroupId());
            }
        }

        return lqw;
    }
}
