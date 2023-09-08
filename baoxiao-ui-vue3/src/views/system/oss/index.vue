<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryRef"
      :inline="true"
      v-show="showSearch"
    >
      <el-form-item label="文件名" prop="fileName">
        <el-input
          v-model="queryParams.fileName"
          placeholder="请输入文件名"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="原名" prop="originalName">
        <el-input
          v-model="queryParams.originalName"
          placeholder="请输入原名"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件后缀" prop="fileSuffix">
        <el-input
          v-model="queryParams.fileSuffix"
          placeholder="请输入文件后缀"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间">
        <el-date-picker
          v-model="daterangeCreateTime"
          value-format="YYYY-MM-DD HH:mm:ss"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          :default-time="[
            new Date(2000, 1, 1, 0, 0, 0),
            new Date(2000, 1, 1, 23, 59, 59),
          ]"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="上传人" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入上传人"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="服务商" prop="service">
        <el-input
          v-model="queryParams.service"
          placeholder="请输入服务商"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="search" @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>

      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['system:oss:remove']"
            >删除</el-button
          >
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="info"
            plain
            icon="Operation"
            @click="handleOssConfig"
            v-hasPermi="['system:oss:list']"
            >配置管理</el-button
          >
        </el-col>
      </el-row>
    </el-form>

    <el-tabs
      v-model="activeTableTopName"
      type="card"
      class="demo-tabs"
      @tab-click="handleOssList($event)"
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
              @click="handleOssGroupAddOrEdit(treeNodeGroupItem)"
              system:oss:change
              v-hasPermi="['system:oss:addGroup']"
            >
              添加分组
            </el-button>
          </div>

          <el-tabs
            v-model="activeTableLeftName"
            class="demo-tabs"
            tab-position="left"
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
                  <span
                    v-if="
                      children.groupId != 4 &&
                      children.groupId != 5 &&
                      children.groupId != 6
                    "
                  >
                    <el-button
                      size="small"
                      link
                      class="el-icon-edit"
                      style="margin-left: 10px; color: #409eff"
                      @click="handleOssGroupAddOrEdit(children)"
                      >重命名</el-button
                    >
                    <el-button
                      size="small"
                      link
                      class="el-icon-delete"
                      style="margin-left: 10px; color: red"
                      @click="handleOssGroupDel(treeNodeGroupItem, children)"
                      >删除</el-button
                    >
                  </span>
                </el-col>
              </el-row>

              <el-row :gutter="20" class="mb8">
                <el-col :span="1.5">
                  <el-button
                    :disabled="multiple"
                    @click="handleOssGroupOpen(treeNodeGroupItem)"
                    v-hasPermi="['system:oss:update']"
                    >更改分组</el-button
                  >
                </el-col>
                <el-col
                  :span="1.5"
                  v-show="
                    treeNodeGroupItem.groupId == 2 ||
                    treeNodeGroupItem.groupId == 3
                  "
                >
                  <el-button
                    type="primary"
                    plain
                    icon="Plus"
                    @click="handleFile(treeNodeGroupItem)"
                    v-hasPermi="['system:oss:upload']"
                    >上传文件</el-button
                  >
                </el-col>
                <el-col :span="1.5" v-show="treeNodeGroupItem.groupId == 1">
                  <el-button
                    type="primary"
                    plain
                    icon="Plus"
                    @click="handleImage(treeNodeGroupItem)"
                    v-hasPermi="['system:oss:upload']"
                    >上传图片</el-button
                  >
                </el-col>
                <el-col :span="1.5" v-show="treeNodeGroupItem.groupId == 1">
                  <el-button
                    :type="previewListResource ? 'danger' : 'warning'"
                    plain
                    @click="handlePreviewListResource(!previewListResource)"
                    v-hasPermi="['system:oss:edit']"
                    >预览开关 :
                    {{ previewListResource ? "禁用" : "启用" }}</el-button
                  >
                </el-col>
                <right-toolbar
                  v-model:showSearch="showSearch"
                  @queryTable="getList"
                >
                </right-toolbar>
              </el-row>

              <el-table
                v-loading="loading"
                :data="ossList"
                @selection-change="handleSelectionChange"
                :header-cell-class-name="handleHeaderClass"
                @header-click="handleHeaderCLick"
                v-if="showTable"
              >
                <el-table-column type="selection" width="55" align="center" />
                <el-table-column
                  label="对象存储主键"
                  align="center"
                  prop="ossId"
                  v-if="false"
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
                  label="文件后缀"
                  align="center"
                  prop="fileSuffix"
                />
                <el-table-column label="文件展示" align="center" prop="url">
                  <template #default="scope">
                    <ImagePreview
                      v-if="
                        previewListResource &&
                        checkFileSuffix(scope.row.fileSuffix)
                      "
                      :width="100"
                      :height="100"
                      :src="scope.row.url"
                      :preview-src-list="[scope.row.url]"
                    />
                    <span
                      v-text="scope.row.url"
                      v-if="
                        !checkFileSuffix(scope.row.fileSuffix) ||
                        !previewListResource
                      "
                    />
                  </template>
                </el-table-column>
                <el-table-column
                  label="创建时间"
                  align="center"
                  prop="createTime"
                  width="180"
                  sortable="custom"
                >
                  <template #default="scope">
                    <span>{{
                      parseTime(scope.row.createTime, "{y}-{m}-{d}")
                    }}</span>
                  </template>
                </el-table-column>
                <el-table-column
                  label="上传人"
                  align="center"
                  prop="createBy"
                />
                <el-table-column
                  label="服务商"
                  align="center"
                  prop="service"
                  sortable="custom"
                />
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
                      @click="handleDownload(scope.row)"
                      v-hasPermi="['system:oss:download']"
                      >下载</el-button
                    >
                    <el-button
                      link
                      type="primary"
                      icon="Delete"
                      @click="handleDelete(scope.row)"
                      v-hasPermi="['system:oss:remove']"
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
            </el-tab-pane>
          </el-tabs>
        </el-tab-pane>
      </template>
    </el-tabs>

    <!-- 添加或修改OSS对象存储对话框 -->
    <el-dialog
      v-model="open"
      :title="title"
      width="500px"
      append-to-body
      align-center
    >
      <el-form ref="ossRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="文件名">
          <fileUpload
            v-if="type === 0"
            v-model="form.file"
            :groupType="groupType"
            :groupId="groupId"
          />
          <imageUpload
            v-if="type === 1"
            v-model="form.file"
            :groupType="groupType"
            :groupId="groupId"
          />
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

    <el-dialog
      v-model="openGroup"
      :title="title"
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
          <el-button type="primary" @click="handleOssGroupChange">
            确 定
          </el-button>
          <el-button @click="openGroup = false">取 消</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Oss">
