package com.baoxiao.app.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baoxiao.app.constant.ConfigConstants;
import com.baoxiao.app.constant.BaoxiaoConstants;
import com.baoxiao.app.domain.bo.BaoxiaoOrderSumBo;
import com.baoxiao.app.domain.dto.BaoxiaoOffsetLoanDto;
import com.baoxiao.app.domain.dto.BaoxiaoOrderOffsetLoanDto;
import com.baoxiao.app.enums.*;
import com.baoxiao.app.domain.BaoxiaoCollection;
import com.baoxiao.app.domain.BaoxiaoFee;
import com.baoxiao.app.domain.dto.BaoxiaoOrderAddDto;
import com.baoxiao.app.domain.dto.BaoxiaoOrderEditDto;
import com.baoxiao.app.domain.vo.BaoxiaoOrderInfoVo;
import com.baoxiao.common.annotation.CacheBatchEvict;
import com.baoxiao.common.core.domain.model.LoginUser;
import com.baoxiao.common.core.page.TableDataInfo;
import com.baoxiao.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baoxiao.common.helper.LoginHelper;
import com.baoxiao.common.utils.DateUtils;
import com.baoxiao.common.utils.StringUtils;
import com.baoxiao.common.utils.redis.RedisUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import com.baoxiao.app.domain.bo.BaoxiaoOrderBo;
import com.baoxiao.app.domain.vo.BaoxiaoOrderVo;
import com.baoxiao.app.domain.BaoxiaoOrder;
import com.baoxiao.app.mapper.BaoxiaoOrderMapper;
import com.baoxiao.app.service.IBaoxiaoOrderService;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Duration;
import java.util.*;

/**
 * 订单Service业务层处理
 *
 * @author baoxiao
 * @date 2023-09-12
 */
@RequiredArgsConstructor
@Service
public class BaoxiaoOrderServiceImpl implements IBaoxiaoOrderService {

    private final BaoxiaoOrderMapper baseMapper;

    private final BaoxiaoFeeServiceImpl baoxiaoFeeService;

    private final BaoxiaoCollectionServiceImpl baoxiaoCollectionService;

    private final BaoxiaoOrderFileServiceImpl baoxiaoOrderFileService;

    private final BaoxiaoAuditServiceImpl baoxiaoAuditService;

    private final BaoxiaoOrderSumServiceImpl baoxiaoOrderSumService;


    /**
     * 查询订单
     */
    @Override
    @Cacheable(cacheNames = BaoxiaoConstants.BAOXIAO_ORDER_ORDER_ID, key = "#orderId", condition = "#orderId != null")
    public BaoxiaoOrderInfoVo queryInfoById(Long orderId){
        return baseMapper.selectOrderInfoById(orderId);
    }

    /**
     * 通过订单id查找
     */
    @Override
    public BaoxiaoOrderVo queryById(Long orderId) {
        return baseMapper.selectVoById(orderId);
    }

