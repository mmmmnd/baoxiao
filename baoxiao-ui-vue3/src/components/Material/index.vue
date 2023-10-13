<template>
  <span>
    <div
      v-if="materialNum > materialValue.length && materialName == null"
      class="el-upload el-upload--picture-card"
      :style="`width:${width}px;height:${height};lineHeight:${height}px`"
      @click="handleOpen(0)"
    >
      <el-icon>
        <Plus />
      </el-icon>
    </div>
    <template v-else-if="materialName != null">
      <el-button @click="handleOpen(0)" type="primary">
        {{ materialName }}
      </el-button>
    </template>

    <!-- 素材库 -->
    <el-dialog
      v-model="materialOpen"
      title="素材库"
      :width="width"
      :append-to-body="true"
      align-center
    >
      <el-container v-loading="loading">
        <el-tabs
          v-model="activeTableTopName"
          type="card"
          @tab-click="handleOssList($event, tableGroupList)"
          style="width: 100%"
        >
          <template
            v-for="treeNodeGroupItem in tableGroupList"
            :key="treeNodeGroupItem.name"
          >
            <el-tab-pane
              :label="treeNodeGroupItem.name"
              :name="treeNodeGroupItem.name"
            >
              <div style="margin-bottom: 10px">
                <el-button
                  class="el-icon-plus"
                  size="small"
                  @click="handleOpen(3)"
                  v-hasPermi="['system:oss:addGroup']"
                >
                  添加分组
                </el-button>
              </div>
              <el-tabs
                v-model="activeTableLeftName"
                tab-position="left"
                class="tabs-header"
                @tab-click="handleOssList($event, treeNodeGroupItem)"
              >
                <el-tab-pane
                  v-for="children in treeNodeGroupItem.children"
                  :label="children.name"
                  :name="children.name"
                >
                  <el-row style="margin-bottom: 20px">
                    <el-col :span="24">
                      <span>{{ children.name }}</span>
                      <span v-show="!hasGroupId(children.groupId)">
                        <el-button
                          size="small"
                          link
                          class="el-icon-edit"
                          style="margin-left: 10px; color: #409eff"
                          @click="handleOpen(4)"
                          v-hasPermi="['system:oss:update']"
                          >重命名</el-button
                        >
                        <el-button
                          size="small"
                          link
                          class="el-icon-delete"
                          style="margin-left: 10px; color: red"
                          @click="handleOpen(5)"
                          v-hasPermi="['system:oss:remove']"
                          >删除</el-button
                        >
                      </span>
                    </el-col>
                  </el-row>

                  <el-row :gutter="20" class="mb8">
                    <el-col :span="1.5">
                      <el-button
                        type="danger"
                        plain
                        icon="Delete"
                        :disabled="multiple"
                        @click="handleOpen(6)"
                        v-hasPermi="['system:oss:remove']"
                        >删除</el-button
                      >
                    </el-col>
                    <el-col :span="1.5">
                      <el-button
                        icon="EditPen"
                        :disabled="multiple"
                        @click="handleOpen(1, treeNodeGroupItem)"
                        v-hasPermi="['system:oss:update']"
                        >更改分组</el-button
                      >
                    </el-col>
                    <el-col
                      :span="1.5"
                      v-show="groupType == 2 || groupType == 3"
                    >
                      <el-button
                        type="primary"
                        plain
                        icon="Plus"
                        @click="handleOpen(2)"
                        v-hasPermi="['system:oss:upload']"
                        >上传文件</el-button
                      >
                    </el-col>
                    <el-col :span="1.5" v-show="groupType == 1">
                      <el-button
                        type="primary"
                        plain
                        icon="Plus"
                        @click="handleOpen(2)"
                        v-hasPermi="['system:oss:upload']"
                        >上传图片</el-button
                      >
                    </el-col>
                  </el-row>

                  <!-- 图片 -->
                  <div v-show="showMaterial && groupType == 1">
                    <el-row>
                      <el-col
                        v-for="materialItem in materialList"
                        :key="materialItem"
                        :span="4"
                        style="padding-bottom: 2.5px"
                      >
                        <el-checkbox-group
                          v-model="materialCheckbox"
                          :max="materialNum"
                          @change="handleSelectionChange"
                        >
                          <el-card :body-style="{ padding: '0px' }">
                            <el-image
                              style="width: 100%; height: 100px"
                              fit="contain"
                              :src="materialItem.url"
                              :preview-src-list="[materialItem.url]"
                            />
                            <el-row style="overflow: hidden">
                              <el-col :span="24">
                                <el-button link>{{
                                  materialItem.originalName
                                }}</el-button>
                              </el-col>
                              <el-col :span="12">
                                <el-checkbox
                                  class="material-name"
                                  :label="materialItem"
                                >
                                  选择
                                </el-checkbox>
                              </el-col>
                              <el-col :span="12">
                                <el-button
                                  style="
                                    display: block;
                                    margin-left: auto;
                                    margin-top: 10px;
                                  "
                                  link
                                  @click="handleOpen(6, materialItem)"
                                  type="danger"
                                  >删除</el-button
                                >
                              </el-col>
                            </el-row>
                          </el-card>
                        </el-checkbox-group>
                      </el-col>
                    </el-row>
                    <pagination
                      v-show="materialTotal > 0"
                      :total="materialTotal"
                      v-model:page="queryParams.pageNum"
                      v-model:limit="queryParams.pageSize"
                      @pagination="getList"
                    />
                  </div>

                  <!-- offce 其他 -->
                  <div
                    v-show="showMaterial && (groupType == 2 || groupType == 3)"
                  >
                    <el-table
                      :ref="'tableMaterial' + children.groupId"
                      :data="materialList"
                      @selection-change="handleSelectionChange"
                      height="400"
                      @select="handleSelect"
                      @select-all="handleSelectAll"
                    >
                      <el-table-column
                        type="selection"
                        width="55"
                        align="center"
                        :selectable="rowSelectable"
                      />
                      <el-table-column
                        label="文件名"
                        align="center"
                        prop="fileName"
                      />
                      <el-table-column
                        label="原名"
                        align="center"
                        prop="originalName"
                      />
                      <el-table-column
                        label="文件展示"
                        align="center"
                        prop="url"
                      >
                        <template #default="scope">
                          <span v-text="scope.row.url" />
                        </template>
                      </el-table-column>
                    </el-table>
                    <pagination
                      v-show="materialTotal > 0"
                      :total="materialTotal"
                      v-model:page="queryParams.pageNum"
                      v-model:limit="queryParams.pageSize"
                      @pagination="getList"
                    />
                  </div>

                  <!-- 暂无数据 -->
                  <el-empty v-show="!showMaterial" description="暂无数据" />
                </el-tab-pane>
              </el-tabs>
            </el-tab-pane>
          </template>
        </el-tabs>
      </el-container>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="cancel(0)">取 消</el-button>
          <el-button type="primary" @click="confirm(0)"> 确 定 </el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 切换分组 -->
    <el-dialog
      v-model="groupOpen"
      title="分组设置"
      width="500px"
      :append-to-body="true"
      align-center
    >
      <el-form label-width="80px">
        <el-form-item label="分组列表">
          <el-select v-model="groupActiveOption" placeholder="请选择分组">
            <el-option
              v-for="groupOption in groupOptions"
              :label="groupOption.name"
              :value="groupOption.groupId"
            />
          </el-select>
        </el-form-item>
      </el-form>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="cancel(1)">取 消</el-button>
          <el-button type="primary" @click="confirm(1)">确 定</el-button>
        </span>
      </template>
    </el-dialog>

    <el-dialog
      v-model="open"
      :title="groupType === 1 ? '上传图片' : '上传文件'"
      width="500px"
      append-to-body
      align-center
    >
      <el-form :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文件名">
          <imageUpload
            v-if="groupType === 1"
            v-model="form.file"
            :groupType="groupType"
            :groupId="groupId"
          />
          <fileUpload
            v-else
            v-model="form.file"
            :groupType="groupType"
            :groupId="groupId"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancel(2)">取 消</el-button>
          <el-button type="primary" @click="confirm(2)">确 定</el-button>
        </div>
      </template>
    </el-dialog>
  </span>
