<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单编号" prop="orderNumber">
        <el-input v-model="queryParams.orderNumber" placeholder="请输入订单编号" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="订单日期" prop="orderDate">
        <el-date-picker clearable v-model="queryParams.orderDate" type="date" value-format="YYYY-MM-DD"
                        placeholder="请选择订单日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="制单人" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入制单人id" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="报销类型" prop="baoxiaoType">
        <el-select v-model="queryParams.baoxiaoType" placehol0der="订单类型" clearable style="width: 240px">
          <el-option v-for="dict in order_baoxiao_type" :key="dict.value" :label="dict.label" :value="dict.value"/>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd('新增报销单', 0)"
                   v-hasPermi="['app:order:add']">新增报销单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd('新增差旅费报销单', 1)"
                   v-hasPermi="['app:order:add']">新增差旅费报销单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd('新增借款', 2)"
                   v-hasPermi="['app:order:add']">新增借款</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd('新增保证金', 3)"
                   v-hasPermi="['app:order:add']">新增保证金</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd('新增调整单据', 4)"
                   v-hasPermi="['app:order:add']">新增调整单据</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd('新增付款申请', 5)"
                   v-hasPermi="['app:order:add']">新增付款申请</el-button>
      </el-col>
    </el-row>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
                   v-hasPermi="['app:order:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
                   v-hasPermi="['app:order:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
                   v-hasPermi="['app:order:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单id" align="center" prop="orderId" v-if="true" />
      <el-table-column label="订单编号" align="center" prop="orderNumber" />
      <el-table-column label="订单类型" align="center" prop="orderTypeName" />
      <el-table-column label="订单日期" align="center" prop="orderDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.orderDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="申请类型" align="center" prop="baoxiaoTypeName" />
      <el-table-column label="冲借款" align="center" prop="isOffsetLoanName" />
      <el-table-column label="部门分摊" align="center" prop="isDeptShareName" />
      <el-table-column label="状态 " align="center" prop="orderStatusName" />
      <el-table-column label="制单人" align="center" prop="userName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="CreditCard" @click="handleOffsetLoan(scope.row)"
                     v-hasPermi="['app:order:remove']" :disabled="scope.row.orderStatus != 0 || scope.row.baoxiaoType == 2 || scope.row.isOffsetLoan == 1 || scope.row.isDeptShare == 1">冲借款</el-button>
          <el-button link type="primary" icon="Coin" @click="handleShare(scope.row)"
                     v-hasPermi="['app:order:remove']" :disabled="scope.row.orderStatus != 0 || scope.row.baoxiaoType == 2 || scope.row.isOffsetLoan == 1 || scope.row.isDeptShare == 1">分摊</el-button>
          <el-button link type="primary" icon="Tickets" @click="handleAudit(scope.row)"
                     v-hasPermi="['app:audit:list']" :disabled="scope.row.orderStatus == 0">审批进度</el-button>
          <el-button link type="primary" icon="Coin" @click="handleSubmit(scope.row)"
                     v-hasPermi="['app:order:remove']" :disabled="scope.row.orderStatus != 0 && scope.row.orderStatus != 6">提交</el-button>
          <el-button link type="primary" icon="View" @click="handleView(scope.row)">详情</el-button>
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                     v-hasPermi="['app:order:edit']" :disabled="scope.row.orderStatus != 0 && scope.row.orderStatus != 6">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
                     v-hasPermi="['app:order:remove']" :disabled="scope.row.orderStatus != 0">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改订单对话框 -->
    <el-dialog :title="title" v-model="open" width="40%" append-to-body>
      <el-form :model="form" :rules="rules" label-width="100px" ref="orderRef">
        <el-container>
          <el-header>
            <el-divider content-position="left">明细</el-divider>
          </el-header>
          <el-main>
            <el-row :gutter="10" class="mb8">
              <el-col :span="12">
                <el-form-item label="申请公司：" prop="companyId">
                  <select-more keyName="companyName" value="companyId" label="companyName" v-model="form.companyId"
                               url="app/company/list"  :pageSize="2"/>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="客商：" prop="clientId">
                  <select-more keyName="clientUnitName" value="clientId" label="clientUnitName" v-model="form.clientId"
                               url="/app/client/list" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="申请人员：" prop="baoxiaoUserId">
                  <select-more @change="selectMoreClone" keyName="nickName" value="userId" label="nickName"
                               v-model="form.baoxiaoUserId" url="/system/user/list" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="申请部门：">
                  {{ form.deptName ?? "暂无部门信息" }}
                </el-form-item>
              </el-col>

              <el-col :span="12">
                <el-form-item :label="typeText" prop="totalAmount">
                  <el-input-number v-model="form.totalAmount" :min="0" controls-position="right" size="large"
                                   :placeholder="'请选择'+typeText" style="margin-right: 10px" />
                  <span>元</span>
                </el-form-item>
              </el-col>

              <el-col :span="12" v-if="form.baoxiaoType == 1">
                  <el-form-item label="出差人员：" prop="personnels">
                    <el-input type="text" v-model="form.personnels" placeholder="请填写出差人员" />
                  </el-form-item>
              </el-col>

              <el-col :span="12" v-if="form.baoxiaoType == 5">
                <el-form-item label="订单类型：" prop="orderType">
                  <el-select v-model="form.orderType" placeholder="订单类型" clearable style="width: 240px">
                    <el-option v-for="dict in order_type" :key="dict.value" :label="dict.label" :value="dict.value"/>
                  </el-select>
                </el-form-item>
              </el-col>

              <el-col :span="24">
                <el-form-item label="事由：">
                  <el-input v-model="form.remark" :autosize="{ minRows: 2, maxRows: 4 }" type="textarea"
                            placeholder="请填写相关事由" />
                </el-form-item>
              </el-col>
            </el-row>
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType == 2">
          <el-header>
            <el-divider content-position="left">收款人信息</el-divider>
          </el-header>
          <el-main>
            <el-row :gutter="10" class="mb8">
              <el-col :span="12">
                <el-form-item label="收款人：" prop="collectionUser">
                  <el-input type="text" v-model="form.collectionUser" placeholder="请填写收款人姓名" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="银行卡号：" prop="collectionBank">
                  <el-input type="text" v-model="form.collectionBank" placeholder="请填写银行卡号" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="银行名称：" prop="collectionBankName">
                  <el-input type="text" v-model="form.collectionBankName" placeholder="请填写银行名称" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="开户行：" prop="collectionBankAddress">
                  <el-input v-model="form.collectionBankAddress" placeholder="请填写开户行" />
                </el-form-item>
              </el-col>
            </el-row>
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType != 2 && form.baoxiaoType != 4">
          <el-header>
            <el-divider content-position="left">收款人信息</el-divider>
          </el-header>
          <el-main>
            <edit-table v-model:data="collectionData" :list="collectionList" ref="collectionRef" />
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType == 0  || form.baoxiaoType == 4">
          <el-header>
            <el-divider content-position="left">费用明细</el-divider>
          </el-header>
          <el-main>
            <edit-table v-model:data="feeData" :list="feeList" :projectData="projectData" ref="feeRef" />
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType == 1">
          <el-header>
            <el-divider content-position="left">费用明细</el-divider>
          </el-header>
          <el-main>
            <edit-table v-model:data="feeData" :list="feePersonnelList" :projectData="projectData" ref="feePersonnelRef" />
          </el-main>
        </el-container>

        <el-container>
          <el-header>
            <el-divider content-position="left">附件列表</el-divider>
          </el-header>
          <el-main>
            <order-file v-model:data="fileData" />
          </el-main>
        </el-container>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 冲借款 -->
    <el-dialog :title="title" v-model="openCreditCard" width="40%" append-to-body>
      <el-form :model="form" :rules="rules" label-width="100px">
        <el-container>
          <el-header>
            <el-divider content-position="left">冲借款</el-divider>
          </el-header>
          <el-main>
            <el-row :gutter="10" class="mb8">
              <el-col :span="12">
                <el-form-item label="金额合计："  prop="totalAmount">
                  <el-input type="text" v-model="form.totalAmount" placeholder="请填写金额合计" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="冲销金额："  prop="offsetLoanSum">
                  <el-input type="text" v-model="form.offsetLoanSum" placeholder="请填写冲销金额" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="还款金额：">
                  <el-input type="text" v-model="form.repaymentSum" placeholder="请填写还款金额" disabled/>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="支付金额:">
                  <el-input v-model="form.paymentSum" placeholder="请填写支付金额" disabled/>
                </el-form-item>
              </el-col>
            </el-row>
          </el-main>
        </el-container>
        <el-container>
          <el-main>
            <el-button type="primary" @click="showOffsetLoan()">冲销借款</el-button>
          </el-main>
        </el-container>
        <el-container>
          <el-header>
            <el-divider content-position="left">费用明细</el-divider>
          </el-header>
          <el-main>
            <el-table :data="feeData">
              <el-table-column label="收支项目" align="center" prop="feeItem" />
              <el-table-column label="申请金额" align="center" prop="baoxiaoSum" />
              <el-table-column label="税率%" align="center" prop="taxRate" />
              <el-table-column label="进项税额（专票）" align="center" prop="specialRicket" />
            </el-table>
          </el-main>
        </el-container>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitCreditCard">确 定</el-button>
          <el-button @click="cancelCreditCard">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 审批进度 -->
    <el-dialog :title="title" v-model="openAudit" width="40%" append-to-body>
      <el-table v-loading="loading" :data="AuditData">
        <el-table-column label="职位" align="center" prop="position" />
        <el-table-column label="用户名" align="center" prop="userName"/>
        <el-table-column label="状态" align="center" prop="statusName" />
        <el-table-column label="备注" align="center" prop="remark" />
      </el-table>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="openAudit = false">确 定</el-button>
          <el-button @click="openAudit = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 冲借款列表 -->
    <el-dialog :title="title" v-model="openOffsetLoan" width="40%" append-to-body>
      <el-container>
        <el-main>
          <el-table :data="offsetLoanData"  @selection-change="handleSelectionOffsetLoan">
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column label="订单编号" align="center" prop="orderNumber" />
            <el-table-column label="订单日期" align="center" prop="orderDate" />
            <el-table-column label="金额合计" align="center" prop="totalAmount" />
            <el-table-column label="剩余金额" align="center" prop="editableTotalAmount" />
            <el-table-column label="冲借款金额" align="center" prop="offsetLoanSum" >
              <template #default="{ row, $index }">
                <el-input-number @blur="offsetLoanSumEdit(row, $index)" placeholder="请输入冲借款金额" v-model="row.offsetLoanSum" :min="0" size="small" controls-position="right"/>
              </template>
            </el-table-column>
          </el-table>
        </el-main>
      </el-container>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitOffsetLoan">确 定</el-button>
          <el-button @click="openOffsetLoan = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 分摊导入 -->
    <el-dialog :title="upload.title" v-model="upload.open" width="400px" append-to-body>
      <el-upload
        ref="uploadRef"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :data="{orderId:form.orderId}"
        :action="upload.url"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <el-icon class="el-icon--upload"><upload-filled /></el-icon>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <template #tip>
          <div class="el-upload__tip text-center">
            <span>仅允许导入xls、xlsx格式文件。</span>
            <el-row justify="center">
              <el-link :href="clientUnitImportTemplate" target="_blank">客商分摊模板&nbsp;&nbsp;</el-link>
              <el-link :href="userImportTemplate" target="_blank">人员分摊模板&nbsp;&nbsp;</el-link>
              <el-link :href="deptImportTemplate" target="_blank">部门分摊模板</el-link>
            </el-row>
          </div>
        </template>
      </el-upload>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitFileForm">确 定</el-button>
          <el-button @click="upload.open = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <!-- 详情 -->
    <el-dialog :title="title" v-model="openView" width="40%" append-to-body>
      <el-form :model="form" :rules="rules" label-width="100px" ref="orderRef" :disabled="true">
        <el-container>
          <el-header>
            <el-divider content-position="left">明细</el-divider>
          </el-header>
          <el-main>
            <el-row :gutter="10" class="mb8">
              <el-col :span="12">
                <el-form-item label="申请公司：" prop="companyId">
                  <select-more keyName="companyName" value="companyId" label="companyName" v-model="form.companyId"
                               url="app/company/list" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="客商：" prop="clientId">
                  <select-more keyName="clientUnitName" value="clientId" label="clientUnitName" v-model="form.clientId"
                               url="/app/client/list" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="申请人员：" prop="baoxiaoUserId">
                  <select-more @change="selectMoreClone" keyName="nickName" value="userId" label="nickName"
                               v-model="form.baoxiaoUserId" url="/system/user/list" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="申请部门：">
                  {{ form.deptName ?? "暂无部门信息" }}
                </el-form-item>
              </el-col>

              <el-col :span="12">
                <el-form-item :label="typeText" prop="totalAmount">
                  <el-input-number v-model="form.totalAmount" :min="0" controls-position="right" size="large"
                                   :placeholder="'请选择'+typeText" style="margin-right: 10px" />
                  <span>元</span>
                </el-form-item>
              </el-col>

              <el-col :span="12" v-if="form.baoxiaoType == 1">
                <el-form-item label="出差人员：" prop="personnels">
                  <el-input type="text" v-model="form.personnels" placeholder="请填写出差人员" />
                </el-form-item>
              </el-col>

              <el-col :span="12" v-if="form.baoxiaoType == 5">
                <el-form-item label="订单类型：" prop="orderType">
                  <el-select v-model="form.orderType" placeholder="订单类型" clearable style="width: 240px">
                    <el-option v-for="dict in order_type" :key="dict.value" :label="dict.label" :value="dict.value"/>
                  </el-select>
                </el-form-item>
              </el-col>

              <el-col :span="24">
                <el-form-item label="事由：">
                  <el-input v-model="form.remark" :autosize="{ minRows: 2, maxRows: 4 }" type="textarea"
                            placeholder="请填写相关事由" />
                </el-form-item>
              </el-col>
            </el-row>
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType == 2">
          <el-header>
            <el-divider content-position="left">收款人信息</el-divider>
          </el-header>
          <el-main>
            <el-row :gutter="10" class="mb8">
              <el-col :span="12">
                <el-form-item label="收款人：" prop="collectionUser">
                  <el-input type="text" v-model="form.collectionUser" placeholder="请填写收款人姓名" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="银行卡号：" prop="collectionBank">
                  <el-input type="text" v-model="form.collectionBank" placeholder="请填写银行卡号" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="银行名称：" prop="collectionBankName">
                  <el-input type="text" v-model="form.collectionBankName" placeholder="请填写银行名称" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="开户行：" prop="collectionBankAddress">
                  <el-input v-model="form.collectionBankAddress" placeholder="请填写开户行" />
                </el-form-item>
              </el-col>
            </el-row>
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType != 2 && form.baoxiaoType != 4">
          <el-header>
            <el-divider content-position="left">收款人信息</el-divider>
          </el-header>
          <el-main>
            <edit-table v-model:data="collectionData" :list="collectionList" ref="collectionRef" />
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType == 0  || form.baoxiaoType == 4">
          <el-header>
            <el-divider content-position="left">费用明细</el-divider>
          </el-header>
          <el-main>
            <edit-table v-model:data="feeData" :list="feeList" :projectData="projectData" ref="feeRef" />
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType == 1">
          <el-header>
            <el-divider content-position="left">费用明细</el-divider>
          </el-header>
          <el-main>
            <edit-table v-model:data="feeData" :list="feePersonnelList" :projectData="projectData" ref="feePersonnelRef" />
          </el-main>
        </el-container>

        <el-container>
          <el-header>
            <el-divider content-position="left">附件列表</el-divider>
          </el-header>
          <el-main>
            <order-file v-model:data="fileData" />
          </el-main>
        </el-container>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="openView = false">确 定</el-button>
          <el-button @click="openView = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Order">
