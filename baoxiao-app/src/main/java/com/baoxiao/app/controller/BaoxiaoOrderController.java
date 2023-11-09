package com.baoxiao.app.controller;

import java.util.List;
import java.util.Arrays;

import com.baoxiao.app.domain.dto.BaoxiaoOrderAddDto;
import com.baoxiao.app.domain.dto.BaoxiaoOrderEditDto;
import com.baoxiao.app.domain.vo.BaoxiaoOrderInfoVo;
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
import com.baoxiao.app.domain.vo.BaoxiaoOrderVo;
import com.baoxiao.app.domain.bo.BaoxiaoOrderBo;
import com.baoxiao.app.service.IBaoxiaoOrderService;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 订单
 *
 * @author baoxiao
 * @date 2023-09-12
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/order")
public class BaoxiaoOrderController extends BaseController {

    private final IBaoxiaoOrderService iBaoxiaoOrderService;

    /**
     * 查询订单列表
     */
    @SaCheckPermission("app:order:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoOrderVo> list(BaoxiaoOrderBo bo, PageQuery pageQuery) {
        return iBaoxiaoOrderService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出订单列表
     */
    @SaCheckPermission("app:order:export")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoOrderBo bo, HttpServletResponse response) {
        List<BaoxiaoOrderVo> list = iBaoxiaoOrderService.queryList(bo);
        ExcelUtil.exportExcel(list, "订单", BaoxiaoOrderVo.class, response);
    }

    /**
     * 获取订单详细信息
     *
     * @param orderId 主键
     */
    @SaCheckPermission("app:order:query")
    @GetMapping("/{orderId}")
    public R<BaoxiaoOrderInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long orderId) {
        return R.ok(iBaoxiaoOrderService.queryById(orderId));
    }

    /**
     * 新增订单
     * @param dto
     */
    @SaCheckPermission("app:order:add")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoOrderAddDto dto) {
        return toAjax(iBaoxiaoOrderService.insertByBo(dto));
    }

    /**
     * 修改订单
     */
    @SaCheckPermission("app:order:edit")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoOrderEditDto dto) {
        return toAjax(iBaoxiaoOrderService.updateByBo(dto));
    }

    /**
     * 删除订单
     *
     * @param orderIds 主键串
     */
    @SaCheckPermission("app:order:remove")
    @Log(title = "订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{orderIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] orderIds) {
        return toAjax(iBaoxiaoOrderService.deleteWithValidByIds(Arrays.asList(orderIds),false));
    }
}
