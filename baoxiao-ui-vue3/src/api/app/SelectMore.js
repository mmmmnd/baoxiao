import request from '@/utils/request'

// 查询参数列表
export function listPage (url, query) {
  return request({
    url: url,
    method: 'get',
    params: query
  })
}