import {
  listOrder,
  getOrder,
  delOrder,
  addOrder,
  updateOrder,
  orderAudit,
  orderUserBorrow,
  orderWriteOffLoans
} from "@/api/app/order";
import { getProjectList } from "@/api/app/project";
import { getOrderAuditList } from "@/api/app/audit";
import SelectMore from "@/components/SelectMore/index.vue";
import EditTable from "@/views/component/editTable/index.vue";
import OrderFile from "@/views/component/orderFile/index.vue";

import useUserStore from "@/store/modules/user";
import {getToken} from "@/utils/auth";

const userStore = useUserStore();
const { proxy } = getCurrentInstance();
const { order_type } = proxy.useDict("order_type");
const { order_baoxiao_type } = proxy.useDict("order_baoxiao_type");

const offsetLoanFlag = ref(false);
const orderList = ref([]);
const open = ref(false);
const buttonLoading = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const feeRef = ref("feeRef");
const collectionRef = ref("collectionRef");
const feePersonnelRef = ref("feePersonnelRef");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    orderNumber: undefined,
    orderType: undefined,
    orderDate: undefined,
    baoxiaoType: undefined,
    repaymentSum: undefined,
    paymentSum: undefined,
    offsetLoanSum: undefined,
    totalAmount: undefined,
    editableTotalAmount: undefined,
    collectionId: undefined,
    feeId: undefined,
    isOffsetLoan: undefined,
    isDeptShare: undefined,
    orderStatus: undefined,
    userId: undefined,
    baoxiaoUserId: undefined,
    deptId: undefined,
    deptName: undefined,
    companyId: undefined,
    clientId: undefined,
    auditId: undefined,
    collectionSum: undefined,
    collectionUser: undefined,
    collectionBank: undefined,
    collectionBankName: undefined,
    collectionBankAddress: undefined
  },
  rules: {
    orderId: [{ required: true, message: "订单id不能为空", trigger: "blur" }],
    orderNumber: [
      { required: true, message: "订单编号不能为空", trigger: "blur" },
    ],
    orderType: [
      { required: true, message: "订单类型不能为空", trigger: "change" },
    ],
    orderDate: [
      { required: true, message: "订单日期不能为空", trigger: "blur" },
    ],
    baoxiaoType: [
      { required: true, message: "申请类型不能为空", trigger: "change" },
    ],
    repaymentSum: [
      { required: true, message: "申请金额不能为空", trigger: "blur" },
    ],
    paymentSum: [
      { required: true, message: "支付金额不能为空", trigger: "blur" },
    ],
    offsetLoanSum: [
      { required: true, message: "冲借款金额不能为空", trigger: "blur" },
    ],
    totalAmount: [
      { required: true, message: "金额合计不能为空", trigger: "blur" },
    ],
    editableTotalAmount: [
      { required: true, message: "冲借款金额不能为空", trigger: "blur" },
    ],
    collectionId: [
      { required: true, message: "收款人不能为空", trigger: "blur" },
    ],
    feeId: [{ required: true, message: "费用明细不能为空", trigger: "blur" }],
    isOffsetLoan: [
      {
        required: true,
        message: "冲借款 (0 未冲 1已冲)不能为空",
        trigger: "blur",
      },
    ],
    isDeptShare: [
      {
        required: true,
        message: "部门分摊 (0末分 1已分)不能为空",
        trigger: "blur",
      },
    ],
    orderStatus: [
      { required: true, message: "状态 不能为空", trigger: "change" },
    ],
    userId: [{ required: true, message: "制单人id不能为空", trigger: "blur" }],
    baoxiaoUserId: [
      { required: true, message: "申请人id不能为空", trigger: "blur" },
    ],
    deptId: [
      { required: true, message: "申请部门id不能为空", trigger: "blur" },
    ],
    companyId: [
      { required: true, message: "申请公司id不能为空", trigger: "blur" },
    ],
    clientId: [{ required: true, message: "客户id不能为空", trigger: "blur" }],
    remark: [{ required: true, message: "事由不能为空", trigger: "blur" }],
    auditId: [{ required: true, message: "审批流不能为空", trigger: "blur" }],
    createBy: [{ required: true, message: "创建者不能为空", trigger: "blur" }],
    createTime: [
      { required: true, message: "创建时间不能为空", trigger: "blur" },
    ],
    updateBy: [{ required: true, message: "更新者不能为空", trigger: "blur" }],
    updateTime: [
      { required: true, message: "更新时间不能为空", trigger: "blur" },
    ],
    collectionUser: [
      { required: true, message: "收款人姓名不能为空", trigger: "change" },
    ],
    collectionBank: [
      { required: true, message: "银行卡号不能为空", trigger: "change" },
    ],
    collectionBankName: [
      { required: true, message: "银行名称不能为空", trigger: "change" },
    ],
    collectionBankAddress: [
      { required: true, message: "开户行不能为空", trigger: "change" },
    ],
    personnels: [
      { required: true, message: "出差人员不能为空", trigger: "blur" },
    ],
  },
});

