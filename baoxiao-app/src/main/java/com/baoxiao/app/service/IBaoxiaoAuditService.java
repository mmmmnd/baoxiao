package com.baoxiao.app.service;

import com.baoxiao.app.domain.dto.BaoxiaoAuditEditDto;
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
    Boolean insertByBo(Long orderId);

    /**
     * 修改审批流
     */
    Boolean updateByBo(BaoxiaoAuditEditDto dto);

    /**
     * 校验并批量删除审批流信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 获取个人审批流
     */
    TableDataInfo<BaoxiaoAuditVo> queryUserAduitList(PageQuery pageQuery);

    /**
     * 获取订单审批流
     */
    TableDataInfo<BaoxiaoAuditVo> queryOrderAuditList(Long orderId);
}
