import { promptAction, router } from '@kit.ArkUI'
import { routerGetString } from '../common/Model'
import UserManage from '../view/UserManage/UserManage'
import { usbManager } from '@kit.BasicServicesKit'
import deptContent from '../view/dept/deptContent'
import roleVIew from '../view/role/roleView'
import menuVIew from '../view/menu/menuView'

@Entry
@Component
struct DetailPage {
  title:string=(router.getParams() as routerGetString).title
  build() {
    Navigation(){

      if(this.title==='用户管理'){
        UserManage().height('100%')
      }else if(this.title==='部门管理'){
        deptContent().height('100%')
      }else if(this.title==='角色管理'){
        roleVIew().height('100%')
      }else if(this.title==='菜单管理'){
        menuVIew().height('100%')
      }



    }.title(this.title)
    .titleMode(NavigationTitleMode.Mini)
    .height('100%')
  }

}