package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoFee;
import com.baoxiao.app.domain.BaoxiaoOrderFile;
import com.baoxiao.app.domain.vo.BaoxiaoFeeVo;
import com.baoxiao.app.domain.bo.BaoxiaoFeeBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 费用明细Service接口
 *
 * @author baoxiao
 * @date 2023-10-07
 */
public interface IBaoxiaoFeeService {

    /**
     * 查询费用明细
     */
    BaoxiaoFeeVo queryById(Long feeId);

    /**
     * 查询费用明细列表
     */
    TableDataInfo<BaoxiaoFeeVo> queryPageList(BaoxiaoFeeBo bo, PageQuery pageQuery);

    /**
     * 查询费用明细列表
     */
    List<BaoxiaoFeeVo> queryList(BaoxiaoFeeBo bo);

    /**
     * 新增费用明细
     */
    Boolean insertByBo(BaoxiaoFeeBo bo);

    /**
     * 修改费用明细
     */
    Boolean updateByBo(BaoxiaoFeeBo bo);

    /**
     * 校验并批量删除费用明细信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 批量添加List
     */
    void batchInsertByList(List<BaoxiaoFee> list);

}
