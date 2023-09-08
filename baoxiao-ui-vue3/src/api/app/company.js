import request from '@/utils/request'

// 查询子公司管理列表
export function listCompany(query) {
  return request({
    url: '/app/company/list',
    method: 'get',
    params: query
  })
}

// 查询子公司管理详细
export function getCompany(companyId) {
  return request({
    url: '/app/company/' + companyId,
    method: 'get'
  })
}

// 新增子公司管理
export function addCompany(data) {
  return request({
    url: '/app/company',
    method: 'post',
    data: data
  })
}

// 修改子公司管理
export function updateCompany(data) {
  return request({
    url: '/app/company',
    method: 'put',
    data: data
  })
}

// 删除子公司管理
export function delCompany(companyId) {
  return request({
    url: '/app/company/' + companyId,
    method: 'delete'
  })
}
