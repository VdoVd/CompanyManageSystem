import { router } from '@kit.ArkUI'
import { Login } from '../common/http/req'

@Entry
@Component
struct Index {
  @State username:string=''
  @State password:string=''
  build() {
    Row() {
      Column({space:25}) {

        Text('CRM')
          .fontWeight(FontWeight.Bolder)
          .width('100%')
          .textAlign(TextAlign.Center)

        TextInput({placeholder:'账号',text:$$this.username})

        TextInput({placeholder:'密码',text:$$this.password})
          .type(InputType.Password)

        // Row({space:15}){
        //
        //   TextInput({placeholder:'验证码'}).layoutWeight(1)
        //
        //
        //
        // }

        Button('进入').width('100%').onClick(()=>{
          console.log(`username:${this.username},password:${this.password}`)
          Login(this.username,this.password)
          // router.pushUrl({
          //   url:"pages/Index"
          // })
        })

      }
      .width('90%').padding('20')
      .borderRadius(15)
      .backgroundColor(Color.White)
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .backgroundColor('rgb( 24,144,255)')
  }
}