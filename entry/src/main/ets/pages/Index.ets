import {
  contactManageList,
  countManageList, customManageList, dataManageList, orderManageList, systemManageList } from '../common/data';
import { test } from '../common/http/req';
import content from '../view/Index/content';
import topPart from '../view/Index/topPart';

@Entry
@Component
struct Index {

  build() {
    Row() {
      Scroll(){
        Column({space:15}) {
          topPart({img:$r('app.media.avatar01')})
            .onClick(()=>{
              test()
            })

          content({list:systemManageList})

          content({list:dataManageList})

          content({list:customManageList})

          content({list:countManageList})

          content({list:orderManageList})

          content({list:contactManageList})

        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .alignSelf(ItemAlign.Start)
      }.height('100%')
      .scrollBar(BarState.Off)

    }
    .height('100%')
    .width('100%')
  }
}