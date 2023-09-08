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
import com.baoxiao.app.domain.vo.BaoxiaoBankVo;
import com.baoxiao.app.domain.bo.BaoxiaoBankBo;
import com.baoxiao.app.service.IBaoxiaoBankService;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 银行
 *
 * @author baoxiao
 * @date 2023-09-05
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/bank")
public class BaoxiaoBankController extends BaseController {

    private final IBaoxiaoBankService iBaoxiaoBankService;

    /**
     * 查询银行列表
     */
    @SaCheckPermission("app:bank:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoBankVo> list(BaoxiaoBankBo bo, PageQuery pageQuery) {
        return iBaoxiaoBankService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出银行列表
     */
    @SaCheckPermission("app:bank:export")
    @Log(title = "银行", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoBankBo bo, HttpServletResponse response) {
        List<BaoxiaoBankVo> list = iBaoxiaoBankService.queryList(bo);
        ExcelUtil.exportExcel(list, "银行", BaoxiaoBankVo.class, response);
    }

    /**
     * 获取银行详细信息
     *
     * @param bankId 主键
     */
    @SaCheckPermission("app:bank:query")
    @GetMapping("/{bankId}")
    public R<BaoxiaoBankVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long bankId) {
        return R.ok(iBaoxiaoBankService.queryById(bankId));
    }

    /**
     * 新增银行
     */
    @SaCheckPermission("app:bank:add")
    @Log(title = "银行", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoBankBo bo) {
        return toAjax(iBaoxiaoBankService.insertByBo(bo));
    }

    /**
     * 修改银行
     */
    @SaCheckPermission("app:bank:edit")
    @Log(title = "银行", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoBankBo bo) {
        return toAjax(iBaoxiaoBankService.updateByBo(bo));
    }

    /**
     * 删除银行
     *
     * @param bankIds 主键串
     */
    @SaCheckPermission("app:bank:remove")
    @Log(title = "银行", businessType = BusinessType.DELETE)
    @DeleteMapping("/{bankIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] bankIds) {
        return toAjax(iBaoxiaoBankService.deleteWithValidByIds(Arrays.asList(bankIds), true));
    }
}
