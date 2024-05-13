import { promptAction, router } from '@kit.ArkUI'
import { routerGetString } from '../common/Model'
import UserManage from '../view/UserManage/UserManage'
import { usbManager } from '@kit.BasicServicesKit'
import deptContent from '../view/dept/deptContent'

@Entry
@Component
struct DetailPage {
  title:string=(router.getParams() as routerGetString).title
  build() {
    Navigation(){
      Scroll(){
        Column(){
          if(this.title==='用户管理'){
            UserManage()
          }else if(this.title==='部门管理'){
            deptContent()
          }
        }
      }.height('100%')
       .width('100%')
        .scrollBar(BarState.Off)

    }.title(this.title)
    .titleMode(NavigationTitleMode.Mini)
  }

}