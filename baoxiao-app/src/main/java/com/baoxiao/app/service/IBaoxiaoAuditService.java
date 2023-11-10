package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoAudit;
import com.baoxiao.app.domain.vo.BaoxiaoAuditVo;
import com.baoxiao.app.domain.bo.BaoxiaoAuditBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 审批流Service接口
 *
 * @author baoxiao
 * @date 2023-11-10
 */
public interface IBaoxiaoAuditService {

    /**
     * 查询审批流
     */
    BaoxiaoAuditVo queryById(Long auditId);

    /**
     * 查询审批流列表
     */
    TableDataInfo<BaoxiaoAuditVo> queryPageList(BaoxiaoAuditBo bo, PageQuery pageQuery);

    /**
     * 查询审批流列表
     */
    List<BaoxiaoAuditVo> queryList(BaoxiaoAuditBo bo);

    /**
     * 新增审批流
     */
    Boolean insertByBo(BaoxiaoAuditBo bo);

    /**
     * 修改审批流
     */
    Boolean updateByBo(BaoxiaoAuditBo bo);

    /**
     * 校验并批量删除审批流信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
