import { promptAction, router } from '@kit.ArkUI'
import { routerGetString } from '../common/Model'
import UserManage from '../view/UserManage/UserManage'
import { usbManager } from '@kit.BasicServicesKit'

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
          }
        }
      }.height('100%')
       .width('100%')
        .scrollBar(BarState.Off)

    }.title(this.title)
    .titleMode(NavigationTitleMode.Mini)


  }

}