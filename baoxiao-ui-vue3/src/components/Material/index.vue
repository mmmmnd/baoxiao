<template>
  <div
    v-if="materialNum > materialValue.length && materialName == null"
    tabindex="0"
    class="el-upload el-upload--picture-card"
    :style="`width:${width}px;height:${height};lineHeight:${height}px`"
    @click="handleOpen(0)"
  >
    <el-icon>
      <Plus />
    </el-icon>
  </div>
  <template v-else-if="materialName != null">
    <el-button @click="handleOpen(0)">
      {{ materialName }}
      <el-icon class="el-icon--right">
        <Upload />
      </el-icon>
    </el-button>
  </template>

  <!-- 图片素材 -->
  <el-dialog
    v-model="materialOpen"
    :title="materialTitle"
    :width="width"
    :append-to-body="true"
    align-center
  >
    <el-container v-loading="loading">
      <el-aside width="150px">
        <div style="margin-bottom: 10px">
          <el-button class="el-icon-plus" size="small" @click="handleOpen(4)">
            添加分组
          </el-button>
        </div>
        <el-tabs
          v-model="activeTableLeftName"
          tab-position="left"
          @tab-click="handleOssList"
        >
          <el-tab-pane
            v-for="children in treeNodeGroupItem.children"
            :label="children.name"
            :name="children.name"
          >
          </el-tab-pane>
        </el-tabs>
      </el-aside>
      <el-container>
        <el-header>
          <el-row style="margin-bottom: 20px">
            <el-col :span="1.5">
              {{ activeTableLeftName }}
            </el-col>
            <el-col :span="1.5" v-show="activeTableLeftName != '全部分组'">
              <el-button
                size="small"
                link
                class="el-icon-edit"
                style="margin-left: 10px; color: #409eff"
                @click="handleOpen(5)"
                >重命名</el-button
              >
            </el-col>
            <el-col :span="1.5" v-show="activeTableLeftName != '全部分组'">
              <el-button
                size="small"
                link
                class="el-icon-delete"
                style="margin-left: 10px; color: red"
                @click="handleOpen(6)"
                >删除</el-button
              >
            </el-col>
          </el-row>

          <div class="flex">
            <el-button
              :disabled="multiple"
              @click="handleOpen(1)"
              v-hasPermi="['system:oss:change']"
              >更改分组</el-button
            >
            <el-button
              type="danger"
              plain
              icon="Delete"
              :disabled="multiple"
              @click="handleOpen(7, multiple)"
              v-hasPermi="['system:oss:remove']"
              >删除</el-button
            >
            <el-button
              v-if="materialType == 1"
              type="primary"
              plain
              icon="Plus"
              @click="handleOpen(2)"
              v-hasPermi="['system:oss:upload']"
              >上传文件</el-button
            >
            <el-button
              v-if="materialType == 0"
              type="primary"
              plain
              icon="Plus"
              @click="handleOpen(3)"
              v-hasPermi="['system:oss:upload']"
              >上传图片</el-button
            >
          </div>
        </el-header>
        <el-main>
          <template :gutter="10" v-if="showMaterial">
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
                    <div>
                      <div
                        class="bottom"
                        style="display: flex; justify-content: space-between"
                      >
                        <el-checkbox
                          class="material-name"
                          :label="materialItem"
                        >
                          选择
                        </el-checkbox>
                        <el-button
                          link
                          @click="handleOpen(7, materialItem)"
                          type="danger"
                          >删除</el-button
                        >
                      </div>
                    </div>
                  </el-card>
                </el-checkbox-group>
              </el-col>
            </el-row>
            <div>
              <pagination
                v-show="materialTotal > 0"
                :total="materialTotal"
                v-model:page="queryParams.pageNum"
                v-model:limit="queryParams.pageSize"
                @pagination="getList"
              />
            </div>
          </template>

          <el-empty v-else description="暂无数据" />
        </el-main>
      </el-container>
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
        <el-button type="primary" @click="confirm(1)"> 确 定 </el-button>
      </span>
    </template>
  </el-dialog>

  <!-- 文件上传 -->
  <el-dialog
    v-model="fileOpen"
    :title="title"
    width="500px"
    append-to-body
    align-center
  >
    <el-form :model="form" :rules="rules" label-width="80px">
      <el-form-item label="文件名">
        <fileUpload
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

  <!-- 图片上传 -->
  <el-dialog
    v-model="imageOpen"
    :title="title"
    width="500px"
    append-to-body
    align-center
  >
    <el-form :model="form" :rules="rules" label-width="80px">
      <el-form-item label="文件名">
        <imageUpload
          v-model="form.file"
          :groupType="groupType"
          :groupId="groupId"
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="cancel(3)">取 消</el-button>
        <el-button type="primary" @click="confirm(3)">确 定</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup name="Oss">
