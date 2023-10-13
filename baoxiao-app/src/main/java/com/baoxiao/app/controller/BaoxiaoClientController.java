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
import com.baoxiao.app.domain.vo.BaoxiaoClientVo;
import com.baoxiao.app.domain.bo.BaoxiaoClientBo;
import com.baoxiao.app.service.IBaoxiaoClientService;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 客户信息
 *
 * @author baoxiao
 * @date 2023-09-28
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/client")
public class BaoxiaoClientController extends BaseController {

    private final IBaoxiaoClientService iBaoxiaoClientService;

    /**
     * 查询客户信息列表
     */
    @SaCheckPermission("app:client:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoClientVo> list(BaoxiaoClientBo bo, PageQuery pageQuery) {
        return iBaoxiaoClientService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出客户信息列表
     */
    @SaCheckPermission("app:client:export")
    @Log(title = "客户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoClientBo bo, HttpServletResponse response) {
        List<BaoxiaoClientVo> list = iBaoxiaoClientService.queryList(bo);
        ExcelUtil.exportExcel(list, "客户信息", BaoxiaoClientVo.class, response);
    }

    /**
     * 获取客户信息详细信息
     *
     * @param clientId 主键
     */
    @SaCheckPermission("app:client:query")
    @GetMapping("/{clientId}")
    public R<BaoxiaoClientVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long clientId) {
        return R.ok(iBaoxiaoClientService.queryById(clientId));
    }

    /**
     * 新增客户信息
     */
    @SaCheckPermission("app:client:add")
    @Log(title = "客户信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoClientBo bo) {
        return toAjax(iBaoxiaoClientService.insertByBo(bo));
    }

    /**
     * 修改客户信息
     */
    @SaCheckPermission("app:client:edit")
    @Log(title = "客户信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoClientBo bo) {
        return toAjax(iBaoxiaoClientService.updateByBo(bo));
    }

    /**
     * 删除客户信息
     *
     * @param clientIds 主键串
     */
    @SaCheckPermission("app:client:remove")
    @Log(title = "客户信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{clientIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] clientIds) {
        return toAjax(iBaoxiaoClientService.deleteWithValidByIds(Arrays.asList(clientIds), true));
    }
}
