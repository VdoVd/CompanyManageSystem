import { userStore } from '../../common/store'

@Component
export default struct topPart{

  @Prop img:Resource

  user=userStore.getUser()

  build() {

    Column(){

      Text('CRM SYSTEM').backgroundColor(Color.White)

      Row(){

        Image(this.img)
          .width(60)
          .borderRadius(30)

        Text('')
          .backgroundColor(Color.White)

      }.width('100%')
      .justifyContent(FlexAlign.Center)

    }.backgroundColor('rgb( 43, 48, 59)')

  }

}