package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoCompany;
import com.baoxiao.app.domain.vo.BaoxiaoCompanyVo;
import com.baoxiao.app.domain.bo.BaoxiaoCompanyBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 子公司管理Service接口
 *
 * @author baoxiao
 * @date 2023-09-05
 */
public interface IBaoxiaoCompanyService {

    /**
     * 查询子公司管理
     */
    BaoxiaoCompanyVo queryById(Long companyId);

    /**
     * 查询子公司管理列表
     */
    TableDataInfo<BaoxiaoCompanyVo> queryPageList(BaoxiaoCompanyBo bo, PageQuery pageQuery);

    /**
     * 查询子公司管理列表
     */
    List<BaoxiaoCompanyVo> queryList(BaoxiaoCompanyBo bo);

    /**
     * 新增子公司管理
     */
    Boolean insertByBo(BaoxiaoCompanyBo bo);

    /**
     * 修改子公司管理
     */
    Boolean updateByBo(BaoxiaoCompanyBo bo);

    /**
     * 校验并批量删除子公司管理信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