const collectionList = ref({
  title: "收款人信息",
  table: [
    {
      value: "collectionSum",
      prop: "collectionSum",
      label: "金额",
      rules: {
        required: true,
        message: "请输入金额",
        trigger: "blur",
      },
    },
    {
      value: "collectionUser",
      prop: "collectionUser",
      label: "收款人姓名",
      rules: {
        required: true,
        message: "请输入收款人姓名",
        trigger: "blur",
      },
    },
    {
      value: "collectionBank",
      prop: "collectionBank",
      label: "银行卡号",
      rules: {
        required: true,
        message: "请输入银行卡号",
        trigger: "blur",
      },
    },
    {
      value: "collectionBankName",
      prop: "collectionBankName",
      label: "银行名称",
      rules: {
        required: true,
        message: "请输入银行名称",
        trigger: "blur",
      },
    },
    {
      value: "collectionBankAddress",
      prop: "collectionBankAddress",
      label: "开户行",
      rules: {
        required: true,
        message: "请输入开户行",
        trigger: "blur",
      },
    },
  ],
});

const feeList = ref({
  title: "费用明细",
  table: [
    {
      value: "feeItem",
      prop: "feeItem",
      label: "收支项目",
      rules: {
        required: true,
        message: "请输入收支项目",
        trigger: "blur",
      },
    },
    {
      value: "baoxiaoSum",
      prop: "baoxiaoSum",
      label: "申请金额",
      rules: {
        required: true,
        message: "请输入申请金额",
        trigger: "blur",
      },
    },
    {
      value: "taxRate",
      prop: "taxRate",
      label: "税率%",
      rules: {
        required: true,
        message: "请输入税率%",
        trigger: "blur",
      },
    },
    {
      value: "specialRicket",
      prop: "specialRicket",
      label: "进项税额（专票）",
      rules: {
        required: true,
        message: "请输入进项税额（专票）",
        trigger: "blur",
      },
    },
  ],
});