    /**
     * 查询订单列表
     */
    @Override
    public TableDataInfo<BaoxiaoOrderVo> queryPageList(BaoxiaoOrderBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BaoxiaoOrder> lqw = buildQueryWrapper(bo);
        Page<BaoxiaoOrderVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询订单列表
     */
    @Override
    public List<BaoxiaoOrderVo> queryList(BaoxiaoOrderBo bo) {
        LambdaQueryWrapper<BaoxiaoOrder> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BaoxiaoOrder> buildQueryWrapper(BaoxiaoOrderBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BaoxiaoOrder> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getOrderNumber() != null , BaoxiaoOrder::getOrderNumber, bo.getOrderNumber());
        lqw.eq(bo.getOrderType() != null, BaoxiaoOrder::getOrderType, bo.getOrderType());
        lqw.eq(bo.getOrderDate() != null, BaoxiaoOrder::getOrderDate, bo.getOrderDate());
        lqw.eq(bo.getBaoxiaoType() != null, BaoxiaoOrder::getBaoxiaoType, bo.getBaoxiaoType());
        lqw.eq(bo.getTotalAmount() != null, BaoxiaoOrder::getTotalAmount, bo.getTotalAmount());
        lqw.eq(bo.getCollectionId() != null, BaoxiaoOrder::getCollectionId, bo.getCollectionId());
        lqw.eq(bo.getIsOffsetLoan() != null, BaoxiaoOrder::getIsOffsetLoan, bo.getIsOffsetLoan());
        lqw.eq(bo.getIsDeptShare() != null, BaoxiaoOrder::getIsDeptShare, bo.getIsDeptShare());
        lqw.eq(bo.getOrderStatus() != null, BaoxiaoOrder::getOrderStatus, bo.getOrderStatus());
        lqw.eq(bo.getUserId() != null, BaoxiaoOrder::getUserId, bo.getUserId());
        lqw.eq(bo.getBaoxiaoUserId() != null, BaoxiaoOrder::getBaoxiaoUserId, bo.getBaoxiaoUserId());
        lqw.eq(bo.getDeptId() != null, BaoxiaoOrder::getDeptId, bo.getDeptId());
        lqw.eq(bo.getCompanyId() != null, BaoxiaoOrder::getCompanyId, bo.getCompanyId());
        lqw.eq(bo.getClientId() != null, BaoxiaoOrder::getClientId, bo.getClientId());
        lqw.eq(bo.getAuditId() != null, BaoxiaoOrder::getAuditId, bo.getAuditId());
        lqw.orderByDesc(BaoxiaoOrder::getOrderId);

        return lqw;
    }

    /**
     * 新增订单
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean insertOrder(BaoxiaoOrderAddDto dto) {
        BigDecimal baoxiaoSum = BigDecimal.ZERO;
        Long feeId = IdWorker.getId();
        Long collectionId = IdWorker.getId();
        List<BaoxiaoFee> fees = dto.getFees();
        List<BaoxiaoCollection> collections = dto.getCollections();

        LoginUser loginUser = LoginHelper.getLoginUser();
        BaoxiaoOrder order = BeanUtil.toBean(dto, BaoxiaoOrder.class);
        BaoxiaoTypeEnum type = BaoxiaoTypeEnum.fromKey(dto.getBaoxiaoType());

        /*如果订单类型为空则为普通报销单*/
        if(order.getOrderType() == null){
            order.setOrderType(OrderTypeEnum.TYPE_0.getKey());
        }

        /*出差人数不存在则为 “” */
        if(order.getPersonnels() == null){
            order.setPersonnels("");
        }

        /*批量添加收款人信息*/
        if (order.getBaoxiaoType() != BaoxiaoTypeEnum.TYPE_4.getKey()) {
            collections.forEach(collection -> {
                collection.setCollectionId(collectionId);
                if (order.getBaoxiaoType() == BaoxiaoTypeEnum.TYPE_2.getKey()) {
                    collection.setCollectionSum(BigDecimal.ZERO);
                }
            });
            baoxiaoCollectionService.batchInsertByList(collections);
        }

        /*批量添加费用明细*/
        if (Arrays.asList(BaoxiaoTypeEnum.TYPE_0, BaoxiaoTypeEnum.TYPE_1, BaoxiaoTypeEnum.TYPE_4).contains(type)) {
            baoxiaoSum = fees.stream()
                .peek(fee -> fee.setFeeId(feeId))
                .map(BaoxiaoFee::getBaoxiaoSum)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
            baoxiaoFeeService.batchInsertByList(fees);
        }

        /*设置订单的收款人ID、费用明细ID和总金额*/
        order.setCollectionId(order.getBaoxiaoType() != BaoxiaoTypeEnum.TYPE_4.getKey() ? collectionId : 0L);
        order.setFeeId((Arrays.asList(BaoxiaoTypeEnum.TYPE_2, BaoxiaoTypeEnum.TYPE_3, BaoxiaoTypeEnum.TYPE_5).contains(type)) ? 0L : feeId);

        order.setEditableTotalAmount(order.getBaoxiaoType() == BaoxiaoTypeEnum.TYPE_2.getKey() ? order.getTotalAmount() : baoxiaoSum);
        order.setTotalAmount((Arrays.asList(BaoxiaoTypeEnum.TYPE_3, BaoxiaoTypeEnum.TYPE_5).contains(type) ? order.getTotalAmount() : baoxiaoSum));

        String baoxiaoType = String.valueOf(dto.getBaoxiaoType());
        String userIdStr = String.valueOf(loginUser.getUserId());
        userIdStr = ConfigConstants.USER_ID_LENGTH == userIdStr.length()
            ?userIdStr
            :String.format(ConfigConstants.FORMAT_019, loginUser.getUserId());
        String userIdBore= StringUtils.substring(userIdStr, 1, 3);
        String userIdMiddle = StringUtils.substring(userIdStr, 9, 11);
        String userIdAfter = StringUtils.substring(userIdStr, 17, 19);
        String userId = userIdBore + userIdMiddle + userIdAfter;

        String atomicId = RedisUtils.getAtomicId(
            BaoxiaoConstants.BAOXIAO_ORDER_ORDER_QUANTITY,
            Duration.ofSeconds(ConfigConstants.EXPIRATION_TIME),
            ConfigConstants.FORMAT_02,
            ConfigConstants.DEFAULT_ATOMIC_VALUE);

        /*时间戳 + 业务类型 + 递增的数值 + 类用户ID*/
        Long orderNumber = Long.valueOf( DateUtils.getTimestamp(true) + baoxiaoType + atomicId + userId);

        order.setOrderNum(0);
        order.setOrderNumber(orderNumber);
        order.setUserName(loginUser.getUsername());
        order.setUserId(loginUser.getUserId());
        order.setOrderDate(DateUtils.getNowDate());
        order.setIsOffsetLoan(OffsetLoanEnum.TYPE_0.getKey());
        order.setIsDeptShare(DeptShareEnum.TYPE_0.getKey());
        order.setOrderStatus(0);
        order.setAuditId(0L);

        /* 插入订单数据获取id */
        boolean flag = baseMapper.insert(order) > 0;

        /**
         * 查找出所有前端传过来的fileId然后讲orderId批量插入
         * 文件中未存在orderId的将进行批量删除
         */
        baoxiaoOrderFileService.batchUpdaeDeleteByOrderId(dto.getFileIds(),order.getOrderId());

        return flag;
    }

