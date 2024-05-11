
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
  status: number
  del_flag: string
  login_ip: string
  login_date: string
  create_by: string
  create_time: string
  update_by: string
  remark: string
}

export interface SysUserWithToken{
  systemUser:SysUser
  token:string
}

export interface contentInterface{
  title:string
  list:homeItem[]
}

export interface homeItem{
  name:string
  router:string
}

export interface routerGetString{
  title:string
}