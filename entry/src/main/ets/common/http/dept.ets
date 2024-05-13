import { httpClass } from './req'

export interface  updateUserInterface{
  nickname:string,
  username:string
  status:string,
  phonenumber:string
}

export interface dept{
  dept_id:number
  parent_id:number
  ancestors:string
  dept_name:string
  order_num:number
  leader:string
  phone:string
  email:string
  status:string
  del_flag:string
  create_by:string
  create_time:string
  update_by:string
  update_time:string
}

export const getAllDept = async ()=>{

  const list = await httpClass.get<dept[]>('/dept/all')

  return list
}

export const findDept = async (name:string) =>{

  const dept = await httpClass.get<dept>(`/dept/find?name=${name}`)

  return dept
}