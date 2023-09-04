package com.baoxiao.web.controller.system;


import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baoxiao.common.annotation.Log;
import com.baoxiao.common.core.controller.BaseController;
import com.baoxiao.common.core.domain.PageQuery;
import com.baoxiao.common.core.domain.R;
import com.baoxiao.common.core.domain.model.LoginUser;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.validate.QueryGroup;
import com.baoxiao.common.enums.BusinessType;
import com.baoxiao.common.helper.LoginHelper;
import com.baoxiao.common.utils.StringUtils;
import com.baoxiao.common.utils.file.MimeTypeUtils;
import com.baoxiao.system.domain.SysOss;
import com.baoxiao.system.domain.bo.BatchUpdateOssBo;
import com.baoxiao.system.domain.dto.BatchUpdateOssDto;
import com.baoxiao.system.domain.vo.SysOssVo;
import com.baoxiao.system.service.ISysOssService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文件上传 控制层
 *
 * @author Lion Li
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/oss")
public class SysOssController extends BaseController {

    private final ISysOssService iSysOssService;

    /** 点击导航和全部获取内容有问题r
     * 查询OSS对象存储列表
     */
    @SaCheckPermission("system:oss:list")
    @GetMapping("/list")
    public TableDataInfo<SysOssVo> list(@Validated(QueryGroup.class) BatchUpdateOssBo bo, PageQuery pageQuery) {
        return iSysOssService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询OSS对象基于id串8888
     *
     * @param ossIds OSS对象ID串
     */
    @SaCheckPermission("system:oss:list")
    @GetMapping("/listByIds/{ossIds}")
    public R<List<SysOssVo>> listByIds(@NotEmpty(message = "主键不能为空")
                                       @PathVariable Long[] ossIds) {
        List<SysOssVo> list = iSysOssService.listByIds(Arrays.asList(ossIds));
        return R.ok(list);
    }

    /**
     * 上传OSS对象存储
     *
     * @param file 文件
     */
    @SaCheckPermission("system:oss:upload")
    @Log(title = "OSS对象存储", businessType = BusinessType.INSERT)
    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Map<String, String>> upload(@RequestPart("file") MultipartFile file, BatchUpdateOssBo sysOssBo) {
        String extension = FileUtil.extName(file.getOriginalFilename());

        if (ObjectUtil.isNull(file)) {
            return R.fail("上传文件不能为空");
        }

        /*图片*/
        if (StringUtils.equalsAnyIgnoreCase(extension, MimeTypeUtils.IMAGE_EXTENSION)) {
            sysOssBo.setGroupType(1L);
        /*办公三件套*/
        }else if(StringUtils.equalsAnyIgnoreCase(extension, MimeTypeUtils.OFFICE_EXTENSION)){
            sysOssBo.setGroupType(2L);
        /*其他*/
        }else{
            sysOssBo.setGroupType(3L);
        }

        if(sysOssBo.getGroupId() == null){
            sysOssBo.setGroupId(0L);
        }

        SysOssVo oss = iSysOssService.upload(file, sysOssBo);
        Map<String, String> map = new HashMap<>(2);
        map.put("url", oss.getUrl());
        map.put("fileName", oss.getOriginalName());
        map.put("ossId", oss.getOssId().toString());
        return R.ok(map);
    }

    /**
     * 下载OSS对象
     *
     * @param ossId OSS对象ID
     */
    @SaCheckPermission("system:oss:download")
    @GetMapping("/download/{ossId}")
    public void download(@PathVariable Long ossId, HttpServletResponse response) throws IOException {
        iSysOssService.download(ossId,response);
    }

    /**
     * 删除OSS对象存储
     *
     * @param ossIds OSS对象ID串
     */
    @SaCheckPermission("system:oss:remove")
    @Log(title = "OSS对象存储", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ossIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ossIds) {
        return toAjax(iSysOssService.deleteWithValidByIds(Arrays.asList(ossIds), true));
    }

    /**
     * 修改OSS对象存储分组
     *
     * @param batchUpdateOssDto OSS对象ID串
     * @return 结果
     */
    @SaCheckPermission("system:oss:update")
    @Log(title = "OSS对象存储", businessType = BusinessType.UPDATE)
    @PutMapping("/updateGroupId")
    public R<Void> update(@RequestBody BatchUpdateOssDto batchUpdateOssDto){
        return toAjax(iSysOssService.batchUpdateByGroupId(batchUpdateOssDto));
    }
}
