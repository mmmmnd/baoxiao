import request from '@/utils/request'

export function getReport() {
  return request({
    url: '/system/jmreport/getReport',
    method: 'get'
  })
}
