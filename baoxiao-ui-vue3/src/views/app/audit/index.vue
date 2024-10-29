<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="auditList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label=" 审批流id" align="center" prop="auditId" v-if="true"/>
      <el-table-column label="订单id" align="center" prop="orderId" />
      <el-table-column label="用户id" align="center" prop="userId" />
      <el-table-column label="用户名" align="center" prop="userName" />
      <el-table-column label="职位" align="center" prop="position" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template #default="scope">
              <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['app:audit:edit']">审批</el-button>
<!--              <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['app:audit:remove']">删除</el-button>-->
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

    <!-- 添加或修改审批流对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="auditRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in audit_status" :key="dict.value" :label="parseInt(dict.value)">
              {{dict.label}}
            </el-radio>
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

<script setup name="Audit">
import { listAudit, getAudit, delAudit, addAudit, updateAudit } from "@/api/app/audit";

const { proxy } = getCurrentInstance();
const { audit_status } = proxy.useDict("audit_status");

const auditList = ref([]);
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
    pageSize: 1,
  },
  rules: {
    auditId: [
      { required: true, message: " 审批流id不能为空", trigger: "blur" }
    ],
    orderId: [
      { required: true, message: "订单id不能为空", trigger: "blur" }
    ],
    userId: [
      { required: true, message: "用户id不能为空", trigger: "blur" }
    ],
    userName: [
      { required: true, message: "用户名不能为空", trigger: "blur" }
    ],
    position: [
      { required: true, message: "职位不能为空", trigger: "blur" }
    ],
    status: [
      { required: true, message: "职位不能为空", trigger: "blur" }
    ],
    remark: [
      { required: true, message: "职位不能为空", trigger: "blur" }
    ],
    createTime: [
      { required: true, message: "创建时间不能为空", trigger: "blur" }
    ],
    createBy: [
      { required: true, message: "创建人不能为空", trigger: "blur" }
    ],
    updateTime: [
      { required: true, message: "更新时间不能为空", trigger: "blur" }
    ],
    updateBy: [
      { required: true, message: "修改人不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询审批流列表 */
function getList() {
  loading.value = true;
  listAudit(queryParams.value).then(response => {
    auditList.value = response.rows;
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
    auditId: null,
    orderId: null,
    userId: null,
    userName: null,
    position: null,
    status: null,
    remark: null,
    createTime: null,
    createBy: null,
    updateTime: null,
    updateBy: null
  };
  proxy.resetForm("auditRef");
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
  ids.value = selection.map(item => item.auditId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加审批流";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  loading.value = true
  reset();
  const _auditId = row.auditId || ids.value
  getAudit(_auditId).then(response => {
    loading.value = false;
    form.value = response.data;
    open.value = true;
    title.value = "修改审批流";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["auditRef"].validate(valid => {
    if (valid) {
      buttonLoading.value = true;
      if (form.value.auditId != null) {
        updateAudit(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        }).finally(() => {
          buttonLoading.value = false;
        });
      } else {
        addAudit(form.value).then(response => {
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
  const _auditIds = row.auditId || ids.value;
  proxy.$modal.confirm('是否确认删除审批流编号为"' + _auditIds + '"的数据项？').then(function() {
    loading.value = true;
    return delAudit(_auditIds);
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
  proxy.download('baoxiao/audit/export', {
    ...queryParams.value
  }, `audit_${new Date().getTime()}.xlsx`)
}

getList();
</script>
