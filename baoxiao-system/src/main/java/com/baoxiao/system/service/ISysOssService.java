package com.baoxiao.system.service;

import com.baoxiao.common.core.domain.PageQuery;
import com.baoxiao.common.core.domain.model.LoginUser;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.system.domain.SysOss;
import com.baoxiao.system.domain.bo.BatchUpdateOssBo;
import com.baoxiao.system.domain.dto.BatchUpdateOssDto;
import com.baoxiao.system.domain.vo.SysOssVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

/**
 * 文件上传 服务层
 *
 * @author Lion Li
 */
public interface ISysOssService {

    TableDataInfo<SysOssVo> queryPageList(BatchUpdateOssBo sysOss, PageQuery pageQuery);

    List<SysOssVo> listByIds(Collection<Long> ossIds);

    SysOssVo getById(Long ossId);

    SysOssVo upload(MultipartFile file, BatchUpdateOssBo sysOssBo);

    void download(Long ossId, HttpServletResponse response) throws IOException;

    Integer deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     *  通过分组id查询所有oss
     * @param groupId 分组id
     * @return 结果
     */
    Long ListByGroupId(Long groupId);

    /**
     *  批量修改oss分组id
     * @param batchUpdateOssDto 实体
     * @return 结果
     */
    Integer batchUpdateByGroupId(BatchUpdateOssDto batchUpdateOssDto);

    /**
     * 查找文件名是否存在
     * @param fileName 文件名
     * @return 结果
     */
    String hasOssFileName(String fileName);
}
