package com.baoxiao.web.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baoxiao.common.core.controller.BaseController;
import com.baoxiao.common.core.domain.PageQuery;
import com.baoxiao.common.core.domain.R;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.validate.AddGroup;
import com.baoxiao.common.core.validate.EditGroup;
import com.baoxiao.system.domain.bo.SysOssGroupBo;
import com.baoxiao.system.domain.vo.SysOssGroupVo;
import com.baoxiao.system.service.ISysOssGroupService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/oss/group")
public class SysOssGroupController extends BaseController {

    private final ISysOssGroupService iSysOssGroupService;

    /**
     * 查询对象分组存储配置列表
     */
    @SaCheckPermission("system:oss:list")
    @GetMapping("/page")
    public TableDataInfo<SysOssGroupVo> page(SysOssGroupBo bo, PageQuery pageQuery) {
        return iSysOssGroupService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询对象分组存储配置列表
     */
    @SaCheckPermission("system:oss:list")
    @GetMapping("/treeNode")
    public R<List<SysOssGroupVo>> treeNodeList(SysOssGroupBo bo) {
        List<SysOssGroupVo> sysOssGroupVos = iSysOssGroupService.selectOssGroupList(bo);
        return R.ok(sysOssGroupVos);
    }

    /**
     * 新增对象分组存储配置
     */
    @SaCheckPermission("system:oss:add")
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody SysOssGroupBo bo) {
        iSysOssGroupService.insertByBo(bo);
        return R.ok();
    }

    /**
     * 新增对象分组存储配置
     */
    @SaCheckPermission("system:oss:edit")
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody SysOssGroupBo bo) {
        iSysOssGroupService.updateByBo(bo);
        return R.ok();
    }

    /**
     * 删除对象分组存储配置
     */
    @SaCheckPermission("system:oss:del")
    @DeleteMapping("/{groupId}")
    public R<Void> remove(@PathVariable Long groupId) {
        iSysOssGroupService.DeleteByGroupId(groupId);
        return R.ok();
    }
}
