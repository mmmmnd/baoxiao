package com.baoxiao.app.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baoxiao.app.constant.baoxiaoConfigConstants;
import com.baoxiao.app.constant.baoxiaoConstants;
import com.baoxiao.app.domain.BaoxiaoCollection;
import com.baoxiao.app.domain.BaoxiaoFee;
import com.baoxiao.app.domain.BaoxiaoOrderFile;
import com.baoxiao.app.domain.dto.BaoxiaoOrderAddDto;
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
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

    /**
     * 查询订单
     */
    @Override
    public BaoxiaoOrderVo queryById(Long orderId){
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
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNumber()), BaoxiaoOrder::getOrderNumber, bo.getOrderNumber());
        lqw.eq(bo.getOrderType() != null, BaoxiaoOrder::getOrderType, bo.getOrderType());
        lqw.eq(bo.getOrderDate() != null, BaoxiaoOrder::getOrderDate, bo.getOrderDate());
        lqw.eq(bo.getBaoxiaoType() != null, BaoxiaoOrder::getBaoxiaoType, bo.getBaoxiaoType());
        lqw.eq(bo.getBaoxiaoSum() != null, BaoxiaoOrder::getBaoxiaoSum, bo.getBaoxiaoSum());
        lqw.eq(bo.getPaymentSum() != null, BaoxiaoOrder::getPaymentSum, bo.getPaymentSum());
        lqw.eq(bo.getOffsetLoanSum() != null, BaoxiaoOrder::getOffsetLoanSum, bo.getOffsetLoanSum());
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
        return lqw;
    }

    /**
     * 新增订单
     */

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean insertByBo(BaoxiaoOrderAddDto dto) {
        LoginUser loginUser = LoginHelper.getLoginUser();
        BaoxiaoOrder order = BeanUtil.toBean(dto, BaoxiaoOrder.class);

        /*批量添加费用明细*/
        Long feeId = IdWorker.getId();
        List<BaoxiaoFee> fees = dto.getFees();
        fees.forEach(fee -> fee.setFeeId(feeId));
        baoxiaoFeeService.batchInsertByList(fees);

        /*批量添加收款人信息*/
        Long collectionId = IdWorker.getId();
        List<BaoxiaoCollection> collections = dto.getCollections();
        collections.forEach(collection -> collection.setCollectionId(collectionId));
        baoxiaoCollectionService.batchInsertByList(collections);

        /*如果订单类型为空则为普通报销单*/
        if(order.getOrderType() == null){
            order.setOrderType(0);
        }

        String baoxiaoType = String.valueOf(dto.getBaoxiaoType());

        String userIdStr = String.valueOf(loginUser.getUserId());
        userIdStr = 19 == userIdStr.length()?userIdStr:String.format(baoxiaoConfigConstants.FORMAT_019, loginUser.getUserId());
        String userIdBore= StringUtils.substring(userIdStr, 1, 3);
        String userIdMiddle = StringUtils.substring(userIdStr, 9, 11);
        String userIdAfter = StringUtils.substring(userIdStr, 17, 19);
        String userId = userIdBore + userIdMiddle + userIdAfter;

        String atomicId = RedisUtils.getAtomicId(
            baoxiaoConstants.BAOXIAO_ORDER_ORDER_ID,
            Duration.ofSeconds(baoxiaoConfigConstants.EXPIRATION_TIME),
            baoxiaoConfigConstants.FORMAT_02,
            baoxiaoConfigConstants.DEFAULT_ATOMIC_VALUE);

        /*时间戳 + 业务类型 + 递增的数值 + 类用户ID*/
        String orderNumber = DateUtils.getTimestamp(true) + baoxiaoType + atomicId + userId;

        order.setOrderNumber(orderNumber);
        order.setUserName(loginUser.getUsername());
        order.setUserId(loginUser.getUserId());
        order.setOrderDate(DateUtils.getNowDate());
        order.setBaoxiaoSum(BigDecimal.ZERO);
        order.setPaymentSum(BigDecimal.ZERO);
        order.setOffsetLoanSum(BigDecimal.ZERO);
        order.setIsOffsetLoan(0);
        order.setIsDeptShare(0);
        order.setOrderStatus(0);
        order.setAuditId(0L);
        order.setFeeId(feeId);
        order.setCollectionId(collectionId);

        /* 插入订单数据获取id */
        boolean flag = baseMapper.insert(order) > 0;

        /**
         *
         * 查找出所有前端传过来的fileId然后讲orderId批量插入
         * 文件中未存在orderId的将进行批量删除
         */
        List<Long> fileIds = dto.getFileIds();
        List<BaoxiaoOrderFile> files = baoxiaoOrderFileService.btachQueryByIds(fileIds);
        files.forEach(file -> file.setOssId(order.getOrderId()));

        baoxiaoOrderFileService.batchUpdateByIds(files);
        baoxiaoOrderFileService.deleteWithValidByOrderId();

        return flag;
    }

    /**
     * 修改订单
     */
    @Override
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
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
