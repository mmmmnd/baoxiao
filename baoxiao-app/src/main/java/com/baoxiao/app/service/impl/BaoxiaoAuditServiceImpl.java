package com.baoxiao.app.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baoxiao.app.domain.bo.BaoxiaoOrderBo;
import com.baoxiao.app.domain.dto.BaoxiaoAuditEditDto;
import com.baoxiao.app.domain.vo.BaoxiaoOrderInfoVo;
import com.baoxiao.app.domain.vo.BaoxiaoOrderVo;
import com.baoxiao.app.enums.AuditTypeEnum;
import com.baoxiao.app.enums.OrderStatusEnum;
import com.baoxiao.common.core.domain.entity.SysDept;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baoxiao.common.utils.spring.SpringUtils;
import com.baoxiao.system.service.impl.SysDeptServiceImpl;
import com.baoxiao.system.service.impl.SysPostServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baoxiao.app.domain.bo.BaoxiaoAuditBo;
import com.baoxiao.app.domain.vo.BaoxiaoAuditVo;
import com.baoxiao.app.domain.BaoxiaoAudit;
import com.baoxiao.app.mapper.BaoxiaoAuditMapper;
import com.baoxiao.app.service.IBaoxiaoAuditService;

import java.util.*;

/**
 * 审批流Service业务层处理
 *
 * @author baoxiao
 * @date 2023-11-10
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoAuditServiceImpl implements IBaoxiaoAuditService {

    private final BaoxiaoAuditMapper baseMapper;

    private final SysDeptServiceImpl sysDeptService;

    private final SysPostServiceImpl sysPostService;

    /**
     * 查询审批流
     */
    @Override
    public BaoxiaoAuditVo queryById(Long auditId){
        return baseMapper.selectVoById(auditId);
    }

    /**
     * 查询审批流列表
     */
    @Override
    public TableDataInfo<BaoxiaoAuditVo> queryPageList(BaoxiaoAuditBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoAudit> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoAuditVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询审批流列表
     */
    @Override
    public List<BaoxiaoAuditVo> queryList(BaoxiaoAuditBo bo) {
        LambdaQueryWrapper<BaoxiaoAudit> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoAudit> buildQueryWrapper(BaoxiaoAuditBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoAudit> lqw = Wrappers.lambdaQuery();
        return lqw;
    }

    /**
     * 新增审批流
     */
    @Override
    public Boolean insertByBo(Long orderId, Long deptId) {
        Integer index = 0;
        List<BaoxiaoAudit> list = new ArrayList<>();
        SysDept sysDept = sysDeptService.selectDeptById(deptId);
        BaoxiaoOrderServiceImpl orderService = SpringUtils.getBean(BaoxiaoOrderServiceImpl.class);
        BaoxiaoOrderVo orderVo = orderService.queryById(orderId);

        do {
            String position = sysPostService.selectPostByUserId(sysDept.getUserId());

            BaoxiaoAudit build = BaoxiaoAudit.builder()
                .orderId(orderId)
                .userId(sysDept.getUserId())
                .userName(sysDept.getLeader())
                .activeNode(0)
                .node(++index)
                .position(position)
                .orderNum(orderVo.getOrderNum())
                .status(0)
                .remark("")
                .build();
            list.add(build);

            if(list.size() == 1){
                /*后期有需求可以根据pid按条件查找某个公司*/
                sysDept = sysDeptService.selectDeptById(106L);
                position = sysPostService.selectPostByUserId(sysDept.getUserId());

                list.add(BaoxiaoAudit.builder()
                            .orderId(orderId)
                            .userId(sysDept.getUserId())
                            .userName(sysDept.getLeader())
                            .activeNode(0)
                            .node(++index)
                            .position(position)
                            .orderNum(orderVo.getOrderNum())
                            .status(0)
                            .remark("")
                            .build());
            }

            sysDept = sysDeptService.selectDeptById(sysDept.getParentId());
        } while (sysDept.getParentId() != 0) ;

        Integer finalIndex = index;
        list.get(0).setActiveNode(1);
        list.forEach(audit -> audit.setMaxNode(finalIndex));

        return baseMapper.insertBatch(list);
    }

    /**
     * 修改审批流
     */
    @Override
    public Boolean updateByBo(BaoxiaoAuditEditDto dto) {
        BaoxiaoAudit audit = baseMapper.selectById(dto.getAuditId());
        audit.setActiveNode(AuditTypeEnum.TYPE_5.getKey());
        audit.setRemark(dto.getRemark());

        AuditTypeEnum byCode = AuditTypeEnum.getByCode(dto.getStatus());
        BaoxiaoOrderServiceImpl orderService = SpringUtils.getBean(BaoxiaoOrderServiceImpl.class);
        BaoxiaoOrderBo orderBo = new BaoxiaoOrderBo();
        orderBo.setOrderId(audit.getOrderId());

        /*同意*/
        if (Objects.requireNonNull(byCode) == AuditTypeEnum.TYPE_1) {
            audit.setStatus(AuditTypeEnum.TYPE_1.getKey());

            /*判断是否是最后一项*/
            if(!audit.getMaxNode().equals(audit.getNode()) ){
                baseMapper.updateById(audit);

                /*查找下一个审批节点置换为当前审批*/
                LambdaQueryWrapper<BaoxiaoAudit> lqw = Wrappers.lambdaQuery();
                lqw.eq(BaoxiaoAudit::getOrderId, audit.getOrderId());
                lqw.eq(BaoxiaoAudit::getNode, audit.getNode()+1);
                lqw.eq(BaoxiaoAudit::getOrderNum, audit.getOrderNum());

                audit = baseMapper.selectOne(lqw);
                audit.setActiveNode(AuditTypeEnum.TYPE_4.getKey());

                /*修改为正在审批*/
                orderBo.setOrderStatus(OrderStatusEnum.status_4.getKey());
            }else{
                /*修改为正在审批*/
                orderBo.setOrderStatus(OrderStatusEnum.status_5.getKey());
            }
        /*驳回*/
        } else if (byCode == AuditTypeEnum.TYPE_2) {
            audit.setStatus(AuditTypeEnum.TYPE_2.getKey());
            orderBo.setOrderStatus(OrderStatusEnum.status_6.getKey());
        }

        orderService.updateByBo(orderBo);
        return baseMapper.updateById(audit) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoAudit entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除审批流
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 获取个人审批流
     */
    @Override
    public TableDataInfo<BaoxiaoAuditVo> queryUserAduitList(PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoAudit> lqw = Wrappers.lambdaQuery();
        lqw.eq(BaoxiaoAudit::getActiveNode, 1);
        IPage<BaoxiaoAuditVo> baoxiaoAuditVoIPage = baseMapper.selectAuditVoPage(pageQuery.build(), lqw);

        return TableDataInfo.build(baoxiaoAuditVoIPage);
    }

    /**
     * 获取订单审批流
     */
    @Override
    public TableDataInfo<BaoxiaoAuditVo> queryOrderAuditList(Long orderId) {
        BaoxiaoOrderServiceImpl orderService = SpringUtils.getBean(BaoxiaoOrderServiceImpl.class);
        BaoxiaoOrderVo orderVo = orderService.queryById(orderId);

        LambdaQueryWrapper<BaoxiaoAudit> lqw = Wrappers.lambdaQuery();
        lqw.eq(BaoxiaoAudit::getOrderId,orderId);
        lqw.eq(BaoxiaoAudit::getOrderNum,orderVo.getOrderNum());
        List<BaoxiaoAuditVo> baoxiaoAuditVos = baseMapper.selectVoList(lqw);

        return TableDataInfo.build(baoxiaoAuditVos);
    }
}