import { listOss, delOss, ossGroupIdUpdate } from "@/api/system/oss";
import {
  treeNodeList,
  ossGroupAdd,
  ossGroupEdit,
  ossGroupDel,
} from "@/api/system/ossGroup";
import ImagePreview from "@/components/ImagePreview/index.vue";

const router = useRouter();
const { proxy } = getCurrentInstance();
const ossList = ref([]);
const open = ref(false);
const showTable = ref(true);
const buttonLoading = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const type = ref(0);
const previewListResource = ref(true);
const daterangeCreateTime = ref([]);

const tableGroupList = ref([]); //树列表
const activeTableTopName = ref("图片"); //顶部选中
const activeTableLeftName = ref("全部分组"); //侧边选中
const activeType = ref(1); //当前选中的类型 0 侧边 1 顶部

const groupId = ref(0); //分组id
const groupType = ref(null); //分组类型
const openGroup = ref(false); //显示分组设置
const groupActiveOption = ref(""); //切换分组选中值
const groupOptions = ref([]); //切换分组列表

// 默认排序
const defaultSort = ref({ prop: "createTime", order: "desc" });
const data = reactive({
  form: {},
  // 查询参数
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    fileName: undefined,
    originalName: undefined,
    fileSuffix: undefined,
    url: undefined,
    createTime: undefined,
    createBy: undefined,
    service: undefined,
    groupId: undefined,
    groupType: undefined,
  },
  rules: {
    file: [{ required: true, message: "文件不能为空", trigger: "blur" }],
  },
});

const { queryParams, form, rules } = toRefs(data);