</template>

<script setup name="Oss">
import { listOss, delOss, ossGroupIdUpdate } from "@/api/system/oss";
import {
  treeNodeList,
  ossGroupAdd,
  ossGroupEdit,
  ossGroupDel,
} from "@/api/system/ossGroup";

const props = defineProps({
  // 素材数据
  materialValue: {
    type: Array,
    default() {
      return [];
    },
  },
  // 名字
  materialName: {
    type: String,
    default: "选择",
  },
  // 素材限制数量，默认5个
  materialNum: {
    type: Number,
    default() {
      return 5;
    },
  },
  // 宽度
  width: {
    type: Number,
    default() {
      return 150;
    },
  },
  // 宽度
  height: {
    type: Number,
    default() {
      return 150;
    },
  },
});

const emit = defineEmits(["update:value"]);

const { proxy } = getCurrentInstance();
const showMaterial = ref(false);
const loading = ref(true);
const ids = ref([]);
const multiple = ref(true);

const open = ref(false); //显示图片
const groupOpen = ref(false); //显示分组
const materialOpen = ref(false); //显示材料

const tableGroupList = ref([]); //树列表
const materialList = ref([]); //材料列表
const materialTotal = ref(0); //材料总数
const materialCheckbox = ref([]); //选中的值

const activeTableTopName = ref("图片"); //顶部选中
const activeTableLeftName = ref("全部分组"); //侧边选中

