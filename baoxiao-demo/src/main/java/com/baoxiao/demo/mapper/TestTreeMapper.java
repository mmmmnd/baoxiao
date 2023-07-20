package com.baoxiao.demo.mapper;

import com.baoxiao.common.annotation.DataColumn;
import com.baoxiao.common.annotation.DataPermission;
import com.baoxiao.common.core.mapper.BaseMapperPlus;
import com.baoxiao.demo.domain.TestTree;
import com.baoxiao.demo.domain.vo.TestTreeVo;

/**
 * 测试树表Mapper接口
 *
 * @author Lion Li
 * @date 2021-07-26
 */
@DataPermission({
    @DataColumn(key = "deptName", value = "dept_id"),
    @DataColumn(key = "userName", value = "user_id")
})
public interface TestTreeMapper extends BaseMapperPlus<TestTreeMapper, TestTree, TestTreeVo> {

}