const feePersonnelList = ref({
  title: "费用明细",
  table: [
    {
      value: "feeItem",
      prop: "feeItem",
      label: "收支项目",
      rules: {
        required: true,
        message: "请输入收支项目",
        trigger: "blur",
      },
    },
    {
      value: "baoxiaoSum",
      prop: "baoxiaoSum",
      label: "申请金额",
      rules: {
        required: true,
        message: "请输入申请金额",
        trigger: "blur",
      },
    },
    {
      value: "taxRate",
      prop: "taxRate",
      label: "税率%",
      rules: {
        required: true,
        message: "请输入税率%",
        trigger: "blur",
      },
    },
    {
      value: "specialRicket",
      prop: "specialRicket",
      label: "进项税额（专票）",
      rules: {
        required: true,
        message: "请输入进项税额（专票）",
        trigger: "blur",
      },
    },
    // 添加其他字段信息
    {
      value: "departureDate",
      prop: "departureDate",
      label: "出发日期",
      rules: {
        required: true,
        message: "请输入出发日期",
        trigger: "blur",
      },
    },
    {
      value: "departureLocation",
      prop: "departureLocation",
      label: "出发地点",
      rules: {
        required: true,
        message: "请输入出发地点",
        trigger: "blur",
      },
    },
    {
      value: "arrivalLocation",
      prop: "arrivalLocation",
      label: "到达地点",
      rules: {
        required: true,
        message: "请输入到达地点",
        trigger: "blur",
      },
    },
    {
      value: "returnDate",
      prop: "returnDate",
      label: "返程日期",
      rules: {
        required: true,
        message: "请输入返程日期",
        trigger: "blur",
      },
    },
    {
      value: "numberOfPeople",
      prop: "numberOfPeople",
      label: "出差人数",
      rules: {
        required: true,
        message: "请输入出差人数",
        trigger: "blur",
      },
    },
    {
      value: "tripDays",
      prop: "tripDays",
      label: "出差天数",
      rules: {
        required: true,
        message: "请输入出差天数",
        trigger: "blur",
      },
    },
    {
      value: "transportation",
      prop: "transportation",
      label: "交通工具",
      rules: {
        required: true,
        message: "请输入交通工具",
        trigger: "blur",
      },
    },
    {
      value: "transportationFee",
      prop: "transportationFee",
      label: "交通费",
      rules: {
        required: true,
        message: "请输入交通费",
        trigger: "blur",
      },
    },
    {
      value: "travelAllowance",
      prop: "travelAllowance",
      label: "出差津贴",
      rules: {
        required: true,
        message: "请输入出差津贴",
        trigger: "blur",
      },
    },
    {
      value: "accommodationFee",
      prop: "accommodationFee",
      label: "住宿费",
      rules: {
        required: true,
        message: "请输入住宿费",
        trigger: "blur",
      },
    },
    {
      value: "transportationSubsidy",
      prop: "transportationSubsidy",
      label: "交通补助",
      rules: {
        required: true,
        message: "请输入交通补助",
        trigger: "blur",
      },
    },
    {
      value: "mealSubsidy",
      prop: "mealSubsidy",
      label: "伙食补助",
      rules: {
        required: true,
        message: "请输入伙食补助",
        trigger: "blur",
      },
    },
    {
      value: "otherExpenses",
      prop: "otherExpenses",
      label: "其他",
      rules: {
        required: true,
        message: "请输入其他",
        trigger: "blur",
      },
    },
  ],
});

