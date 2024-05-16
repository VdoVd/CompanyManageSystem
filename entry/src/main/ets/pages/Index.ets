import {
  contactManageList,
  countManageList, customManageList, dataManageList, orderManageList, systemManageList } from '../common/data';
import { httpClass, test } from '../common/http/req';
import { SysUser } from '../common/Model';
import content from '../view/Index/content';
import topPart from '../view/Index/topPart';

@Entry
@Component
struct Index {

  build() {
    Row() {
        Column({space:15}) {

          List(){
            ListItem(){
              topPart({img:$r('app.media.avatar01')})
                .onClick(()=>{

                  const arr=httpClass.get<SysUser[]>('/users')

                  console.log(`arrs:${JSON.stringify(arr)}`)

                })
            }
            ListItem(){
              content({list:systemManageList})
            }
            ListItem(){
              content({list:dataManageList})
            }
            ListItem(){
              content({list:customManageList})
            }
            ListItem(){
              content({list:countManageList})
            }
            ListItem(){
              content({list:orderManageList})
            }
            ListItem(){
              content({list:contactManageList})
            }
          }.width('100%')
          .height('100%')
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .alignSelf(ItemAlign.Start)
        .height('100%')


    }
    .height('100%')
    .width('100%')
  }
}