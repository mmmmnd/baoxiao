import { listPage } from "@/api/app/SelectMore";

const debounce = (func, wait) => { // 演示用，直接引入了debounce。
  let timeId;
  return function (...args) {
    let _this = this;
    clearTimeout(timeId);
    timeId = setTimeout(function () {
      func.apply(_this, args);
    }, wait);
  }
}

let idIndex = 0

// 指令相关
export const useDirectivesEffect = () => {
  // 保证当前组件唯一
  const onlyId = `more_${idIndex++}_${new Date().getTime()}`

  // 监听滚动到底部时，执行
  const vLoadMoreDirective = {
    mounted(el, binding) {
      const self = el.target
      const selectDropDownWrap = document.querySelector(`.el-popper.${onlyId} .el-select-dropdown .el-select-dropdown__wrap`)
      selectDropDownWrap?.addEventListener('scroll', function (event) {
        const scrollToBottom = Math.floor(self.scrollHeight - self.scrollTop) <= self.clientHeight
        if (scrollToBottom) {
          binding.value()
        }
        event.preventDefault() // 阻止默认滚动行为
      }, { passive: true }); // 设置为被动
    }
  }

  // 下拉框内插入搜索框
  const vSearchDirective = {
    mounted(el, binding) {
      const selectDropDown = document.querySelector(`.el-popper.${onlyId} .el-select-dropdown`)
      const searchDom = document.querySelector(`.more-filter-${onlyId}`)
      searchDom && selectDropDown?.prepend(searchDom)
    }
  }

  // 显示多选选中的值
  const vShowMulTextDirective = {
    mounted(el, binding) {
      if (binding.value) {
        const mulSelectDom = document.querySelector(`.more-wrap-text-${onlyId} .select-trigger`)
        const textDom = document.querySelector(`.more-sel-text-${onlyId}`)
        textDom && mulSelectDom?.prepend(textDom)
      }
    }
  }

  return { onlyId, vLoadMoreDirective, vSearchDirective, vShowMulTextDirective }
}

// 页面数据
export const useListEffect = (props, emits) => {
  let list = ref([]) // 列表数据
  let selectVal = ref(props.multiple ? [] : undefined) // select框的值
  let selectedArrText = ref([]) // 多选时选中的文字
  let originListInfo = {} // 源数据详情
  let keywords = ref('') // 搜索关键字
  let searchSet = reactive({
    init: true, // 是否是第一次加载
    pageNum: 1, // 当前页数
    loading: false, // 正在请求接口
    isFinish: false,  // 数据加载完成
  })

  // 请求接口获取数据
  let controller // 接口api
  const getList = async () => {
    // 加载完成或正在加载时，取消加载
    if (searchSet.isFinish || searchSet.loading) {
      return false
    }

    // 中断上次的请求。防止加载分页数据时，搜索内容的结果是上一次的分页内容
    controller && controller.abort()
    controller = new AbortController()

    searchSet.loading = true
    const pageNum = searchSet.pageNum++;
    const pageSize = props.pageSize;
    const params = Object.assign({}, props.otherParams, {
      [props.pageNumName]: pageNum,
      [props.pageSizeName]: pageSize,
      [props.keyName]: keywords.value
    })


    const result = await listPage(props.url, params)

    if (result.code === 'ERR_CANCELED') { // 已取消不再往下执行
      return false
    }

    searchSet.loading = false
    const { total, rows = [] } = props.handleResult(result)
    searchSet.isFinish = pageNum * pageSize >= total
    list.value = list.value.concat(rows)
  }
  // change事件
  const selectChange = (selectId) => {
    const idKey = props.value
    const textKey = props.label
    let updateId = undefined // 选中的id
    let updateText = undefined // 选中的text
    let updateOriginData = undefined // 选中的数据信息

    const listValue = toRaw(list.value)
    if (props.multiple) { // 多选
      updateId = []
      updateText = []
      updateOriginData = []

      selectId?.forEach(itemId => {
        let originInfo = originListInfo[itemId]
        if (!originInfo) {
          originInfo = listValue.find(itemObj => itemObj[idKey] === itemId)
          originListInfo[itemId] = originInfo
        }
        updateId.push(originInfo[idKey])
        updateText.push(originInfo[textKey])
        updateOriginData.push(originInfo)
      })
      selectedArrText.value = updateText.join(',')
    } else { // 非多选
      let originInfo = selectId ? originListInfo[selectId] : {}
      if (selectId && !originInfo) {
        originInfo = listValue.find(itemObj => itemObj[idKey] === selectId)
        originListInfo[selectId] = originInfo
      }

      updateId = originInfo[idKey]
      updateText = originInfo[textKey]
      updateOriginData = originInfo
    }

    emits('update:modelValue', updateId)
    emits('update:text', updateText)
    emits('change', updateOriginData)
  }

  // 重置请求数据
  const resetList = () => {
    // 重置请求状态
    searchSet.pageNum = 1
    searchSet.loading = false
    searchSet.isFinish = false
    list.value = props.defaultList

    // 请求数据
    getList()
  }

  // 展示时请求接口
  const visibleChange = (visible) => {
    emits('visibleChange', visible)
    if (visible && searchSet.init) {
      searchSet.init = false
      resetList()
    }
  }

  // 搜索
  watch(keywords, debounce(resetList, 300))

  // 编辑回填
  watch(() => props.editData, (editData) => {
    editData = toRaw(editData)

    searchSet.init = true // 更改值时，将init重置为true

    list.value = props.defaultList.concat(editData) // 回填选项

    // 回填id和text，并保存源数据
    let editIdArr = []
    let updateText = []
    const idKey = props.value
    const textKey = props.label
    editData.forEach((item) => {
      editIdArr.push(item[idKey])
      updateText.push(item[textKey])
      originListInfo[item[props.value]] = item // 保存源数据
    })

    selectVal.value = props.multiple ? editIdArr : editIdArr[0] // 回填id
    selectedArrText.value = updateText.join(',') // 回填text
  })

  // 清空已选项
  const clear = () => {
    searchSet.init = true
    selectVal.value = props.multiple ? [] : undefined
    selectChange()
  }

  // 展示加载更多选项
  const showLoading = computed(() => {
    return !searchSet.isFinish
  })

  return { selectVal, selectedArrText, keywords, list, getList, visibleChange, selectChange, clear, showLoading }
}