const upload = reactive({
  // 是否显示弹出层（用户导入）
  open: false,
  // 弹出层标题（用户导入）
  title: "",
  // 是否禁用上传
  isUploading: false,
  // 是否更新已经存在的用户数据
  updateSupport: 0,
  // 设置上传的请求头部
  headers: { Authorization: "Bearer " + getToken() },
  // 上传的地址
  url: import.meta.env.VITE_APP_BASE_API + "/app/share/importShare"
});
const clientUnitImportTemplate = import.meta.env.VITE_APP_BASE_API + "/app/share/importTemplate/2";
const deptImportTemplate = import.meta.env.VITE_APP_BASE_API + "/app/share/importTemplate/0";
const userImportTemplate = import.meta.env.VITE_APP_BASE_API + "/app/share/importTemplate/1";

const selectedOffsetLoanRows = ref([]);
const openCreditCard = ref(false);
const openAudit = ref(false);
const openOffsetLoan = ref(false);
const openView = ref(false);
const AuditData = ref([]);
const feeData = ref([]);
const offsetLoanData = ref([]);
const collectionData =ref([]);
const fileData = ref([]);
const projectData = ref([]);
const { queryParams, form, rules } = toRefs(data);

watch(()=>feeData,(newValue,oldValue)=>{
  let totalAmount = 0;
  if (newValue.value.length) {
    totalAmount = newValue.value.reduce((acc, item) => acc + (item.baoxiaoSum ? Number(item.baoxiaoSum) : 0), 0);
  }
  form.value.totalAmount = totalAmount;
},{deep:true})

