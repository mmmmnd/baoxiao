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
import com.baoxiao.app.domain.vo.BaoxiaoFeeVo;
import com.baoxiao.app.domain.bo.BaoxiaoFeeBo;
import com.baoxiao.app.service.IBaoxiaoFeeService;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 费用明细
 *
 * @author baoxiao
 * @date 2023-10-07
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/fee")
public class BaoxiaoFeeController extends BaseController {

    private final IBaoxiaoFeeService iBaoxiaoFeeService;

    /**
     * 查询费用明细列表
     */
    @SaCheckPermission("app:fee:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoFeeVo> list(BaoxiaoFeeBo bo, PageQuery pageQuery) {
        return iBaoxiaoFeeService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出费用明细列表
     */
    @SaCheckPermission("app:fee:export")
    @Log(title = "费用明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoFeeBo bo, HttpServletResponse response) {
        List<BaoxiaoFeeVo> list = iBaoxiaoFeeService.queryList(bo);
        ExcelUtil.exportExcel(list, "费用明细", BaoxiaoFeeVo.class, response);
    }

    /**
     * 获取费用明细详细信息
     *
     * @param feeId 主键
     */
    @SaCheckPermission("app:fee:query")
    @GetMapping("/{feeId}")
    public R<BaoxiaoFeeVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long feeId) {
        return R.ok(iBaoxiaoFeeService.queryById(feeId));
    }

    /**
     * 新增费用明细
     */
    @SaCheckPermission("app:fee:add")
    @Log(title = "费用明细", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoFeeBo bo) {
        return toAjax(iBaoxiaoFeeService.insertByBo(bo));
    }

    /**
     * 修改费用明细
     */
    @SaCheckPermission("app:fee:edit")
    @Log(title = "费用明细", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoFeeBo bo) {
        return toAjax(iBaoxiaoFeeService.updateByBo(bo));
    }

    /**
     * 删除费用明细
     *
     * @param feeIds 主键串
     */
    @SaCheckPermission("app:fee:remove")
    @Log(title = "费用明细", businessType = BusinessType.DELETE)
    @DeleteMapping("/{feeIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] feeIds) {
        return toAjax(iBaoxiaoFeeService.deleteWithValidByIds(Arrays.asList(feeIds), true));
    }
}
