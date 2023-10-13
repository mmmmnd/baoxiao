package com.baoxiao.app.controller;

import java.util.List;
import java.util.Arrays;

import com.baoxiao.app.domain.BaoxiaoOrderFile;
import com.baoxiao.app.domain.bo.BaoxiaoOrderFileBo;
import com.baoxiao.app.domain.dto.BaoxiaoOrderFileAddDto;
import com.baoxiao.app.domain.vo.BaoxiaoOrderFileVo;
import com.baoxiao.app.service.IBaoxiaoOrderFileService;
import com.baoxiao.common.core.page.TableDataInfo;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.baoxiao.common.annotation.RepeatSubmit;
import com.baoxiao.common.annotation.Log;
import com.baoxiao.common.core.controller.BaseController;
import com.baoxiao.common.core.domain.PageQuery;
import com.baoxiao.common.core.domain.R;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import com.baoxiao.common.enums.BusinessType;
import com.baoxiao.common.utils.poi.ExcelUtil;


/**
 * 订单文件
 *
 * @author baoxiao
 * @date 2023-09-23
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/orderFile")
public class BaoxiaoOrderFileController extends BaseController {

    private final IBaoxiaoOrderFileService iBaoxiaoOrderFileService;

    /**
     * 查询订单文件列表
     */
    @SaCheckPermission("app:orderFile:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoOrderFileVo> list(BaoxiaoOrderFileBo bo, PageQuery pageQuery) {
        return iBaoxiaoOrderFileService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出订单文件列表
     */
    @SaCheckPermission("app:orderFile:export")
    @Log(title = "订单文件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoOrderFileBo bo, HttpServletResponse response) {
        List<BaoxiaoOrderFileVo> list = iBaoxiaoOrderFileService.queryList(bo);
        ExcelUtil.exportExcel(list, "订单文件", BaoxiaoOrderFileVo.class, response);
    }

    /**
     * 获取订单文件详细信息
     *
     * @param fileId 主键
     */
    @SaCheckPermission("app:orderFile:query")
    @GetMapping("/{fileId}")
    public R<BaoxiaoOrderFileVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long fileId) {
        return R.ok(iBaoxiaoOrderFileService.queryById(fileId));
    }

    /**
     * 新增订单文件
     */
    @SaCheckPermission("app:orderFile:add")
    @Log(title = "订单文件", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public TableDataInfo<BaoxiaoOrderFile> add(@Validated(AddGroup.class) @RequestBody BaoxiaoOrderFileAddDto dto) {
        List<BaoxiaoOrderFile> baoxiaoOrderFiles = iBaoxiaoOrderFileService.batchInsertByIds(dto);

        return TableDataInfo.build(baoxiaoOrderFiles);
    }


    /**
     * 修改订单文件
     */
    @SaCheckPermission("app:orderFile:edit")
    @Log(title = "订单文件", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoOrderFileBo bo) {
        return toAjax(iBaoxiaoOrderFileService.updateByBo(bo));
    }

    /**
     * 删除订单文件
     *
     * @param fileIds 主键串
     */
    @SaCheckPermission("app:orderFile:remove")
    @Log(title = "订单文件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{fileIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] fileIds) {
        return toAjax(iBaoxiaoOrderFileService.deleteWithValidByIds(Arrays.asList(fileIds), true));
    }
}
