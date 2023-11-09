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
      <el-form-item label="申请人" prop="baoxiaoUserId">
        <el-input v-model="queryParams.baoxiaoUserId" placeholder="请输入申请人id" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="申请公司" prop="companyId">
        <el-input v-model="queryParams.companyId" placeholder="请输入申请公司id" clearable @keyup.enter="handleQuery" />
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
      <el-table-column label="状态 " align="center" prop="orderStatus" />
      <el-table-column label="制单人" align="center" prop="userName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="CreditCard" @click="handleOffsetLoan(scope.row)"
                     v-hasPermi="['app:order:remove']">冲借款</el-button>
          <el-button link type="primary" icon="Coin" @click="handleShare(scope.row)"
                     v-hasPermi="['app:order:remove']">分摊</el-button>
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
                     v-hasPermi="['app:order:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
                     v-hasPermi="['app:order:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize"
                @pagination="getList" />

    <!-- 添加或修改订单对话框 -->
    <el-dialog :title="title" v-model="open" width="40%" append-to-body>
      <el-form ref="orderRef" :model="form" :rules="rules" label-width="100px">
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

              <el-col :span="24">
                <el-form-item label="金额合计：" prop="totalAmount">
                  <el-input-number v-model="form.totalAmount" :min="0" controls-position="right" size="large"
                                   placeholder="请选择金额合计" style="margin-right: 10px" />
                  <span>元</span>
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
                <el-form-item label="收款人："  prop="collectionUser">
                  <el-input type="text" v-model="form.collectionUser" placeholder="请填写收款人姓名" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="银行卡号："  prop="collectionBank">
                  <el-input type="text" v-model="form.collectionBank" placeholder="请填写银行卡号" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="银行名称："  prop="collectionBankName">
                  <el-input type="text" v-model="form.collectionBankName" placeholder="请填写银行名称" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="开户行:" prop="collectionBankAddress">
                  <el-input v-model="form.collectionBankAddress" placeholder="请填写开户行" />
                </el-form-item>
              </el-col>
            </el-row>
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType != 2">
          <el-header>
            <el-divider content-position="left">费用明细</el-divider>
          </el-header>
          <el-main>
            <edit-table v-model:data="feeData" :list="feeList" ref="feeRef" />
          </el-main>
        </el-container>

        <el-container v-if="form.baoxiaoType != 2">
          <el-header>
            <el-divider content-position="left">收款人信息</el-divider>
          </el-header>
          <el-main>
            <edit-table v-model:data="collectionData" :list="collectionList" ref="collectionRef" />
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
      <el-form ref="orderRef" :model="form" :rules="rules" label-width="100px">
        <el-container>
          <el-header>
            <el-divider content-position="left">冲销借款</el-divider>
          </el-header>
          <el-main>
            <el-row :gutter="10" class="mb8">
              <el-col :span="12">
                <el-form-item label="金额合计："  prop="collectionUser">
                  <el-input type="text" v-model="form.totalAmount" placeholder="请填写金额合计" />
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="冲销金额："  prop="collectionBank">
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
          <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancelCreditCard">取 消</el-button>
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
} from "@/api/app/order";
import SelectMore from "@/components/SelectMore/index.vue";
import EditTable from "@/views/component/editTable/index.vue";
import OrderFile from "@/views/component/orderFile/index.vue";

import useUserStore from "@/store/modules/user";

const userStore = useUserStore();

const { proxy } = getCurrentInstance();
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
      { required: true, message: "收款人姓名不能为空", trigger: "blur" },
    ],
    collectionBank: [
      { required: true, message: "银行卡号不能为空", trigger: "blur" },
    ],
    collectionBankName: [
      { required: true, message: "银行名称不能为空", trigger: "blur" },
    ],
    collectionBankAddress: [
      { required: true, message: "开户行不能为空", trigger: "blur" },
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

const openCreditCard = ref(false);
const feeData = ref([]);
const collectionData =ref([]);
const fileData = ref([]);
const { queryParams, form, rules } = toRefs(data);

/** 查询订单列表 */
function getList () {
  loading.value = true;
  listOrder(queryParams.value).then((response) => {
    orderList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
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
    collectionBankAddress: null
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
async function handleAdd (name, index) {
  reset();
  feeData.value = [];
  collectionData.value = [];
  fileData.value = [];
  open.value = true;
  title.value = name;
  form.value.baoxiaoType = index;
}

/** 修改按钮操作 */
async function handleUpdate (row) {
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
  });
}

/** 提交按钮 */
async function submitForm () {

  if(form.value.baoxiaoType != 2){

    const fees = await feeRef.value.isSave(); //费用明细
    const collections = await collectionRef.value.isSave(); //收款人信息

    if (!fees || !collections) {
      return false;
    }
  }

  /*借款*/
  if(form.value.baoxiaoType == 2){
    collectionData.value = [];
    form.value.collectionSum = 0;
    const {collectionSum,collectionUser, collectionBank, collectionBankName, collectionBankAddress} = form.value;
    collectionData.value.push({collectionSum,collectionUser,collectionBank,collectionBankName,collectionBankAddress});
  }

  const fileIds = fileData.value.map((file) => file.fileId);

  proxy.$refs["orderRef"].validate((valid) => {
    if (valid) {
      form.value.fees = feeData;
      form.value.collections = collectionData;
      form.value.fileIds = fileIds;

      buttonLoading.value = true;
      console.log(form.value)
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
    console.log(response)
    form.value = response.data;
    feeData.value = response.data.fees
    collectionData.value = response.data.collections
    fileData.value = response.data.files;

    title.value = "冲借款"
    openCreditCard.value = true;
  });
}

/*分摊*/
const handleShare = () => {
  console.log(2)
}

  getList();
</script>
