<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="客商单位" prop="clientUnitName">
        <el-input
          v-model="queryParams.clientUnitName"
          placeholder="请输入客商单位名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业务类型" prop="businessType">
        <el-input
          v-model="queryParams.businessType"
          placeholder="请输入业务类型名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['app:client:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['app:client:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['app:client:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['app:client:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        v-model:showSearch="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="clientList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column
        label="客商id"
        align="center"
        prop="clientId"
        v-if="true"
      />
      <el-table-column
        label="客商单位名称"
        align="center"
        prop="clientUnitName"
      />
      <el-table-column
        label="客商协议名称"
        align="center"
        prop="clientAgreementName"
      />
      <el-table-column label="业务类型" align="center" prop="businessType">
        <template #default="scope">
          <dict-tag
            :options="client_business_type"
            :value="scope.row.businessType"
          />
        </template>
      </el-table-column>
      <el-table-column label="客服人员" align="center" prop="customerName" />
      <el-table-column label="销售人员" align="center" prop="sellName" />
      <el-table-column label="联系人" align="center" prop="contactsName" />
      <el-table-column label="联系电话" align="center" prop="phone" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template #default="scope">
          <el-button
            link
            type="primary"
            icon="Edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['app:client:edit']"
            >修改</el-button
          >
          <el-button
            link
            type="primary"
            icon="Delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['app:client:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改客户信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="clientRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="客商单位" prop="clientUnitName">
          <el-input
            v-model="form.clientUnitName"
            placeholder="请输入客商单位名称"
          />
        </el-form-item>
        <el-form-item label="客商协议" prop="clientAgreementName">
          <el-input
            v-model="form.clientAgreementName"
            placeholder="请输入客商协议名称"
          />
        </el-form-item>
        <el-form-item label="业务类型" prop="businessType">
          <el-select
            style="width: 380px"
            v-model="form.businessType"
            placeholder="业务类型"
            clearable
          >
            <el-option
              v-for="dict in client_business_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="客服人员" prop="customerName">
          <el-input
            v-model="form.customerName"
            disabled
            placeholder="请输入客商协议名称"
          />
        </el-form-item>
        <el-form-item label="销售人员" prop="sellName">
          <div style="width: 380px">
            <select-more
              @change="selectMoreClone"
              keyName="nickName"
              value="nickName"
              label="nickName"
              v-model="form.sellName"
              url="/system/user/list"
            />
          </div>
        </el-form-item>
        <el-form-item label="联系人" prop="contactsName">
          <el-input v-model="form.contactsName" placeholder="请输入联系人" />
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitForm"
            >确 定</el-button
          >
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Client">
import {
  listClient,
  getClient,
  delClient,
  addClient,
  updateClient,
} from "@/api/app/client";
import useUserStore from "@/store/modules/user";
import SelectMore from "@/components/SelectMore/index.vue";

const userStore = useUserStore();
const { proxy } = getCurrentInstance();
const { client_business_type } = proxy.useDict("client_business_type");

const clientList = ref([]);
const open = ref(false);
const buttonLoading = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    clientUnitName: undefined,
    clientAgreementName: undefined,
    businessType: undefined,
    customerName: undefined,
    sellName: undefined,
    contactsName: undefined,
    phone: undefined,
    status: undefined,
  },
  rules: {
    clientId: [{ required: true, message: "客商id不能为空", trigger: "blur" }],
    clientUnitName: [
      { required: true, message: "客商单位名称不能为空", trigger: "blur" },
    ],
    clientAgreementName: [
      { required: true, message: "客商协议名称不能为空", trigger: "blur" },
    ],
    businessType: [
      { required: true, message: "业务类型不能为空", trigger: "change" },
    ],
    customerName: [
      { required: true, message: "客服人员不能为空", trigger: "blur" },
    ],
    sellName: [
      { required: true, message: "销售人员不能为空", trigger: "blur" },
    ],
    contactsName: [
      { required: true, message: "联系人不能为空", trigger: "blur" },
    ],
    phone: [{ required: true, message: "联系电话不能为空", trigger: "blur" }],
    status: [{ required: true, message: "状态不能为空", trigger: "change" }],
    remark: [{ required: true, message: "备注不能为空", trigger: "blur" }],
    delFlag: [{ required: true, message: "删除标志不能为空", trigger: "blur" }],
    createBy: [{ required: true, message: "创建者不能为空", trigger: "blur" }],
    createTime: [
      { required: true, message: "创建时间不能为空", trigger: "blur" },
    ],
    updateBy: [{ required: true, message: "更新者不能为空", trigger: "blur" }],
    updateTime: [
      { required: true, message: "更新时间不能为空", trigger: "blur" },
    ],
  },
});

const { queryParams, form, rules } = toRefs(data);

/** 查询客户信息列表 */
function getList() {
  loading.value = true;
  listClient(queryParams.value).then((response) => {
    clientList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    clientId: null,
    clientUnitName: null,
    clientAgreementName: null,
    businessType: null,
    customerName: userStore.nickName,
    sellName: null,
    contactsName: null,
    phone: null,
    status: null,
    remark: null,
    delFlag: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
  };
  proxy.resetForm("clientRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.clientId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加客户信息";
  form.value.customerName = userStore.nickName;
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true;
  reset();
  const _clientId = row.clientId || ids.value;
  getClient(_clientId).then((response) => {
    loading.value = false;
    form.value = response.data;
    open.value = true;
    title.value = "修改客户信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["clientRef"].validate((valid) => {
    if (valid) {
      buttonLoading.value = true;
      if (form.value.clientId != null) {
        updateClient(form.value)
          .then((response) => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          })
          .finally(() => {
            buttonLoading.value = false;
          });
      } else {
        addClient(form.value)
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
function handleDelete(row) {
  const _clientIds = row.clientId || ids.value;
  proxy.$modal
    .confirm('是否确认删除客户信息编号为"' + _clientIds + '"的数据项？')
    .then(function () {
      loading.value = true;
      return delClient(_clientIds);
    })
    .then(() => {
      loading.value = true;
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {})
    .finally(() => {
      loading.value = false;
    });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download(
    "app/client/export",
    {
      ...queryParams.value,
    },
    `client_${new Date().getTime()}.xlsx`
  );
}

const selectMoreClone = () => {};
getList();
</script>
