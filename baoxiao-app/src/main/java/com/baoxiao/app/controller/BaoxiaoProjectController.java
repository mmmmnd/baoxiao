package com.baoxiao.app.controller;

import java.util.List;
import java.util.Arrays;

import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baoxiao.common.utils.TreeBuildUtils;
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
import com.baoxiao.app.domain.vo.BaoxiaoProjectVo;
import com.baoxiao.app.domain.bo.BaoxiaoProjectBo;
import com.baoxiao.app.service.IBaoxiaoProjectService;
import com.baoxiao.common.core.page.TableDataInfo;

/**
 * 项目类型
 *
 * @author baoxiao
 * @date 2024-01-03
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/app/project")
public class BaoxiaoProjectController extends BaseController {

    private final IBaoxiaoProjectService iBaoxiaoProjectService;

    /**
     * 查询项目类型列表
     */
    @SaCheckPermission("app:project:list")
    @GetMapping("/list")
    public TableDataInfo<BaoxiaoProjectVo> list(BaoxiaoProjectBo bo, PageQuery pageQuery) {
        return iBaoxiaoProjectService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询所有项目类型列表
     */
    @SaCheckPermission("app:project:list")
    @GetMapping("/allList")
    public R<List<BaoxiaoProjectVo>> list(BaoxiaoProjectBo bo) {
        List<BaoxiaoProjectVo> baoxiaoProjectVos = iBaoxiaoProjectService.queryAllList(bo);

        return R.ok(baoxiaoProjectVos);
    }

    /**
     * 导出项目类型列表
     */
    @SaCheckPermission("app:project:export")
    @Log(title = "项目类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BaoxiaoProjectBo bo, HttpServletResponse response) {
        List<BaoxiaoProjectVo> list = iBaoxiaoProjectService.queryList(bo);
        ExcelUtil.exportExcel(list, "项目类型", BaoxiaoProjectVo.class, response);
    }

    /**
     * 获取项目类型详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("app:project:query")
    @GetMapping("/{id}")
    public R<BaoxiaoProjectVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(iBaoxiaoProjectService.queryById(id));
    }

    /**
     * 新增项目类型
     */
    @SaCheckPermission("app:project:add")
    @Log(title = "项目类型", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BaoxiaoProjectBo bo) {
        return toAjax(iBaoxiaoProjectService.insertByBo(bo));
    }

    /**
     * 修改项目类型
     */
    @SaCheckPermission("app:project:edit")
    @Log(title = "项目类型", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BaoxiaoProjectBo bo) {
        return toAjax(iBaoxiaoProjectService.updateByBo(bo));
    }

    /**
     * 删除项目类型
     *
     * @param ids 主键串
     */
    @SaCheckPermission("app:project:remove")
    @Log(title = "项目类型", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(iBaoxiaoProjectService.deleteWithValidByIds(Arrays.asList(ids), true));
    }
}
