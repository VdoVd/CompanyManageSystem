import { promptAction, router } from '@kit.ArkUI'
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

        Button('进入').width('100%').onClick(async ()=>{


          if(this.username===''){

              promptAction.showToast({message:'用户名为空'})

          }else if(this.password===''){

              promptAction.showToast({message:'密码为空'})

          }else {

            await this.login()

          }

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

  private async login() {

    console.log(`username:${this.username},password:${this.password}`)

    let result = await Login(this.username, this.password)

    if (result) {

      promptAction.showToast({

        message: '登录成功'

      })

      setTimeout(() => {

        router.pushUrl({

          url: "pages/Index"

        })

      }, 1000)

    } else {

      promptAction.showToast({

        message: '登录失败'

      })

    }

  }

}
