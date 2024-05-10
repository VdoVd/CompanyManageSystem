import { SysUser } from './Model'
import { preferences } from '@kit.ArkData'



export class allStore{

}

export class userStore{

  private static user:SysUser={} as SysUser

  public static setUser(user:SysUser){
    userStore.user=user
  }

  public static getUser(){
    return userStore.user
  }

}

export class tokenStore{

  private static token:string

  public static setToken(token:string){
    tokenStore.token=token
  }

  public static getToken(){
    return tokenStore.token
  }

}
