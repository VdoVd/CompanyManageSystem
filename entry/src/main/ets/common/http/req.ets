import { http } from '@kit.NetworkKit'
import { allResponse, SysUser, SysUserWithToken } from '../Model'
import { tokenStore, userStore } from '../store'

const baseUrl='http://192.168.110.1:8080'

export const Login= async (username:string,password:string)=>{

  console.log('before req')

  let req=await http.createHttp().request(`${baseUrl}/login`,{
    method:http.RequestMethod.POST,
    header: {
      'Content-Type': 'application/json'
    },
    extraData:{
      username:username,
      password:password
    }
  })

  const result=JSON.parse(req.result.toString()) as allResponse<SysUserWithToken>

  console.log(`login result:${JSON.stringify(result)}`)

  if(result.success===true)
  {

    tokenStore.setToken(result.data.token)

    userStore.setUser(result.data.SystemUser)

    return true
  }else {
    return false
  }

}