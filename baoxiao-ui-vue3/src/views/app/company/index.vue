<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="公司名称" prop="companyName">
        <el-input
          v-model="queryParams.companyName"
          placeholder="请输入公司名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
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
          v-hasPermi="['app:company:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['app:company:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['app:company:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['app:company:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="companyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="公司id" align="center" prop="companyId" v-if="true"/>
      <el-table-column label="公司名称" align="center" prop="companyName" />
      <el-table-column label="公司地址" align="center" prop="companyAddress" />
      <el-table-column label="公司联系人" align="center" prop="companyContact" />
      <el-table-column label="联系电话" align="center" prop="phone" />
      <el-table-column label="排序" align="center" prop="sort" />
      <el-table-column label="状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="sys_show_hide" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template #default="scope">
              <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['app:company:edit']">修改</el-button>
              <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['app:company:remove']">删除</el-button>
          </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改子公司管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="companyRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="公司名称" prop="companyName">
          <el-input v-model="form.companyName" placeholder="请输入公司名称" />
        </el-form-item>
        <el-form-item label="公司地址" prop="companyAddress">
          <el-input v-model="form.companyAddress" placeholder="请输入公司地址" />
        </el-form-item>
        <el-form-item label="公司联系人" prop="companyContact">
          <el-input v-model="form.companyContact" placeholder="请输入公司联系人" />
        </el-form-item>
        <el-form-item label="联系电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input v-model="form.sort" placeholder="请输入排序" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
            v-for="dict in sys_show_hide"
            :key="dict.value"
            :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="form.remark" placeholder="请输入备注"  type="textarea"/>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Company">
import { listCompany, getCompany, delCompany, addCompany, updateCompany } from "@/api/app/company";

const { proxy } = getCurrentInstance();
const { sys_show_hide } = proxy.useDict('sys_show_hide');

const companyList = ref([]);
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
    companyName: undefined,
    companyAddress: undefined,
    companyContact: undefined,
    phone: undefined,
    sort: undefined,
    status: undefined,
  },
  rules: {
    companyId: [
      { required: true, message: "公司id不能为空", trigger: "blur" }
    ],
    companyName: [
      { required: true, message: "公司名称不能为空", trigger: "blur" }
    ],
    companyAddress: [
      { required: true, message: "公司地址不能为空", trigger: "blur" }
    ],
    companyContact: [
      { required: true, message: "公司联系人不能为空", trigger: "blur" }
    ],
    phone: [
      { required: true, message: "联系电话不能为空", trigger: "blur" }
    ],
    sort: [
      { required: true, message: "排序不能为空", trigger: "blur" }
    ],
    status: [
      { required: true, message: "状态不能为空", trigger: "change" }
    ],
    remark: [
      // { required: true, message: "备注不能为空", trigger: "blur" }
    ],
    createBy: [
      { required: true, message: "创建者不能为空", trigger: "blur" }
    ],
    createTime: [
      { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
    updateBy: [
      { required: true, message: "更新者不能为空", trigger: "blur" }
    ],
    updateTime: [
      { required: true, message: "更新时间不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询子公司管理列表 */
function getList() {
  loading.value = true;
  listCompany(queryParams.value).then(response => {
    companyList.value = response.rows;
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
    companyId: null,
    companyName: null,
    companyAddress: null,
    companyContact: null,
    phone: null,
    sort: null,
    status: null,
    remark: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  };
  proxy.resetForm("companyRef");
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
  ids.value = selection.map(item => item.companyId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加子公司管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset();
  const _companyId = row.companyId || ids.value
  getCompany(_companyId).then(response => {
    loading.value = false;
    form.value = response.data;
    open.value = true;
    title.value = "修改子公司管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["companyRef"].validate(valid => {
    if (valid) {
      buttonLoading.value = true;
      if (form.value.companyId != null) {
        updateCompany(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        }).finally(() => {
          buttonLoading.value = false;
        });
      } else {
        addCompany(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        }).finally(() => {
          buttonLoading.value = false;
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _companyIds = row.companyId || ids.value;
  proxy.$modal.confirm('是否确认删除子公司管理编号为"' + _companyIds + '"的数据项？').then(function() {
    loading.value = true;
    return delCompany(_companyIds);
  }).then(() => {
    loading.value = true;
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  }).finally(() => {
    loading.value = false;
  });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('app/company/export', {
    ...queryParams.value
  }, `company_${new Date().getTime()}.xlsx`)
}

getList();
</script>
