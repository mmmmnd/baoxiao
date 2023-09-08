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
import com.baoxiao.app.domain.vo.BaoxiaoCompanyVo;
import com.baoxiao.app.domain.bo.BaoxiaoCompanyBo;
import com.baoxiao.app.service.IBaoxiaoCompanyService;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 子公司管理
 *
 * @author baoxiao
 * @date 2023-09-05
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/company")
public class BaoxiaoCompanyController extends BaseController {

    private final IBaoxiaoCompanyService iBaoxiaoCompanyService;

    /**
     * 查询子公司管理列表
     */
    @SaCheckPermission("app:company:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoCompanyVo> list(BaoxiaoCompanyBo bo, PageQuery pageQuery) {
        return iBaoxiaoCompanyService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出子公司管理列表
     */
    @SaCheckPermission("app:company:export")
    @Log(title = "子公司管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoCompanyBo bo, HttpServletResponse response) {
        List<BaoxiaoCompanyVo> list = iBaoxiaoCompanyService.queryList(bo);
        ExcelUtil.exportExcel(list, "子公司管理", BaoxiaoCompanyVo.class, response);
    }

    /**
     * 获取子公司管理详细信息
     *
     * @param companyId 主键
     */
    @SaCheckPermission("app:company:query")
    @GetMapping("/{companyId}")
    public R<BaoxiaoCompanyVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long companyId) {
        return R.ok(iBaoxiaoCompanyService.queryById(companyId));
    }

    /**
     * 新增子公司管理
     */
    @SaCheckPermission("app:company:add")
    @Log(title = "子公司管理", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoCompanyBo bo) {
        return toAjax(iBaoxiaoCompanyService.insertByBo(bo));
    }

    /**
     * 修改子公司管理
     */
    @SaCheckPermission("app:company:edit")
    @Log(title = "子公司管理", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoCompanyBo bo) {
        return toAjax(iBaoxiaoCompanyService.updateByBo(bo));
    }

    /**
     * 删除子公司管理
     *
     * @param companyIds 主键串
     */
    @SaCheckPermission("app:company:remove")
    @Log(title = "子公司管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{companyIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] companyIds) {
        return toAjax(iBaoxiaoCompanyService.deleteWithValidByIds(Arrays.asList(companyIds), true));
    }
}
