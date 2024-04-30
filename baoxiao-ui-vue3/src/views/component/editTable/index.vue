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
        <el-table-column v-for="item in list.table" :prop="item.prop" :label="item.label">
          <template #default="scope">
            <el-form :ref="`formRef${scope.$index}${item.prop}`" :model="scope.row">

              <el-form-item :prop="item.prop" :rules="item.rules" v-if="item.label != '收支项目' && item.label != '出发日期' && item.label != '返程日期'">
                <el-input v-model="scope.row[item.value]" :placeholder="item.rules.message" />
              </el-form-item>

              <el-form-item :prop="item.prop" :rules="item.rules" v-if="item.label == '收支项目'">
                <el-cascader v-model="scope.row[item.value]" :options="projectData" :props="projectProps" @change="tableValidate" />
              </el-form-item>

              <el-form-item :prop="item.prop" :rules="item.rules" v-if="item.label == '出发日期' || item.label == '返程日期'">
                <el-date-picker clearable v-model="scope.row[item.value]" type="date" value-format="YYYY-MM-DD" :placeholder="item.rules.message" />
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
  },
  projectData:{
    type: Array,
    default: [],
  }
});

const emit = defineEmits(["update:data"]);

const selectedRow = ref([]);

const projectProps = ref({
  value:"id",
  label:"name"
})

defineExpose({ isSave });

function addRow() {
  const tableData = props.data;

  tableData.push({
    uuid:Math.random().toString(36).slice(-6)
  })

  emit("update:data", tableData);

  proxy.$nextTick(() => {
    tableValidate();
  });
}

/* 删除 */
function deleteRow() {
  const tableData = props.data;

  if (selectedRow.value.length <= 0) {
    return proxy.$modal.msgWarning(`请选择需要删除${props.list.title}的属性`);
  }

  selectedRow.value.filter((row) => {
    const rowId = row.feeId || row.uuid;

    tableData.filter((table, tableIndex) => {
      const tableId = table.feeId || table.uuid;

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
  const validatePromises = [];

  Object.keys(refs).forEach(ref => {
    if (ref === "attrTableRef") return;

    const formRef = refs[ref][0]; // Assuming it's an array
    if (formRef && formRef.validate) {
      validatePromises.push(formRef.validate());
    }
  });

  return Promise.all(validatePromises).then(results => {
    return results.every(result => result);
  });
}
</script>
