package com.baoxiao.app.mapper;

import com.baoxiao.app.domain.BaoxiaoOrder;
import com.baoxiao.app.domain.vo.BaoxiaoOrderInfoVo;
import com.baoxiao.app.domain.vo.BaoxiaoOrderVo;
import com.baoxiao.common.annotation.DataColumn;
import com.baoxiao.common.annotation.DataPermission;
import com.baoxiao.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

/**
 * 订单Mapper接口
 *
 * @author baoxiao
 * @date 2023-09-12
 */
@DataPermission({
    @DataColumn(key = "deptName", value = "dept_id"),
    @DataColumn(key = "userName", value = "user_id")
})
public interface BaoxiaoOrderMapper extends BaseMapperPlus<BaoxiaoOrderMapper, BaoxiaoOrder, BaoxiaoOrderVo> {

    BaoxiaoOrderInfoVo selectOrderInfoById(@Param("orderId") Long orderId);
}
