package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoBank;
import com.baoxiao.app.domain.vo.BaoxiaoBankVo;
import com.baoxiao.app.domain.bo.BaoxiaoBankBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 银行Service接口
 *
 * @author baoxiao
 * @date 2023-09-05
 */
public interface IBaoxiaoBankService {

    /**
     * 查询银行
     */
    BaoxiaoBankVo queryById(Long bankId);

    /**
     * 查询银行列表
     */
    TableDataInfo<BaoxiaoBankVo> queryPageList(BaoxiaoBankBo bo, PageQuery pageQuery);

    /**
     * 查询银行列表
     */
    List<BaoxiaoBankVo> queryList(BaoxiaoBankBo bo);

    /**
     * 新增银行
     */
    Boolean insertByBo(BaoxiaoBankBo bo);

    /**
     * 修改银行
     */
    Boolean updateByBo(BaoxiaoBankBo bo);

    /**
     * 校验并批量删除银行信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);


}

