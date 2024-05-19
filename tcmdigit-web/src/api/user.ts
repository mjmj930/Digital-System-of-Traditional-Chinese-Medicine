import request from '@/utils/request'
import type { User } from '@/types/user'

export function getUsers() {
  return request({
    url: '/users',
    method: 'get'
  })
}

export function addUser(data: User) {
  return request({
    url: '/users',
    method: 'post',
    data
  })
}

export function updateUser(data: User) {
  return request({
    url: `/users/${data.user_id}`,
    method: 'put',
    data
  })
}

export function deleteUser(id: number) {
  return request({
    url: `/users/${id}`,
    method: 'delete'
  })
}