import { listOss, delOss, ossGroupIdUpdate } from "@/api/system/oss";
import {
  treeNodeList,
  ossGroupAdd,
  ossGroupEdit,
  ossGroupDel,
} from "@/api/system/ossGroup";
import { ref, computed } from "vue";

const props = defineProps({
  // 当前双向数据绑定的值
  value: {
    type: Array,
    default: [],
  },
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
  // 素材类型
  materialType: {
    type: String,
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

const title = ref("");

const groupOpen = ref(false); //显示分组
const imageOpen = ref(false); //显示图片
const fileOpen = ref(false); //显示文件
const materialOpen = ref(false); //显示材料

const treeNodeGroupItem = ref([]); //当前树列表
const materialList = ref([]); //材料列表
const materialTotal = ref(0); //材料总数
const materialCheckbox = ref([]); //选中的值

const activeTableLeftName = ref("全部分组"); //侧边选中
const activeMaterial = ref(null); //侧边选中的对象

const groupId = ref(0); //分组id
const groupType = ref(null); //分组类型
const groupActiveOption = ref(""); //切换分组选中值
const groupOptions = ref([]); //切换分组列表
const selectionImges = ref([]); //选中的图片传给父

// 默认排序
const defaultSort = ref({ prop: "createTime", order: "desc" });

const data = reactive({
  form: {},
  // 查询参数
  queryParams: {
    pageNum: 1,
    pageSize: 12,
    groupId: undefined,
  },
  rules: {
    file: [{ required: true, message: "文件不能为空", trigger: "blur" }],
  },
});

const { queryParams, form, rules } = toRefs(data);

/* 标题 */
const materialTitle = computed(() => {
  const index = props.materialType || 2;
  return ["图片素材库", "办公三件套素材库", "其他素材库"][index];
});

/** 查询OSS对象存储列表 */
const getList = () => {
  loading.value = true;

  treeNodeList({})
    .then((response) => {
      const material = response.data[props.materialType];

      treeNodeGroupItem.value = material;
      queryParams.value.isAsc = defaultSort.value.order;
      queryParams.value.orderByColumn = defaultSort.value.prop;
      queryParams.value.groupId = groupId.value || material.children[0].groupId;

      return listOss(queryParams.value);
    })
    .then((response) => {
      materialList.value = response.rows;
      materialTotal.value = response.total;
      loading.value = false;
      showMaterial.value = response.total > 0 ? true : false;
    });
};

/** 选择条数  */
const handleSelectionChange = (selection) => {
  ids.value = selection.map((item) => item.ossId);
  selectionImges.value = selection.map((item) => item.url);
  multiple.value = !selection.length;
};

/* 选项卡和分组切换 */
const handleOssList = (e) => {
  activeMaterial.value = treeNodeGroupItem.value.children[e.index];
  groupId.value = treeNodeGroupItem.value.children[e.index].groupId;

  getList();
};

/**
 * 取消按钮
 * 0材料
 * 1更改分组
 * 2上传文件
 * 3上传图片
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
      fileOpen.value = false;
      break;
    case 3:
      imageOpen.value = false;
      break;
  }
};

/**
 * 显示弹窗
 * 0材料
 * 1更改分组
 * 2上传文件
 * 3上传图片
 * 4添加分组
 * 5重命名分组
 * 6删除分组
 * 7删除素材
 */
const handleOpen = (type, obj) => {
  switch (type) {
    case 0:
      materialOpen.value = true;
      title.value = "图片素材库";
      materialCheckbox.value = [];
      activeTableLeftName.value = "全部分组";
      getList();
      break;
    case 1:
      groupOpen.value = true;
      groupOptions.value = treeNodeGroupItem.value.children;
      break;
    case 2:
      fileOpen.value = true;
      title.value = "上传文件";
      groupType.value = treeNodeGroupItem.groupId;
      break;
    case 3:
      imageOpen.value = true;
      title.value = "上传图片";
      groupType.value = treeNodeGroupItem.groupId;
      break;
    case 4:
      confirm(4);
      break;
    case 5:
      confirm(5);
      break;
    case 6:
      confirm(6, obj);
      break;
    case 7:
      confirm(7, obj);
      break;
  }
};

/**
 * 提交按钮
 * 0材料
 * 1更改分组
 * 2上传文件
 * 3上传图片
 * 4添加分组
 * 5重命名分组
 * 6删除分组
 * 7删除素材
 */
const confirm = (type, obj) => {
  if (type == 0) {
    materialOpen.value = false;
    console.log("提交", selectionImges.value);
    emit("update:value", selectionImges.value);
  } else if (type == 1) {
    const param = {
      ossIds: ids.value,
      groupId: groupActiveOption.value,
    };

    ossGroupIdUpdate(param).then((response) => {
      proxy.$modal.msgSuccess(response.msg);
      groupActiveOption.value = "";
      materialCheckbox.value = [];
      groupOpen.value = false;
      getList();
    });
  } else if (type == 2) {
    const param = {
      groupId: groupId.value,
      groupType: groupType.value,
    };

    form.file = null;
    fileOpen.value = false;
    getList(param);
  } else if (type == 3) {
    const param = {
      groupId: groupId.value,
      groupType: groupType.value,
    };

    form.file = null;
    imageOpen.value = false;
    getList(param);
  } else if (type == 4) {
    proxy.$modal
      .prompt("请输入分组名")
      .then(({ value }) => {
        const group = treeNodeGroupItem.value;
        const param = { groupType: group.groupId, name: value };

        ossGroupAdd(param).then((response) => {
          getList();
        });
      })
      .catch(() => {});
  } else if (type == 5) {
    proxy.$modal
      .prompt("请输入分组名")
      .then(({ value }) => {
        const group = activeMaterial.value;
        const param = {
          groupId: group.groupId,
          groupType: group.groupType,
          name: value,
        };

        ossGroupEdit(param).then((response) => {
          getList();
          activeTableLeftName.value = value;
        });
      })
      .catch(() => {});
  } else if (type == 6) {
    proxy.$modal
      .confirm(`是否删除当前分组？`)
      .then(() => {
        const group = activeMaterial.value;

        ossGroupDel(group.groupId).then((response) => {
          proxy.$modal.msgSuccess(response.msg);
          activeTableLeftName.value = "全部分组";
          groupId.value = treeNodeGroupItem.value.groupId; //删除分组后切换为默认的id
          getList();
        });
      })
      .catch(() => {});
  } else if (type == 7) {
    proxy.$modal
      .confirm("是否删除此OSS对象存储数据项?")
      .then(() => {
        const ossIds = obj.ossId || ids.value;

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
<style lang="scss" scoped>
.el-aside {
  height: 500px;
  &.el-tabs &.el-tabs--left {
    height: 100%;
    overflow-y: scroll;
  }
}
</style>
