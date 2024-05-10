
export interface allResponse<T>{
  message:string
  code:number
  success:boolean
  data:T
}

export interface SysUser{
  user_id: number
  dept_id: number
  user_name: string
  nick_name: string
  user_type: string
  email: string
  phonenumber: string
  sex: string
  avatar: string
  password: string
  status: string
  del_flag: string
  login_ip: string
  login_date: string
  create_by: string
  create_time: string
  update_by: string
  remark: string
}

export interface SysUserWithToken{
  SystemUser:SysUser
  token:string
}