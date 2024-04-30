package com.baoxiao.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

import com.baoxiao.app.domain.vo.BaoxiaoClientUnitImportVo;
import com.baoxiao.app.domain.vo.BaoxiaoDeptImportVo;
import com.baoxiao.app.domain.vo.BaoxiaoUserImportVo;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.http.MediaType;
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
import com.baoxiao.app.domain.vo.BaoxiaoShareVo;
import com.baoxiao.app.domain.bo.BaoxiaoShareBo;
import com.baoxiao.app.service.IBaoxiaoShareService;
import com.baoxiao.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;
import javax.validation.constraints.NotNull;
/**
 * 分摊
 *
 * @author baoxiao
 * @date 2024-04-03
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/share")
public class BaoxiaoShareController extends BaseController {

    private final IBaoxiaoShareService iBaoxiaoShareService;

    /**
     * 查询分摊列表
     */
    @SaCheckPermission("app:share:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoShareVo> list(BaoxiaoShareBo bo, PageQuery pageQuery) {
        return iBaoxiaoShareService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出分摊列表
     */
    @SaCheckPermission("app:share:export")
    @Log(title = "分摊", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoShareBo bo, HttpServletResponse response) {
        List<BaoxiaoShareVo> list = iBaoxiaoShareService.queryList(bo);
        ExcelUtil.exportExcel(list, "分摊", BaoxiaoShareVo.class, response);
    }

    /**
     * 获取分摊详细信息
     *
     * @param shareId 主键
     */
    @SaCheckPermission("app:share:query")
    @GetMapping("/{shareId}")
    public R<BaoxiaoShareVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long shareId) {
        return R.ok(iBaoxiaoShareService.queryById(shareId));
    }

    /**
     * 新增分摊
     */
    @SaCheckPermission("app:share:add")
    @Log(title = "分摊", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoShareBo bo) {
        return toAjax(iBaoxiaoShareService.insertByBo(bo));
    }

    /**
     * 修改分摊
     */
    @SaCheckPermission("app:share:edit")
    @Log(title = "分摊", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoShareBo bo) {
        return toAjax(iBaoxiaoShareService.updateByBo(bo));
    }

    /**
     * 删除分摊
     *
     * @param shareIds 主键串
     */
    @SaCheckPermission("app:share:remove")
    @Log(title = "分摊", businessType = BusinessType.DELETE)
    @DeleteMapping("/{shareIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] shareIds) {
        return toAjax(iBaoxiaoShareService.deleteWithValidByIds(Arrays.asList(shareIds), true));
    }

    /**
     * 导入分摊表
     *
     */
    @SaCheckPermission("app:share:import")
    @Log(title = "分摊", businessType = BusinessType.IMPORT)
    @PostMapping(value = "/importShare", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importShare(@RequestPart("file") MultipartFile file, @NotNull(message = "订单id不能为空") Long orderId) throws IOException {
        return R.ok(iBaoxiaoShareService.importShare(file,orderId));
    }

    /**
     * 获取导入部门分摊表
     *
     */
    @GetMapping("/importTemplate/{type}")
    @Log(title = "分摊", businessType = BusinessType.EXPORT)
    public void importTemplate(HttpServletResponse response, @NotNull(message = "模板类型不能为空") @PathVariable Integer type){
        switch (type){
            case 0:
                ExcelUtil.exportExcel(new ArrayList<>(), "部门分摊表", BaoxiaoDeptImportVo.class, response);
                break;
            case 1:
                ExcelUtil.exportExcel(new ArrayList<>(), "人员分摊表", BaoxiaoUserImportVo.class, response);
                break;
            case 2:
                ExcelUtil.exportExcel(new ArrayList<>(), "客商分摊表", BaoxiaoClientUnitImportVo.class, response);
                break;
            default:
                ExcelUtil.exportExcel(new ArrayList<>(), "部门分摊表", BaoxiaoDeptImportVo.class, response);
                break;
        }
    }

}