const groupId = ref(4); //分组id
const groupType = ref(1); //分组类型
const groupActiveOption = ref(""); //切换分组选中值
const groupOptions = ref([]); //切换分组列表
const selectionValues = ref([]); //选中的图片传给父

// 默认排序
const defaultSort = ref({ prop: "createTime", order: "desc" });

const data = reactive({
  form: {},
  // 查询参数
  queryParams: {
    pageNum: 1,
    pageSize: 12,
    groupId: undefined,
    groupType: undefined,
  },
  rules: {
    file: [{ required: true, message: "文件不能为空", trigger: "blur" }],
  },
});

const { queryParams, form, rules } = toRefs(data);

/** 查询OSS对象存储列表 */
const getList = () => {
  loading.value = true;
  materialCheckbox.value = [];

  treeNodeList({})
    .then((response) => {
      tableGroupList.value = response.data;

      queryParams.value.groupId = groupId.value;
      queryParams.value.groupType = groupType.value;
      queryParams.value.isAsc = defaultSort.value.order;
      queryParams.value.orderByColumn = defaultSort.value.prop;

      return listOss(queryParams.value);
    })
    .then((response) => {
      materialList.value = response.rows;
      materialTotal.value = response.total;
      loading.value = false;
      showMaterial.value = response.total > 0;
    });
};

/* 校验groupId */
const hasGroupId = (groupId) => {
  return [4, 5, 6].includes(groupId);
};

/* 校验选中状态 */
const rowSelectable = (row, index) => {
  const checkBoxList = materialCheckbox.value;
  const checkboxIds = checkBoxList.map((e) => e.ossId);

  return checkBoxList.length == props.materialNum
    ? checkboxIds.includes(row.ossId)
    : true;
};

/* 单选 */
const handleSelect = (selection, row) => {
  if (selection.length > props.materialNum) {
    const tableMaterial = proxy.$refs[`tableMaterial${groupId.value}`][0];
    proxy.$modal.msgWarning("已经超出最大限制，不可再选择");
    tableMaterial.toggleRowSelection(row, false);
  }
};

/* 多选 */
const handleSelectAll = (selection) => {
  const tableMaterial = proxy.$refs[`tableMaterial${groupId.value}`][0];
  const allSelectResult = tableMaterial.store.states.isAllSelected;

  if (selection.length > props.materialNum && allSelectResult) {
    proxy.$modal.msgWarning("已经超出最大限制，不可再选择");

    const checkboxList = [];

    for (let i = 0; i < props.materialNum; i++) {
      checkboxList.push(materialList.value[i]);
    }

    tableMaterial.clearSelection();

    nextTick(() => {
      checkboxList.forEach((item) => {
        tableMaterial.toggleRowSelection(item, true);
      });
    });
  }
};

/** 选择条数  */
const handleSelectionChange = (selection) => {
  selectionValues.value = selection;
  multiple.value = !selection.length;
  materialCheckbox.value = selection;
  ids.value = selection.map((item) => item.ossId);
};

