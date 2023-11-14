import request from '@/utils/request'

// 查询审批流列表
export function listAudit(query) {
  return request({
    url: '/app/audit/userAuditList',
    method: 'get',
    params: query
  })
}

// 查询审批流详细
export function getAudit(auditId) {
  return request({
    url: '/app/audit/' + auditId,
    method: 'get'
  })
}

// 新增审批流
export function addAudit(data) {
  return request({
    url: '/app/audit',
    method: 'post',
    data: data
  })
}

// 修改审批流
export function updateAudit(data) {
  return request({
    url: '/app/audit',
    method: 'put',
    data: data
  })
}

// 删除审批流
export function delAudit(auditId) {
  return request({
    url: '/app/audit/' + auditId,
    method: 'delete'
  })
}

export function getOrderAuditList(orderId) {
  return request({
    url: '/app/audit/orderAuditList/' + orderId,
    method: 'get'
  })
}


