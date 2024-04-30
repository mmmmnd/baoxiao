package com.baoxiao.app.listener;

import cn.hutool.core.bean.BeanUtil;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baoxiao.app.domain.BaoxiaoShare;
import com.baoxiao.app.domain.bo.BaoxiaoOrderBo;
import com.baoxiao.app.domain.bo.BaoxiaoShareBo;
import com.baoxiao.app.domain.vo.*;
import com.baoxiao.app.domain.vo.BaoxiaoShareVo;
import com.baoxiao.app.enums.DeptShareEnum;
import com.baoxiao.app.enums.OffsetLoanEnum;
import com.baoxiao.app.enums.OrderStatusEnum;
import com.baoxiao.app.service.impl.BaoxiaoClientServiceImpl;
import com.baoxiao.app.service.impl.BaoxiaoOrderServiceImpl;
import com.baoxiao.app.service.impl.BaoxiaoProjectServiceImpl;
import com.baoxiao.app.service.impl.BaoxiaoShareServiceImpl;
import com.baoxiao.common.core.domain.entity.SysDept;
import com.baoxiao.common.core.domain.entity.SysUser;
import com.baoxiao.common.excel.ExcelListener;
import com.baoxiao.common.excel.ExcelResult;
import com.baoxiao.common.exception.ServiceException;
import com.baoxiao.common.utils.ValidatorUtils;
import com.baoxiao.common.utils.spring.SpringUtils;
import com.baoxiao.system.domain.vo.SysUserImportVo;
import com.baoxiao.system.service.impl.SysDeptServiceImpl;
import com.baoxiao.system.service.impl.SysUserServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class BaoxiaoShareImportListener extends AnalysisEventListener<BaoxiaoShareVo> implements ExcelListener<BaoxiaoShareVo> {

    private final BaoxiaoOrderServiceImpl baoxiaoOrderService;

    private final BaoxiaoClientServiceImpl baoxiaoClientService;

    private final BaoxiaoProjectServiceImpl baoxiaoProjectService;

    private final SysDeptServiceImpl sysDeptService;

    private final SysUserServiceImpl sysUserService;

    private final BaoxiaoShareServiceImpl baoxiaoShareService;

    private Long orderId;

    private Boolean flag = false;

    private int failureNum = 0;

    private int successNum = 0;

    private final StringBuilder successMsg = new StringBuilder();

    private final StringBuilder failureMsg = new StringBuilder();

    private final List<BaoxiaoShareVo> successList = new ArrayList<>();

    private final List<String> errorList = new ArrayList<>();

    public BaoxiaoShareImportListener(Long orderId) {
        this.orderId = orderId;
        this.baoxiaoOrderService = SpringUtils.getBean(BaoxiaoOrderServiceImpl.class);
        this.baoxiaoClientService = SpringUtils.getBean(BaoxiaoClientServiceImpl.class);
        this.baoxiaoProjectService = SpringUtils.getBean(BaoxiaoProjectServiceImpl.class);
        this.baoxiaoShareService = SpringUtils.getBean(BaoxiaoShareServiceImpl.class);
        this.sysDeptService = SpringUtils.getBean(SysDeptServiceImpl.class);
        this.sysUserService = SpringUtils.getBean(SysUserServiceImpl.class);
    }

    /**
     * 通常用于获取解析Excel后的结果
     *
     * @return
     */
    @Override
    public ExcelResult<BaoxiaoShareVo> getExcelResult() {
        return new ExcelResult<BaoxiaoShareVo>() {

            /**
             * 导入回执
             */
            @Override
            public String getAnalysis() {
                return flag ? getFailureMessage() : getSuccessMessage();
            }

            private String getFailureMessage() {
                return "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：" + failureMsg;
            }

            private String getSuccessMessage() {
                return "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：" + successMsg;
            }

            /**
             * 对象列表
             */
            @Override
            public List<BaoxiaoShareVo> getList() {
                return successList;
            }

            /**
             * 错误列表
             */
            @Override
            public List<String> getErrorList() {
                return errorList;
            }
        };
    }

    /**
     * 每读取一行Excel数据时被调用
     *
     * @param baoxiaoShareVo  数据的值对象
     * @param analysisContext 分析上下文对象
     */
    @Override
    public void invoke(BaoxiaoShareVo baoxiaoShareVo, AnalysisContext analysisContext) {
        BaoxiaoShare share = BeanUtil.toBean(baoxiaoShareVo, BaoxiaoShare.class);
        ValidatorUtils.validate(share);

        BaoxiaoOrderVo order = baoxiaoOrderService.queryById(orderId);

        if (order == null) {
            handleFailure("订单不存在！");
            return;
        }

        SysDept dept = sysDeptService.queryDeptByName(baoxiaoShareVo.getDeptName());
        BaoxiaoClientVo clientVo = baoxiaoClientService.queryByName(baoxiaoShareVo.getClientUnitName());
        BaoxiaoProjectVo projectVo = baoxiaoProjectService.queryByName(baoxiaoShareVo.getProjectName());
        SysUser user = sysUserService.selectUserByUserName(baoxiaoShareVo.getUserName());

        if (dept == null || projectVo == null) {
            handleFailure(dept, projectVo);
        } else {
            handleSuccess(baoxiaoShareVo, dept, clientVo, projectVo, user, order);
        }
    }

    private void handleFailure(String message) {
        flag = true;
        failureNum++;
        failureMsg.append(message).append("<br/>");
        errorList.add(message);
    }

    private void handleFailure(SysDept dept, BaoxiaoProjectVo projectVo) {
        if (dept == null) {
            handleFailure("部门不存在！");
        }
        if (projectVo == null) {
            handleFailure("项目类型不存在！");
        }
    }

    private void handleSuccess(BaoxiaoShareVo baoxiaoShareVo, SysDept dept, BaoxiaoClientVo clientVo, BaoxiaoProjectVo projectVo, SysUser user, BaoxiaoOrderVo order) {
        try {
            BaoxiaoShareBo share = createBaoxiaoShareBo(baoxiaoShareVo, dept, clientVo, projectVo, user);
            BaoxiaoShareVo vo = BeanUtil.toBean(share, BaoxiaoShareVo.class);
            BaoxiaoOrderBo bo = BeanUtil.toBean(order, BaoxiaoOrderBo.class);
            setOrderDeptShare(bo);

            successNum++;
            successMsg.append(share);
            successList.add(vo);
            baoxiaoShareService.insertByBo(share);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void setOrderDeptShare(BaoxiaoOrderBo bo){
        bo.setIsDeptShare(DeptShareEnum.TYPE_1.getKey());
        bo.setOrderStatus(OrderStatusEnum.status_2.getKey());
        baoxiaoOrderService.updateByBo(bo);
    }

    private BaoxiaoShareBo createBaoxiaoShareBo(BaoxiaoShareVo baoxiaoShareVo, SysDept dept, BaoxiaoClientVo clientVo, BaoxiaoProjectVo projectVo, SysUser user) {
        BaoxiaoShareBo share = BeanUtil.toBean(baoxiaoShareVo, BaoxiaoShareBo.class);
        share.setOrderId(orderId);
        share.setDeptId(dept.getDeptId());
        share.setDeptName(dept.getDeptName());
        share.setProjectId(projectVo.getId());
        share.setProjectName(projectVo.getName());
        share.setUserId(user != null ? user.getUserId() : 0L);
        share.setUserName(user != null ? user.getUserName() : "");
        share.setClientUnitId(clientVo != null ? clientVo.getClientId() : 0L);
        share.setClientUnitName(clientVo != null ? clientVo.getClientUnitName() : "");
        return share;
    }

    /**
     * 读取完成后被调用
     *
     * @param analysisContext 分析上下文对象
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
    }
}
