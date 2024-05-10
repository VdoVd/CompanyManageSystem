import { http } from '@kit.NetworkKit'
import { allResponse } from '../Model'

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
  console.log(`res is:${JSON.stringify(req.result)}`)

  const token=(req.result as allResponse<string>).data

  return token
}