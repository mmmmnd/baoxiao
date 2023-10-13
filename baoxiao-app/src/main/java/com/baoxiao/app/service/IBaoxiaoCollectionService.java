package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoCollection;
import com.baoxiao.app.domain.vo.BaoxiaoCollectionVo;
import com.baoxiao.app.domain.bo.BaoxiaoCollectionBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 收款人信息Service接口
 *
 * @author baoxiao
 * @date 2023-10-07
 */
public interface IBaoxiaoCollectionService {

    /**
     * 查询收款人信息
     */
    BaoxiaoCollectionVo queryById(Long collectionId);

    /**
     * 查询收款人信息列表
     */
    TableDataInfo<BaoxiaoCollectionVo> queryPageList(BaoxiaoCollectionBo bo, PageQuery pageQuery);

    /**
     * 查询收款人信息列表
     */
    List<BaoxiaoCollectionVo> queryList(BaoxiaoCollectionBo bo);

    /**
     * 新增收款人信息
     */
    Boolean insertByBo(BaoxiaoCollectionBo bo);

    /**
     * 修改收款人信息
     */
    Boolean updateByBo(BaoxiaoCollectionBo bo);

    /**
     * 校验并批量删除收款人信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 批量添加List
     */
    void batchInsertByList(List<BaoxiaoCollection> list);
}