const typeText = computed(() => {
  return form.value.baoxiaoType == 2 ? "借款金额：" : "金额合计：";
});

/** 查询订单列表 */
function getList () {
  loading.value = true;
  listOrder(queryParams.value).then((response) => {
    orderList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

function getAllProject(){
  getProjectList().then(res => {
    projectData.value = res.data;
  })
}

// 取消按钮
function cancel () {
  open.value = false;
  reset();
}

function cancelCreditCard () {
  openCreditCard.value = false;
  reset();
}

// 表单重置
function reset () {
  form.value = {
    orderId: null,
    orderNumber: null,
    orderType: null,
    orderDate: null,
    baoxiaoType: null,
    repaymentSum: null,
    paymentSum: null,
    offsetLoanSum: null,
    totalAmount: null,
    editableTotalAmount: null,
    collectionId: null,
    feeId: null,
    isOffsetLoan: null,
    isDeptShare: null,
    orderStatus: null,
    userId: null,
    baoxiaoUserId: null,
    deptId: null,
    deptName: null,
    companyId: null,
    clientId: null,
    remark: null,
    auditId: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    collectionSum: null,
    collectionUser: null,
    collectionBank: null,
    collectionBankName: null,
    collectionBankAddress: null,
    collections:[{
      collectionUser:null,
      collectionBank:null,
      collectionBankName:null,
      collectionBankAddress:null
    }]
  };
  proxy.resetForm("orderRef");
}

/** 搜索按钮操作 */
function handleQuery () {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery () {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange (selection) {
  ids.value = selection.map((item) => item.orderId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd (name, index) {
  reset();
  feeData.value = [];
  collectionData.value = [];
  fileData.value = [];
  open.value = true;
  title.value = name;
  form.value.baoxiaoType = index;
}

/** 修改按钮操作 */
function handleUpdate (row) {
  loading.value = true;
  reset();
  const _orderId = row.orderId || ids.value;
  getOrder(_orderId).then((response) => {
    feeData.value = response.data.fees
    collectionData.value = response.data.collections
    fileData.value = response.data.files;

    loading.value = false;
    form.value = response.data;
    open.value = true;
    title.value = "修改订单";

    if (response.data.baoxiaoType == 2){
      form.value.collectionUser = response.data.collections[0].collectionUser;
      form.value.collectionBank = response.data.collections[0].collectionBank;
      form.value.collectionBankName = response.data.collections[0].collectionBankName;
      form.value.collectionBankAddress = response.data.collections[0].collectionBankAddress;
    }

  });
}

/** 提交按钮 */
async function submitForm () {
  let collections = null;
  let fees = null;

  switch (form.value.baoxiaoType){
    case 0:
      collections = await collectionRef.value.isSave(); //收款人信息
      fees = await feeRef.value.isSave(); //费用明细

      if (!fees || !collections) return false;

      break;
    case 1:
      collections = await collectionRef.value.isSave();
      fees = await feePersonnelRef.value.isSave();

      if (!fees || !collections)  return false;

      break
    case 2:
      collectionData.value = [];
      const {collectionSum,collectionUser, collectionBank, collectionBankName, collectionBankAddress} = form.value;
      collectionData.value.push({collectionSum,collectionUser,collectionBank,collectionBankName,collectionBankAddress});

      break;
    case 3:
       collections = await collectionRef.value.isSave();
      if (!collections) return false;

      break;
    case 4:
      fees = await feeRef.value.isSave();
      if (!fees) return false;

      break;
    case 5:
      collections = await collectionRef.value.isSave();
      if (!collections) return false;

      break;
  }

  const fileIds = fileData.value.map((file) => file.fileId);

  proxy.$refs["orderRef"].validate((valid) => {
    if (valid) {
      form.value.fees = feeData;
      form.value.collections = collectionData;
      form.value.fileIds = fileIds;

      buttonLoading.value = true;

      if (form.value.orderId != null) {
        updateOrder(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          })
          .finally(() => {
            buttonLoading.value = false;
          });
      } else {
        addOrder(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess("新增成功");
            open.value = false;
            getList();
          })
          .finally(() => {
            buttonLoading.value = false;
          });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete (row) {
  const _orderIds = row.orderId || ids.value;
  proxy.$modal
    .confirm('是否确认删除订单编号为"' + _orderIds + '"的数据项？')
    .then(function () {
      loading.value = true;
      return delOrder(_orderIds);
    })
    .then(() => {
      loading.value = true;
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => { })
    .finally(() => {
      loading.value = false;
    });
}

/** 导出按钮操作 */
function handleExport () {
  proxy.download(
    "app/order/export",
    {
      ...queryParams.value,
    },
    `order_${new Date().getTime()}.xlsx`
  );
}

const selectMoreClone = (index, o) => {
  form.value.deptName = o[index].dept.deptName;
  form.value.deptId = o[index].dept.deptId;
  form.value.baoxiaoUserName = o[index].nickName;
};

/*冲借款*/
const handleOffsetLoan =(row) => {

  const _orderId = row.orderId || ids.value;
  getOrder(_orderId).then((response) => {
    form.value = response.data;
    feeData.value = response.data.fees
    collectionData.value = response.data.collections
    fileData.value = response.data.files;

    title.value = "冲借款"
    openCreditCard.value = true;
  });
}

/*分摊*/
const handleShare = (row) => {
  upload.open = true;
  upload.title = "分摊";
  form.value = row;
}
/*提交*/
const handleSubmit = (row) => {
  orderAudit({orderId:row.orderId}).then(res => {
    getList();
    proxy.$modal.msgSuccess(res.msg);
  })
}

/*审批进度*/
const handleAudit = (row) => {
  getOrderAuditList(row.orderId).then(res => {
    openAudit.value = true;
    AuditData.value = res.rows;
  })
}

// 获取已审批完毕借款
const showOffsetLoan = () => {
  openOffsetLoan.value = true;
  title.value = "冲借款列表";

  orderUserBorrow().then(res => {
    offsetLoanData.value = res.rows;
  })
}

// 编辑冲借款金额
const offsetLoanSumEdit = (row, $index) => {
  offsetLoanData.value[$index] = row;
};

// 多选冲借款金额
const handleSelectionOffsetLoan = (val) => {
  selectedOffsetLoanRows.value = val;
}

//  提交冲借款金额
const submitOffsetLoan = () => {
  const { offsetLoanSum, totalAmount } = form.value;
  const rows = selectedOffsetLoanRows.value;
  const { sum, flag } = rows.reduce((acc, item) => {
      const newSum = Number(acc.sum) + Number(item.offsetLoanSum);
      const newFlag = acc.flag || Number(item.offsetLoanSum) > Number(item.editableTotalAmount);

      return { sum: newSum, flag: newFlag };
    }, { sum: 0, flag: false }
  );

  if (flag) return proxy.$modal.msgWarning("剩余金额不能大于借款金额");

  form.value.offsetLoanSum = sum;
  form.value.paymentSum = totalAmount > sum ? totalAmount - sum : 0;
  form.value.repaymentSum = totalAmount < sum ? totalAmount - sum : 0;

  openOffsetLoan.value = false;
}

// 冲借款提交
const submitCreditCard = () => {
  const rows = selectedOffsetLoanRows.value;
  const { totalAmount, offsetLoanSum, orderId } = form.value;

  orderWriteOffLoans({offsetLoans: rows, orderId:orderId, totalAmount:totalAmount, offsetLoanSum:offsetLoanSum,}).then(res=>{
    proxy.$modal.msgSuccess(res.msg);
    openCreditCard.value = false;
    reset();
    getList();
  })
}

/**文件上传中处理 */
const handleFileUploadProgress = (event, file, fileList) => {
  upload.isUploading = true;
};
/** 文件上传成功处理 */
const handleFileSuccess = (response, file, fileList) => {
  upload.open = false;
  upload.isUploading = false;
  proxy.$refs["uploadRef"].handleRemove(file);
  proxy.$alert("<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
  getList();
};

const submitFileForm = () => {
  proxy.$refs["uploadRef"].submit();
}

const handleView = (row)=>{

  const _orderId = row.orderId || ids.value;
  getOrder(_orderId).then((response) => {
    feeData.value = response.data.fees
    collectionData.value = response.data.collections
    fileData.value = response.data.files;

    loading.value = false;
    form.value = response.data;
    title.value = "详情"
    openView.value = true;

    if (response.data.baoxiaoType == 2){
      form.value.collectionUser = response.data.collections[0].collectionUser;
      form.value.collectionBank = response.data.collections[0].collectionBank;
      form.value.collectionBankName = response.data.collections[0].collectionBankName;
      form.value.collectionBankAddress = response.data.collections[0].collectionBankAddress;
    }

  });
}
getList();
getAllProject();
</script>