    /**
     * 修改订单
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(cacheNames = BaoxiaoConstants.BAOXIAO_ORDER_ORDER_ID, key = "#dto.getOrderId", condition = "#dto.getOrderId != null")
    public Boolean updateOrder(BaoxiaoOrderEditDto dto) {
        BigDecimal baoxiaoSum = BigDecimal.ZERO;
        BaoxiaoOrder order = BeanUtil.toBean(dto, BaoxiaoOrder.class);
        BaoxiaoOrder baoxiaoOrder = baseMapper.selectById(order.getOrderId());
        Integer baoxiaoType = baoxiaoOrder.getBaoxiaoType();

        if(baoxiaoOrder.getDelFlag() == 2){
            throw new RuntimeException("订单不存在！");
        }

        /*删除旧费用明细*/
        Long feeId = baoxiaoOrder.getFeeId();
        List<Long> feeIds = Collections.singletonList(feeId);
        baoxiaoFeeService.deleteWithValidByIds(feeIds, false);

        /*删除收款人信息*/
        Long collectionId = baoxiaoOrder.getCollectionId();
        List<Long> collectionIds = Collections.singletonList(collectionId);
        baoxiaoCollectionService.deleteWithValidByIds(collectionIds, false);

        /**
         * 查找出所有前端传过来的fileId然后讲orderId批量插入
         * 文件中未存在orderId的将进行批量删除
         */
        baoxiaoOrderFileService.batchUpdaeDeleteByOrderId(dto.getFileIds(),baoxiaoOrder.getOrderId());

        /*批量添加费用明细*/
        List<BaoxiaoFee> fees = dto.getFees();
        baoxiaoSum = fees.stream()
            .peek(fee -> fee.setFeeId(feeId))
            .map(BaoxiaoFee::getBaoxiaoSum)
            .reduce(BigDecimal.ZERO, BigDecimal::add);
        order.setTotalAmount(baoxiaoSum);
        order.setEditableTotalAmount(baoxiaoSum);
        baoxiaoFeeService.batchInsertByList(fees);

        /*批量添加收款人信息*/
        List<BaoxiaoCollection> collections = dto.getCollections();
        collections.forEach(collection -> {
            collection.setCollectionId(collectionId);
            if(baoxiaoType == 2){
                collection.setCollectionSum(BigDecimal.ZERO);
            }
        });
        baoxiaoCollectionService.batchInsertByList(collections);

