import { userStore } from '../../common/store'

@Component
export default struct topPart{

  @Prop img:Resource

  user=userStore.getUser()

  build() {

    Row({space:10}){

      Text('CRM SYSTEM').fontColor(Color.White).fontSize(13).fontWeight(FontWeight.Bolder)

      Row({space:15}){

        Image(this.img)
          .width(30)
          .borderRadius(30)

        Text(this.user.user_name)
          .fontColor(Color.White).fontSize(15)

      }.width('100%')
      .justifyContent(FlexAlign.Center)

    }.backgroundColor('rgb( 43, 48, 59)')
    .padding(20)
    .justifyContent(FlexAlign.SpaceBetween)

  }

}