/** 查询OSS对象存储列表 */
function getList(param = {}) {
  loading.value = true;
  proxy.getConfigKey("sys.oss.previewListResource").then((response) => {
    previewListResource.value =
      response.msg === undefined ? true : response.msg === "true";
  });

  treeNodeList({})
    .then((response) => {
      tableGroupList.value = response.data;
      // queryParams.value.groupId = param.groupId;

      if (activeType.value == 0) {
        /* 侧边选项卡 */
        console.log("getList" + 1);
        // queryParams.value.groupType = param.groupType;
        queryParams.value.groupId = groupId.value;
        queryParams.value.groupType = null;
      } else if (activeType.value == 1) {
        /* 顶部选项卡 */
        console.log("getList" + 2);
        queryParams.value.groupId = null;
        queryParams.value.groupType = groupType.value;
      } else if (param.groupType) {
        console.log("getList" + 3);
        if (activeType == 0) {
          queryParams.value.groupId = groupId.value;
          queryParams.value.groupType = null;
        } else {
          queryParams.value.groupId = null;
          queryParams.value.groupType = groupType.value;
        }
      } else {
        console.log("getList" + 4);
      }

      queryParams.value.orderByColumn = defaultSort.value.prop;
      queryParams.value.isAsc = defaultSort.value.order;

      return listOss(
        proxy.addDateRange(
          queryParams.value,
          daterangeCreateTime.value,
          "CreateTime"
        )
      );
    })
    .then((response) => {
      ossList.value = response.rows;
      total.value = response.total;
      loading.value = false;
      showTable.value = true;
    });
}
function checkFileSuffix(fileSuffix) {
  let arr = ["png", "jpg", "jpeg"];
  return arr.some((type) => {
    return fileSuffix.indexOf(type) > -1;
  });
}
/** 取消按钮 */
function cancel() {
  open.value = false;
  reset();
}
/** 表单重置 */
function reset() {
  form.value = {
    file: undefined,
  };
  proxy.resetForm("ossRef");
}
/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}
/** 重置按钮操作 */
function resetQuery() {
  showTable.value = false;
  daterangeCreateTime.value = [];
  proxy.resetForm("queryRef");
  queryParams.value.orderByColumn = defaultSort.value.prop;
  queryParams.value.isAsc = defaultSort.value.order;
  handleQuery();
}
/** 选择条数  */
function handleSelectionChange(selection) {
  ids.value = selection.map((item) => item.ossId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}
// 设置列的排序为我们自定义的排序
function handleHeaderClass({ column }) {
  column.order = column.multiOrder;
}
// 点击表头进行排序
function handleHeaderCLick(column) {
  if (column.sortable !== "custom") {
    return;
  }
  switch (column.multiOrder) {
    case "descending":
      column.multiOrder = "ascending";
      break;
    case "ascending":
      column.multiOrder = "";
      break;
    default:
      column.multiOrder = "descending";
      break;
  }
  handleOrderChange(column.property, column.multiOrder);
}
function handleOrderChange(prop, order) {
  let orderByArr = queryParams.value.orderByColumn
    ? queryParams.value.orderByColumn.split(",")
    : [];
  let isAscArr = queryParams.value.isAsc
    ? queryParams.value.isAsc.split(",")
    : [];
  let propIndex = orderByArr.indexOf(prop);
  if (propIndex !== -1) {
    if (order) {
      //排序里已存在 只修改排序
      isAscArr[propIndex] = order;
    } else {
      //如果order为null 则删除排序字段和属性
      isAscArr.splice(propIndex, 1); //删除排序
      orderByArr.splice(propIndex, 1); //删除属性
    }
  } else {
    //排序里不存在则新增排序
    orderByArr.push(prop);
    isAscArr.push(order);
  }
  //合并排序
  queryParams.value.orderByColumn = orderByArr.join(",");
  queryParams.value.isAsc = isAscArr.join(",");
  getList();
}
/** 任务日志列表查询 */
function handleOssConfig() {
  router.push("/system/oss-config/index");
}
/** 文件按钮操作 */
function handleFile(treeNodeGroupItem) {
  reset();
  open.value = true;
  title.value = "上传文件";
  type.value = 0;

  // 用父id当类型
  groupType.value = treeNodeGroupItem.groupId;
}
/** 图片按钮操作 */
function handleImage(treeNodeGroupItem) {
  reset();
  open.value = true;
  title.value = "上传图片";
  type.value = 1;

  // 用父id当类型
  groupType.value = treeNodeGroupItem.groupId;
}
/** 提交按钮 */
function submitForm() {
  open.value = false;
  const param = {
    groupId: groupId.value,
    groupType: groupType.value,
  };
  getList(param);
}
/** 下载按钮操作 */
function handleDownload(row) {
  proxy.$download.oss(row.ossId);
}
/** 用户状态修改  */
function handlePreviewListResource(previewListResource) {
  let text = previewListResource ? "启用" : "停用";
  proxy.$modal
    .confirm('确认要"' + text + '""预览列表图片"配置吗?')
    .then(() => {
      return proxy.updateConfigByKey(
        "sys.oss.previewListResource",
        previewListResource
      );
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess(text + "成功");
    })
    .catch(() => {});
}

/** 删除按钮操作 */
const handleDelete = (row) => {
  const ossIds = row.ossId || ids.value;
  proxy.$modal
    .confirm('是否确认删除OSS对象存储编号为"' + ossIds + '"的数据项?')
    .then(() => {
      loading.value = true;
      return delOss(ossIds);
    })
    .then(() => {
      loading.value = false;
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
    .finally(() => {
      loading.value = false;
    });
};

/* 新增oss分组 */
const handleOssGroupAddOrEdit = (e) => {
  proxy.$modal
    .prompt("请输入分组名")
    .then(({ value }) => {
      if (e.groupType == 0) {
        const param = { groupType: e.groupId, name: value };
        ossGroupAdd(param).then((response) => {
          getList();
        });
      } else {
        const param = {
          groupId: e.groupId,
          groupType: e.groupType,
          name: value,
        };
        ossGroupEdit(param).then((response) => {
          getList();
          activeTableLeftName.value = value;
        });
      }
    })
    .catch(() => {});
};

/* 删除分组 */
const handleOssGroupDel = (parent, child) => {
  proxy.$modal
    .confirm(`是否删除当前分组："${child.name}"？`)
    .then(() => {
      ossGroupDel(child.groupId).then((response) => {
        proxy.$modal.msgSuccess(response.msg);
        activeTableLeftName.value = "全部分组";
        groupId.value = parent.children[0].groupId; //删除分组后切换为默认的id
        getList();
      });
    })
    .catch(() => {});
};

/* 选项卡和分组切换 */
const handleOssList = (e, o) => {
  if (!!o) {
    /* 侧边选项卡 */
    activeType.value = 0;

    groupId.value = o.children[e.index].groupId;
    groupType.value = null;

    queryParams.value.groupId = groupId.value;
    queryParams.value.groupType = null;
  } else {
    /* 顶部选项卡 */
    activeType.value = 1;

    groupId.value = 0;
    groupType.value = tableGroupList.value[e.index].groupId;

    queryParams.value.groupId = 0;
    queryParams.value.groupType = groupType.value;

    //切换分组后选中当前子的第一个
    activeTableLeftName.value = tableGroupList.value[e.index].children[0].name;
  }

  listOss(
    proxy.addDateRange(
      queryParams.value,
      daterangeCreateTime.value,
      "CreateTime"
    )
  ).then((res) => {
    ossList.value = res.rows;
    total.value = res.total;
    loading.value = false;
    showTable.value = true;
  });
};

/* 显示切换分组 */
const handleOssGroupOpen = (e) => {
  const groupList = tableGroupList.value;
  const index = groupType.value || 1;

  openGroup.value = true;
  title.value = "分组设置";
  groupOptions.value = groupList[index - 1].children;
};

/* 确认切换分组 */
const handleOssGroupChange = (e) => {
  const param = {
    ossIds: ids.value,
    groupId: groupActiveOption.value,
  };
  ossGroupIdUpdate(param).then((response) => {
    proxy.$modal.msgSuccess(response.msg);
    groupActiveOption.value = "";
    openGroup.value = false;
    getList();
  });
};

getList();
</script>
