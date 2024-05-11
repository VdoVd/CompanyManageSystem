import { contentInterface, homeItem } from '../../common/Model'
import { getRGB } from '../../common/util'
import { router } from '@kit.ArkUI'

@Component
export default struct content{
  @Prop list:contentInterface
  @State showList:boolean=false
  @State isShowList:boolean=true
  build() {
    Column(){

      Row(){

        Text(this.list.title)
          .layoutWeight(1)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bolder)

        Image(this.isShowList?$r('app.media.down3'):$r('app.media.right'))
          .width(20)
          .fillColor(Color.White)
          .onClick(()=>{
            this.isShowList=!this.isShowList
          })


      }
      .backgroundColor(getRGB())
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding(10)

      if(this.isShowList)
      Flex({wrap:FlexWrap.Wrap}){
        ForEach(this.list.list,(item:homeItem,index:number)=>{
          Text(item.name)
            .backgroundColor(getRGB())
            .fontColor(Color.White)
            .padding(5)
            .fontWeight(FontWeight.Bolder)
            .margin(7)
            .onClick(()=>{
              router.pushUrl({
                url:"pages/DetainPage",
                params:{
                  title:item.name
                }
              })
            })
        })
      }.padding(15)

    }
  }

}