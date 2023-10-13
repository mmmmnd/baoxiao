package com.baoxiao.app.controller;

import java.util.List;
import java.util.Arrays;

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
import com.baoxiao.app.domain.vo.BaoxiaoCollectionVo;
import com.baoxiao.app.domain.bo.BaoxiaoCollectionBo;
import com.baoxiao.app.service.IBaoxiaoCollectionService;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 收款人信息
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/collection")
public class BaoxiaoCollectionController extends BaseController {

    private final IBaoxiaoCollectionService iBaoxiaoCollectionService;

    /**
     * 查询收款人信息列表
     */
    @SaCheckPermission("app:collection:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoCollectionVo> list(BaoxiaoCollectionBo bo, PageQuery pageQuery) {
        return iBaoxiaoCollectionService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出收款人信息列表
     */
    @SaCheckPermission("app:collection:export")
    @Log(title = "收款人信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoCollectionBo bo, HttpServletResponse response) {
        List<BaoxiaoCollectionVo> list = iBaoxiaoCollectionService.queryList(bo);
        ExcelUtil.exportExcel(list, "收款人信息", BaoxiaoCollectionVo.class, response);
    }

    /**
     * 获取收款人信息详细信息
     *
     * @param collectionId 主键
     */
    @SaCheckPermission("app:collection:query")
    @GetMapping("/{collectionId}")
    public R<BaoxiaoCollectionVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long collectionId) {
        return R.ok(iBaoxiaoCollectionService.queryById(collectionId));
    }

    /**
     * 新增收款人信息
     */
    @SaCheckPermission("app:collection:add")
    @Log(title = "收款人信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoCollectionBo bo) {
        return toAjax(iBaoxiaoCollectionService.insertByBo(bo));
    }

    /**
     * 修改收款人信息
     */
    @SaCheckPermission("app:collection:edit")
    @Log(title = "收款人信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoCollectionBo bo) {
        return toAjax(iBaoxiaoCollectionService.updateByBo(bo));
    }

    /**
     * 删除收款人信息
     *
     * @param collectionIds 主键串
     */
    @SaCheckPermission("app:collection:remove")
    @Log(title = "收款人信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{collectionIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] collectionIds) {
        return toAjax(iBaoxiaoCollectionService.deleteWithValidByIds(Arrays.asList(collectionIds), true));
    }
}