        return baseMapper.updateById(order) > 0;
    }

    /**
     * 修改订单
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(cacheNames = BaoxiaoConstants.BAOXIAO_ORDER_ORDER_ID, key = "#bo.getOrderId", condition = "#bo.getOrderId != null")
    public Boolean updateByBo(BaoxiaoOrderBo bo) {
        BaoxiaoOrder update = BeanUtil.toBean(bo, BaoxiaoOrder.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BaoxiaoOrder entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除订单
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheBatchEvict(value = BaoxiaoConstants.BAOXIAO_ORDER_ORDER_ID, key = "#ids")
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }

        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 提交订单
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean insertOrderAudit(Long orderId) {
        BaoxiaoOrder order = baseMapper.selectById(orderId);
        order.setOrderNum(order.getOrderNum()+1);
        order.setOrderStatus(OrderStatusEnum.status_3.getKey());

        /*生成审批流*/
        baoxiaoAuditService.insertByBo(order.getOrderId(),order.getDeptId());
        return baseMapper.updateById(order) > 0;
    }

    /**
     * 获取已审批完毕借款
     */
    @Override
    public TableDataInfo<BaoxiaoOrderVo> orderUserBorrow() {
        LambdaQueryWrapper<BaoxiaoOrder> eq = Wrappers.<BaoxiaoOrder>lambdaQuery()
            .gt(BaoxiaoOrder::getTotalAmount, 0)
            .eq(BaoxiaoOrder::getBaoxiaoType, BaoxiaoTypeEnum.TYPE_2.getKey())
            .eq(BaoxiaoOrder::getOrderStatus, OrderStatusEnum.status_5.getKey());

        List<BaoxiaoOrderVo> result = baseMapper.selectVoList(eq);
        return TableDataInfo.build(result);
    }

    /**
     * 核销冲销借款
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheBatchEvict(value = BaoxiaoConstants.BAOXIAO_ORDER_ORDER_ID, key = "#ids" )
    public Boolean writeOffLoans(BaoxiaoOrderOffsetLoanDto dto, Collection<Long> ids) {
        BaoxiaoOrderVo orderVo = queryById(dto.getOrderId());
        BaoxiaoOrderBo orderBo = BeanUtil.toBean(orderVo, BaoxiaoOrderBo.class);

        List<BaoxiaoOffsetLoanDto> offsetLoanDto = dto.getOffsetLoans();
        BigDecimal offsetLoanSum = offsetLoanDto.stream()
            .map(item -> {
                BaoxiaoOrderVo offsetLoanVo = queryById(item.getOrderId());
                BaoxiaoOrderBo offsetLoanBo = BeanUtil.toBean(offsetLoanVo, BaoxiaoOrderBo.class);

                int compareTo = item.getOffsetLoanSum().compareTo(offsetLoanBo.getEditableTotalAmount());
                if (compareTo == 1) {
                    throw new RuntimeException("冲销金额不能大于剩余金额！");
                }

                //剩余金额减去冲借款金额
                BigDecimal sum = offsetLoanBo.getEditableTotalAmount().subtract(item.getOffsetLoanSum());

                offsetLoanBo.setEditableTotalAmount(sum);
                offsetLoanBo.setIsOffsetLoan(OffsetLoanEnum.TYPE_1.getKey());

                updateByBo(offsetLoanBo);

                BaoxiaoOrderSumBo offLoanOrderSumBo = new BaoxiaoOrderSumBo();

                if (compareTo > 0){
                    offLoanOrderSumBo.setPaymentSum(sum);
                    offLoanOrderSumBo.setRepaymentSum(BigDecimal.ZERO);
                } else {
                    offLoanOrderSumBo.setPaymentSum(BigDecimal.ZERO);
                    offLoanOrderSumBo.setRepaymentSum(sum);
                }

                offLoanOrderSumBo.setPaymentSum(sum);
                offLoanOrderSumBo.setOrderId(orderBo.getOrderId());
                offLoanOrderSumBo.setOffsetLoanSum(item.getOffsetLoanSum());

                baoxiaoOrderSumService.insertByBo(offLoanOrderSumBo);

                return item.getOffsetLoanSum();
            })
            .reduce(BigDecimal.ZERO, BigDecimal::add);

        BigDecimal sum = orderBo.getTotalAmount().subtract(offsetLoanSum);
        int compareTo = sum.compareTo(BigDecimal.ZERO);

        orderBo.setEditableTotalAmount(sum);
        orderBo.setIsOffsetLoan(OffsetLoanEnum.TYPE_1.getKey());
        orderBo.setOrderStatus(OrderStatusEnum.status_1.getKey());

        BaoxiaoOrderSumBo orderSumBo = new BaoxiaoOrderSumBo();
        orderSumBo.setOrderId(orderBo.getOrderId());
        orderSumBo.setOffsetLoanSum(offsetLoanSum);

        if (compareTo > 0){
            orderSumBo.setPaymentSum(sum);
            orderSumBo.setRepaymentSum(BigDecimal.ZERO);
        } else {
            orderSumBo.setPaymentSum(BigDecimal.ZERO);
            orderSumBo.setRepaymentSum(sum);
        }

        baoxiaoOrderSumService.insertByBo(orderSumBo);

        return updateByBo(orderBo);
    }
}
