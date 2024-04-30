package com.baoxiao.app.service;

import com.baoxiao.app.domain.vo.BaoxiaoShareVo;
import com.baoxiao.app.domain.bo.BaoxiaoShareBo;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

/**
 * 分摊Service接口
 *
 * @author baoxiao
 * @date 2024-04-03
 */
public interface IBaoxiaoShareService {

    /**
     * 查询分摊
     */
    BaoxiaoShareVo queryById(Long shareId);

    /**
     * 查询分摊列表
     */
    TableDataInfo<BaoxiaoShareVo> queryPageList(BaoxiaoShareBo bo, PageQuery pageQuery);

    /**
     * 查询分摊列表
     */
    List<BaoxiaoShareVo> queryList(BaoxiaoShareBo bo);

    /**
     * 新增分摊
     */
    Boolean insertByBo(BaoxiaoShareBo bo);

    /**
     * 修改分摊
     */
    Boolean updateByBo(BaoxiaoShareBo bo);

    /**
     * 校验并批量删除分摊信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 导入分摊表
     */
    String importShare(MultipartFile file,  Long orderId) throws IOException;
}