/* 选项卡和分组切换 */
const handleOssList = (e, o) => {
  if (o?.groupType == 0) {
    /* 侧边选项卡 */

    groupId.value = o.children[e.index].groupId;
    groupType.value = o.children[e.index].groupType;
  } else {
    /* 顶部选项卡 */

    groupId.value = o[e.index].children[0].groupId;
    groupType.value = o[e.index].groupId;

    //切换分组后选中当前子的第一个
    activeTableLeftName.value = o[e.index].children[0].name;
  }

  getList();
};

/**
 * 取消按钮
 * 0材料
 * 1更改分组
 * 2上传
 */
const cancel = (type) => {
  switch (type) {
    case 0:
      materialOpen.value = false;
      break;
    case 1:
      groupOpen.value = false;
      break;
    case 2:
      open.value = false;
      break;
  }
};

/**
 * 显示弹窗
 * 0材料
 * 1更改分组
 * 2上传文件
 * 3添加分组
 * 4重命名分组
 * 5删除分组
 * 6删除素材
 */
const handleOpen = (type, obj) => {
  switch (type) {
    case 0:
      materialOpen.value = true;
      materialCheckbox.value = [];
      activeTableLeftName.value = "全部分组";
      getList();
      break;
    case 1:
      groupOpen.value = true;
      groupOptions.value = obj.children;
      break;
    case 2:
      open.value = true;
      break;
    case 3:
      confirm(3);
      break;
    case 4:
      confirm(4);
      break;
    case 5:
      confirm(5, obj);
      break;
    case 6:
      confirm(6, obj);
      break;
  }
};

/**
 * 提交按钮
 * 0材料
 * 1更改分组
 * 2上传文件
 * 3添加分组
 * 4重命名分组
 * 5删除分组
 * 6删除素材
 */
const confirm = (type, obj) => {
  if (type == 0) {
    materialOpen.value = false;
    console.log("提交", selectionValues.value);
    emit("update:materialValue", selectionValues.value);
  } else if (type == 1) {
    /* groupActiveOption是选中后的值 */
    const param = { ossIds: ids.value, groupId: groupActiveOption.value };

    ossGroupIdUpdate(param).then((response) => {
      proxy.$modal.msgSuccess(response.msg);
      groupActiveOption.value = "";
      materialCheckbox.value = [];
      groupOpen.value = false;
      getList();
    });
  } else if (type == 2) {
    const param = { groupId: groupId.value, groupType: groupType.value };

    form.file = null;
    open.value = false;
    getList(param);
  } else if (type == 3) {
    proxy.$modal
      .prompt("请输入分组名")
      .then(({ value }) => {
        const param = { groupType: groupType.value, name: value };

        ossGroupAdd(param).then((response) => {
          getList();
        });
      })
      .catch(() => {});
  } else if (type == 4) {
    proxy.$modal
      .prompt("请输入分组名")
      .then(({ value }) => {
        const param = {
          groupId: groupId.value,
          groupType: groupType.value,
          name: value,
        };

        ossGroupEdit(param).then((response) => {
          getList();
          activeTableLeftName.value = value;
        });
      })
      .catch(() => {});
  } else if (type == 5) {
    proxy.$modal
      .confirm(`是否删除当前分组？`)
      .then(() => {
        ossGroupDel(groupId.value).then((response) => {
          const T = groupType.value;
          proxy.$modal.msgSuccess(response.msg);
          activeTableLeftName.value = "全部分组";
          groupId.value = T == 1 ? 4 : T == 2 ? 5 : T == 6 ? 3 : 0;
          getList();
        });
      })
      .catch(() => {});
  } else if (type == 6) {
    proxy.$modal
      .confirm("是否删除此OSS对象存储数据项?")
      .then(() => {
        const ossIds = !!obj ? obj.ossId : ids.value;
        loading.value = true;
        delOss(ossIds).then(() => {
          proxy.$modal.msgSuccess("删除成功");
          loading.value = false;
          getList();
        });
      })
      .finally(() => {
        loading.value = false;
      })
      .catch(() => {});
  }
};
</script>
<style scoped>
.tabs-header {
  height: 550px;
  width: 100%;
}
</style>
