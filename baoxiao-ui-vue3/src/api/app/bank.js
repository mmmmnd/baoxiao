import request from '@/utils/request'

// 查询银行列表
export function listBank(query) {
  return request({
    url: '/app/bank/list',
    method: 'get',
    params: query
  })
}

// 查询银行详细
export function getBank(bankId) {
  return request({
    url: '/app/bank/' + bankId,
    method: 'get'
  })
}

// 新增银行
export function addBank(data) {
  return request({
    url: '/app/bank',
    method: 'post',
    data: data
  })
}

// 修改银行
export function updateBank(data) {
  return request({
    url: '/app/bank',
    method: 'put',
    data: data
  })
}

// 删除银行
export function delBank(bankId) {
  return request({
    url: '/app/bank/' + bankId,
    method: 'delete'
  })
}
