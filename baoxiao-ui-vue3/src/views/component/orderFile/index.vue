<template>
  <el-row :gutter="20">
    <el-col :span="24">
      <material
        v-model:materialValue="valueArray"
        materialName="新增"
        :width="1200"
        :materialNum="999"
        v-hasPermi="['app:orderFile:add']"
      />
      <el-button
        type="danger"
        :disabled="single"
        @click="handleDelete"
        v-hasPermi="['app:orderFile:remove']"
        style="margin-left: 12px"
        >删除</el-button
      >
    </el-col>
  </el-row>

  <el-table
    :data="data"
    style="width: 100%"
    @selection-change="handleSelectionChange"
  >
    <el-table-column type="selection" width="55" align="center" />
    <el-table-column prop="fileName" label="文件名" />
    <el-table-column prop="originalName" label="原名" />
    <el-table-column prop="url" label="地址" />
    <el-table-column
      label="操作"
      align="center"
      class-name="small-padding fixed-width"
    >
      <template #default="scope">
        <a :href="scope.row.url" target="_blank">访问</a>
      </template>
    </el-table-column>
  </el-table>
</template>
<script setup>
import { addOrderFile, listOrderFile, delOrderFile } from "@/api/app/order";
import Material from "@/components/Material";
const { proxy } = getCurrentInstance();
const props = defineProps({
  data: {
    type: Object,
    default: [],
  },
  orderId: {
    type: Number,
    default: -1,
  },
});

const emit = defineEmits(["update:data"]);

const fileIds = ref([]);
const valueArray = ref([]);
const single = ref(true);
const selectionList = ref(true);

watch(
  () => valueArray,
  (newValue, oldValue) => {
    const flag = newValue.value.length != 0;
    flag && handAdd(newValue.value);
  },
  { deep: true }
);

// 多选框选中数据
const handleSelectionChange = (selection) => {
  selectionList.value = selection;
  fileIds.value = selection.map((item) => item.fileId);
  single.value = selection.length != 1;
};

/** 删除按钮操作 */
const handleDelete = () => {
  proxy.$modal
    .confirm('是否确认删除编号为"' + fileIds.value + '"的数据项？')
    .then(function () {
      return delOrderFile(fileIds.value);
    })
    .then(() => {
      fileIds.value.filter((id) => {
        props.data.filter((table, tableIndex) => {
          id == table.fileId && props.data.splice(tableIndex, 1);
        });
      });
      emit("update:data", props.data);
      proxy.$modal.msgSuccess("删除成功");
    })
    .catch(() => {});
};

/* 新增文件 */
const handAdd = (files) => {
  const ossIds = files.map((file) => file.ossId);

  addOrderFile({ ossId: ossIds }).then((res) => {
    props.data.push(...res.rows);
    emit("update:data", props.data);
  });
};

/* 获取文件 */
const getData = () => {
  listOrderFile({ orderId: props.orderId }).then((res) => {
    emit("update:data", res.rows);
  });
};

props.orderId && getData();
</script>
