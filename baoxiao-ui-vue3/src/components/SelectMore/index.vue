<template>
  <el-select v-model="selectVal" :class="mulSelectTextCls" :multiple="multiple"
             v-show-mul-text-directive="multipleShowText" :collapse-tags="multiple && !multipleShowText"
             :collapse-tags-tooltip="multiple && !multipleShowText" :placeholder="placeholder" :popper-class="onlyId"
             :disabled="disabled" v-load-more-directive="getList" v-search-directive @visibleChange="visibleChange" clearable
             @change="selectChange" readonly>
    <el-option v-for="item in list" :key="item[value]" :label="item[label]" :value="item[value]">
      <!-- option文字 -->
      <p class="option-wrap" v-if="multiple" :title="item[label]">
        <label class="el-checkbox">
          <span class="el-checkbox__inner"></span>
          <span class="option-text" v-text="item[label]"></span>
        </label>
      </p>
      <p v-else class="option-wrap option-text" v-text="item[label]" :title="item[label]"></p>
    </el-option>
    <el-option v-show="showLoading" value="" disabled>
      <el-icon class="is-loading loading-icon">
<!--        <i-ep-loading />-->
      </el-icon>正在加载中...
    </el-option>
  </el-select>

  <!-- 多选时的显示文字 -->
  <div v-if="multipleShowText" :class="`more-sel-text-${onlyId}`" class="more-sel-text">
    <el-tooltip effect="dark" placement="right-start" :offset="40" :disabled="!selectedArrText">
      <template #content>
        <p class="tool-tip-text">{{ selectedArrText }}</p>
      </template>
      <div class="text-wrap">
        <input class="el-input__inner" readonly type="text" :value="selectedArrText">
      </div>
    </el-tooltip>
  </div>

  <!-- select里input搜索框 -->
  <el-form @submit.prevent @click.stop :class="`more-filter-${onlyId}`" class="more-filter">
    <el-form-item>
      <el-input v-model.trim="keywords" clearable :placeholder="searchPlaceholder">
      </el-input>
    </el-form-item>
  </el-form>
</template>

<script setup>
import { useDirectivesEffect, useListEffect } from './index'

const props = defineProps({
  modelValue: { // v-model

  },
  text: { // v-model:text

  },
  url: { // 远程地址
    required: true,
    type: String,
    default: ''
  },
  pageNumName: { // 搜索条件的当前页名
    type: String,
    default: 'pageNum'
  },
  pageSizeName: { // 搜索条件的每页个数名
    type: String,
    default: 'pageSize'
  },
  pageSize: { // 每次传参个数
    type: Number,
    default: 20,
  },
  keyName: { // 搜索条件的key名
    type: String,
    default: 'keywords'
  },
  placeholder: {
    type: String,
    default: '请选择'
  },
  searchPlaceholder: { // 搜索显示文字
    type: String,
    default: '模糊搜索名称'
  },
  value: { // value配置项
    type: String,
    default: 'id'
  },
  label: { // label配置项
    type: String,
    default: 'name'
  },
  otherParams: { // 接口传参。当额外传参是动态变化的，需要用响应式的方式传进来
    type: Object,
    default() {
      return {}
    }
  },
  handleResult: { // 处理接口返回的数据，使其返回data和page的组合形式
    type: Function,
    default: (res) => {
      return res
    }
  },
  defaultList: { // 默认选项
    type: Array,
    default: () => {
      return []
    }
  },
  disabled: { // 是否禁用
    type: Boolean,
    default: false,
  },
  multiple: {
    type: Boolean, // 是否多选
    default: false,
  },
  multipleShowText: { // 是否把多选结果显示成文字
    type: Boolean,
    default: false,
  },
  editData: { // 编辑回填选中的列表，编辑时必须
    type: Array,
    default() {
      return []
    }
  },
})


const emits = defineEmits(['change', 'visibleChange', 'update:modelValue', 'update:text'])

// 指令
const { onlyId, vLoadMoreDirective, vSearchDirective, vShowMulTextDirective } = useDirectivesEffect()

// 搜索和列表
const { selectVal, selectedArrText, keywords, list, getList, visibleChange, selectChange, clear, showLoading } = useListEffect(props, emits)

// 多选样式
const mulSelectTextCls = computed(() => {
  return {
    'more-wrap': props.multiple,
    'more-wrap-text': props.multipleShowText,
    [`more-wrap-text-${onlyId}`]: props.multipleShowText
  }
})

// 暴露组件方法
defineExpose({
  clear
})
</script>

<style lang="scss" scoped>

.more-filter {
  padding: 10px 10px 0;
  min-width: 230px;

  .el-form-item {
    margin-bottom: 0
  }
}

.option-wrap {
  margin: 0 -10px 0 -7px;
}

.option-text {
  max-width: 300px;
  margin-left: 5px;
}

.loading-icon {
  margin-right: 5px;
  vertical-align: middle;
}

/* // 多选时显示原有的标签样式 */
.more-wrap :deep(.el-select-tags-wrapper.has-prefix) {
  display: flex;
  flex-wrap: nowrap;
}

/* // 多选时显示文字样式 */
.more-wrap-text {
  :deep(.el-select__tags) {
    display: none;
  }

  .more-sel-text {
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    right: 30px;
    z-index: var(--el-index-normal);

    .text-wrap {
      padding: 1px 11px;
    }
  }
}

.tool-tip-text {
  max-width: 400px;
  max-height: 300px;
  overflow-y: auto;
}

/* // 多选options样式  */
.el-select-dropdown.is-multiple .el-select-dropdown__item.selected {
  &:after {
    display: none;
  }

  .el-checkbox .el-checkbox__inner {
    background-color: var(--el-checkbox-checked-bg-color);
    border-color: var(--el-checkbox-checked-input-border-color);

    &:after {
      transform: rotate(45deg) scaleY(1);
    }
  }

}
</style>
<style>
/* 多选样式选中文字弹出样式 */
.el-select__collapse-tags {
  max-width: 500px;
  max-height: 200px;
  overflow: auto;
  padding-right: 10px;
}
</style>
