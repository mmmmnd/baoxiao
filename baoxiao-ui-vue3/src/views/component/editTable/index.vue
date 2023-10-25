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
        :data="data"
        style="width: 100%"
      >
        <el-table-column type="selection" width="55" />
        <el-table-column
          v-for="item in list.table"
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
  list: {
    type: Object,
    default: {},
  },
  data:{
    type: Array,
    default: [],
  }
});

const emit = defineEmits(["update:data"]);

defineExpose({ isSave });

const selectedRow = ref([]);

/* 新增 */
function addRow() {
  const tableData = props.data;
  tableData.push({
    uuid:Math.random().toString(36).slice(-6)
  })

  emit("update:data", tableData);
}

/* 删除 */
function deleteRow() {
  const tableData = props.data;
  if (selectedRow.value.length <= 0) {
    return proxy.$modal.msgWarning(`请选择需要删除${props.list.title}的属性`);
  }

  selectedRow.value.filter((row) => {
    const rowId = row.id || row.uuid;
    tableData.filter((table, tableIndex) => {
      const tableId = table.id || table.uuid;
      if (rowId == tableId) {
        tableData.splice(tableIndex, 1);
      }
    });
  });

  emit("update:data", tableData);
}

/* 保存 */
async function isSave() {
  const changeHasSave = props.data.length == 0;

  if (changeHasSave) {
    proxy.$modal.msgWarning(`没有需要保存${props.list.title}的数据`);
    return false;
  }

  return await tableValidate();
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
