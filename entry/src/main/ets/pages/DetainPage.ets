import { router } from '@kit.ArkUI'
import { routerGetString } from '../common/Model'

@Entry
@Component
struct DetailPage {
  title:string=(router.getParams() as routerGetString).title
  build() {
    Navigation(){
      Scroll(){
        Column(){

        }
      }.height('100%')
       .width('100%')
        .scrollBar(BarState.Off)

    }.title(this.title)
    .titleMode(NavigationTitleMode.Mini)


  }

}