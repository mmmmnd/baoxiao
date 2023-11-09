package com.baoxiao.app.service;

import com.baoxiao.app.domain.BaoxiaoOrderFile;
import com.baoxiao.app.domain.dto.BaoxiaoOrderFileAddDto;
import com.baoxiao.app.domain.vo.BaoxiaoOrderFileVo;
import com.baoxiao.app.domain.bo.BaoxiaoOrderFileBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 订单文件Service接口
 *
 * @author baoxiao
 * @date 2023-09-23
 */
public interface IBaoxiaoOrderFileService {

    /**
     * 查询订单文件
     */
    BaoxiaoOrderFileVo queryById(Long fileId);

    /**
     * 查询订单文件列表
     */
    TableDataInfo<BaoxiaoOrderFileVo> queryPageList(BaoxiaoOrderFileBo bo, PageQuery pageQuery);

    /**
     * 查询订单文件列表
     */
    List<BaoxiaoOrderFileVo> queryList(BaoxiaoOrderFileBo bo);

    /**
     * 新增订单文件
     */
    Boolean insertByBo(BaoxiaoOrderFileBo bo);

    /**
     * 批量添加
     */
    List<BaoxiaoOrderFile> batchInsertByIds(BaoxiaoOrderFileAddDto dto);

    /**
     * 修改订单文件
     */
    Boolean updateByBo(BaoxiaoOrderFileBo bo);

    /**
     * 校验并批量删除订单文件信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 批量查找ids
     */
    List<BaoxiaoOrderFile> btachQueryByIds(List<Long> ids);

    /**
     * 批量修改
     */
    Boolean batchUpdateByIds(List<BaoxiaoOrderFile> bo);


    /**
     * 批量删除不存在的订单文件
     */
    Boolean deleteWithValidByOrderId();

    /**
     * 查找出所有前端传过来的fileId然后讲orderId批量插入
     * 文件中未存在orderId的将进行批量删除
     */
    void batchUpdaeDeleteByOrderId(List<Long> fileIds, Long orderId);

}
