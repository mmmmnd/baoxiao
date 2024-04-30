package com.baoxiao.app.controller;

import java.util.List;
import java.util.Arrays;

import com.baoxiao.app.service.IBaoxiaoOrderSumService;
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
import com.baoxiao.app.domain.vo.BaoxiaoOrderSumVo;
import com.baoxiao.app.domain.bo.BaoxiaoOrderSumBo;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 订单金额
 *
 * @author baoxiao
 * @date 2024-03-29
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/orderSum")
public class BaoxiaoOrderSumController extends BaseController {

    private final IBaoxiaoOrderSumService iBaoxiaoOrderSumService;

    /**
     * 查询订单金额列表
     */
    @SaCheckPermission("app:orderSum:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoOrderSumVo> list(BaoxiaoOrderSumBo bo, PageQuery pageQuery) {
        return iBaoxiaoOrderSumService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出订单金额列表
     */
    @SaCheckPermission("app:orderSum:export")
    @Log(title = "订单金额", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoOrderSumBo bo, HttpServletResponse response) {
        List<BaoxiaoOrderSumVo> list = iBaoxiaoOrderSumService.queryList(bo);
        ExcelUtil.exportExcel(list, "订单金额", BaoxiaoOrderSumVo.class, response);
    }

    /**
     * 获取订单金额详细信息
     *
     * @param orderSumId 主键
     */
    @SaCheckPermission("app:orderSum:query")
    @GetMapping("/{orderSumId}")
    public R<BaoxiaoOrderSumVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long orderSumId) {
        return R.ok(iBaoxiaoOrderSumService.queryById(orderSumId));
    }

    /**
     * 新增订单金额
     */
    @SaCheckPermission("app:orderSum:add")
    @Log(title = "订单金额", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoOrderSumBo bo) {
        return toAjax(iBaoxiaoOrderSumService.insertByBo(bo));
    }

    /**
     * 修改订单金额
     */
    @SaCheckPermission("app:orderSum:edit")
    @Log(title = "订单金额", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoOrderSumBo bo) {
        return toAjax(iBaoxiaoOrderSumService.updateByBo(bo));
    }

    /**
     * 删除订单金额
     *
     * @param orderSumIds 主键串
     */
    @SaCheckPermission("app:orderSum:remove")
    @Log(title = "订单金额", businessType = BusinessType.DELETE)
    @DeleteMapping("/{orderSumIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] orderSumIds) {
        return toAjax(iBaoxiaoOrderSumService.deleteWithValidByIds(Arrays.asList(orderSumIds), true));
    }
}
