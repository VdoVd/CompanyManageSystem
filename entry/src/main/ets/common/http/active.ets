import { http } from '@kit.NetworkKit'
import { showAll } from '../../view/active/activeView'
import { httpClass } from './req'

export const GetAll = async () =>{

  const res =await httpClass.get<showAll[]>('/menu/all')

  console.log(`showAll:${JSON.stringify(res)}`)
  return res
}

export const GetSearch = (data:Object,vals:string[]) =>{
  let url='/menu/find?'
  let keys:string[]=Object.keys(data)
  for(let i=0;i<keys.length;i++){
    url+=keys[i]+'='+encodeURIComponent(vals[i])+'&'
  }
  const res=httpClass.get<showAll[]>(`${url}`)
  return res
}

