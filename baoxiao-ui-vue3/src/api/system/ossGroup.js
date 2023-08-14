/*
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-07-27 09:31:50
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-08-02 10:16:24
 */
import request from '@/utils/request'

export function treeNodeList (query) {
  return request({
    url: '/system/oss/group/treeNode',
    method: 'get',
    params: query
  })
}

export function ossGroupAdd (data) {
  return request({
    url: '/system/oss/group',
    method: 'post',
    data: data
  })
}

export function ossGroupEdit (data) {
  return request({
    url: '/system/oss/group',
    method: 'put',
    data: data
  })
}

export function ossGroupDel (query) {
  return request({
    url: '/system/oss/group/' + query,
    method: 'delete',
  })
}