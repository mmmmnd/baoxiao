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
import com.baoxiao.app.domain.vo.BaoxiaoAuditVo;
import com.baoxiao.app.domain.bo.BaoxiaoAuditBo;
import com.baoxiao.app.service.IBaoxiaoAuditService;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 审批流
 *
 * @author baoxiao
 * @date 2023-11-10
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/baoxiao/audit")
public class BaoxiaoAuditController extends BaseController {

    private final IBaoxiaoAuditService iBaoxiaoAuditService;

    /**
     * 查询审批流列表
     */
    @SaCheckPermission("baoxiao:audit:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoAuditVo> list(BaoxiaoAuditBo bo, PageQuery pageQuery) {
        return iBaoxiaoAuditService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出审批流列表
     */
    @SaCheckPermission("baoxiao:audit:export")
    @Log(title = "审批流", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoAuditBo bo, HttpServletResponse response) {
        List<BaoxiaoAuditVo> list = iBaoxiaoAuditService.queryList(bo);
        ExcelUtil.exportExcel(list, "审批流", BaoxiaoAuditVo.class, response);
    }

    /**
     * 获取审批流详细信息
     *
     * @param auditId 主键
     */
    @SaCheckPermission("baoxiao:audit:query")
    @GetMapping("/{auditId}")
    public R<BaoxiaoAuditVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long auditId) {
        return R.ok(iBaoxiaoAuditService.queryById(auditId));
    }

    /**
     * 新增审批流
     */
    @SaCheckPermission("baoxiao:audit:add")
    @Log(title = "审批流", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoAuditBo bo) {
        return toAjax(iBaoxiaoAuditService.insertByBo(bo));
    }

    /**
     * 修改审批流
     */
    @SaCheckPermission("baoxiao:audit:edit")
    @Log(title = "审批流", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoAuditBo bo) {
        return toAjax(iBaoxiaoAuditService.updateByBo(bo));
    }

    /**
     * 删除审批流
     *
     * @param auditIds 主键串
     */
    @SaCheckPermission("baoxiao:audit:remove")
    @Log(title = "审批流", businessType = BusinessType.DELETE)
    @DeleteMapping("/{auditIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] auditIds) {
        return toAjax(iBaoxiaoAuditService.deleteWithValidByIds(Arrays.asList(auditIds), true));
    }
}
