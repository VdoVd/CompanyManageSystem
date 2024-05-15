import { showAllRole } from '../../view/role/roleView'
import { httpClass } from './req'

export const GetAllRole = async (url:string) =>{
  const res =await  httpClass.get<showAllRole[]>(url)
  console.log(`all role:${JSON.stringify(res)}`)
  return res
}

export const GetSearchRoles = (data:Object,vals:string[]) =>{
  let url='/role/find?'
  let keys:string[]=Object.keys(data)
  for(let i=0;i<keys.length;i++){
    url+=keys[i]+'='+encodeURIComponent(vals[i])+'&'
  }
  const res=httpClass.get<showAllRole[]>(`${url}`)
  return res
}