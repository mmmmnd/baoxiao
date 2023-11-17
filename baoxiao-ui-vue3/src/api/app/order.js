import request from '@/utils/request'

// 查询订单列表
export function listOrder (query) {
  return request({
    url: '/app/order/list',
    method: 'get',
    params: query
  })
}

// 查询订单详细
export function getOrder (orderId) {
  return request({
    url: '/app/order/' + orderId,
    method: 'get'
  })
}

// 新增订单
export function addOrder (data) {
  return request({
    url: '/app/order',
    method: 'post',
    data: data
  })
}

// 修改订单
export function updateOrder (data) {
  return request({
    url: '/app/order',
    method: 'put',
    data: data
  })
}

// 删除订单
export function delOrder (orderId) {
  return request({
    url: '/app/order/' + orderId,
    method: 'delete'
  })
}

// 新增订单文件
export function addOrderFile (data) {
  return request({
    url: '/app/orderFile',
    method: 'post',
    data: data
  })
}

// 查询订单文件列表
export function listOrderFile (query) {
  return request({
    url: '/app/orderFile/list',
    method: 'get',
    params: query
  })
}

export function delOrderFile (fileId) {
  return request({
    url: '/app/orderFile/' + fileId,
    method: 'delete'
  })
}

/*提交*/
export function orderAudit (orderId) {
  return request({
    url: '/app/order/orderAudit/' + orderId,
    method: 'delete'
  })
}


