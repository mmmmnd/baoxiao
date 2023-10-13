<template>
  <div class="attr-table">
    <el-row :gutter="20">
      <el-col :span="24">
        <el-button @click="addRow()" type="primary">新增</el-button>
        <el-button @click="deleteRow" type="danger">删除</el-button>
      </el-col>
    </el-row>
    <div class="main-table">
      <el-table
        ref="attrTableRef"
        @selection-change="handleSelectionChange"
        :data="tableData"
        style="width: 100%"
      >
        <el-table-column type="selection" width="55" />
        <el-table-column
          v-for="item in data.table"
          :prop="item.prop"
          :label="item.label"
        >
          <template #default="scope">
            <el-form
              :ref="`formRef${scope.$index}${item.prop}`"
              :model="scope.row"
            >
              <el-form-item :prop="item.prop" :rules="item.rules">
                <el-input
                  v-model="scope.row[item.value]"
                  :placeholder="item.rules.message"
                >
                </el-input>
              </el-form-item>
            </el-form>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script setup>

const { proxy } = getCurrentInstance();
const props = defineProps({
  data: {
    type: Object,
    default: {},
  },
});

defineExpose({ save, clear });

const tableData = ref([]);
const selectedRow = ref([]);
const changeHasSave = ref(true);

/* 新增 */
function addRow() {
  const newTableData = JSON.parse(JSON.stringify(tableData.value));

  newTableData.push({});
  tableData.value = newTableData.map((e) => {
    const uuid = Math.random().toString(36).slice(-6);

    return { ...e, uuid };
  });
  changeHasSave.value = false;
}

/* 删除 */
function deleteRow() {
  if (selectedRow.value.length <= 0) {
    return proxy.$modal.msgWarning(`请选择需要删除${props.data.title}的属性`);
  }

  selectedRow.value.filter((row) => {
    tableData.value.filter((table, tableIndex) => {
      if (row.id == table.id) {
        tableData.value.splice(tableIndex, 1);
      }
    });
  });

  if (tableData.value.length == 0) {
    changeHasSave.value = true;
  }
}

/* 保存 */
async function save() {
  if (changeHasSave.value) {
    proxy.$modal.msgWarning(`没有需要保存${props.data.title}的数据`);
    return false;
  }

  return (await tableValidate()) ? tableData.value : false;
}

/* 清空 */
function clear() {
  tableData.value = [];
}

/* 获取当前选中 */
function handleSelectionChange(sel) {
  selectedRow.value = sel;
}

// 表格的校验方法
function tableValidate() {
  const refs = proxy.$refs;
  let allPassValidate = true;

  for (let ref in refs) {
    if (ref === "attrTableRef") continue;
    allPassValidate = refs[ref][0]?.validate((v) => v === false);
  }

  return allPassValidate;
}
</script>
