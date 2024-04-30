import request from '@/utils/request'

// 查询项目类型列表
export function listProject(query) {
  return request({
    url: '/app/project/list',
    method: 'get',
    params: query
  })
}

// 查询项目类型详细
export function getProject(id) {
  return request({
    url: '/app/project/' + id,
    method: 'get'
  })
}

// 新增项目类型
export function addProject(data) {
  return request({
    url: '/app/project',
    method: 'post',
    data: data
  })
}

// 修改项目类型
export function updateProject(data) {
  return request({
    url: '/app/project',
    method: 'put',
    data: data
  })
}

// 删除项目类型
export function delProject(id) {
  return request({
    url: '/app/project/' + id,
    method: 'delete'
  })
}

export function getProjectList(query) {
  return request({
    url: '/app/project/allList',
    method: 'get',
    params: query
  })
}

