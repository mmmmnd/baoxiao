import request from '@/utils/request'

export function getMaterialPage (query) {
  return request({
    url: 'api/material/page',
    method: 'get',
    params: query
  })
}

export function addMaterial (obj) {
  return request({
    url: 'api/material',
    method: 'post',
    data: obj
  })
}

export function getMaterial (id) {
  return request({
    url: 'api/material/' + id,
    method: 'get'
  })
}

export function delMaterial (id) {
  return request({
    url: 'api/material/' + id,
    method: 'delete'
  })
}

export function putMaterial (obj) {
  return request({
    url: 'api/material',
    method: 'put',
    data: obj
  })
}
