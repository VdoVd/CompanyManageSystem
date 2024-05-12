import { deleteByName } from './http/manageSystem'
import smallText from './smallText'
import { promptAction } from '@kit.ArkUI'
import { SysUser } from './Model'
import middleText from './middleText'

@CustomDialog
export  struct deleteByNameDialog{
  controller:CustomDialogController
  @Consume deleteName:string
  build() {
    Column({space:25}){

      smallText({name:`确定删除${this.deleteName}`,color:Color.Black,fontSize:25})
        .margin({top:30})

      Row({space:25}){
        smallText({name:'确定'})
          .onClick(async ()=>{
            const flag=await deleteByName(this.deleteName)
            if(flag){
              promptAction.showToast({
                message:'删除成功'
              })
            }else {
              promptAction.showToast({
                message:'删除失败'
              })
            }
            this.deleteName=''
            this.controller.close()
          })
        smallText({name:'取消'})
          .onClick(()=>{
            this.deleteName=''
            this.controller.close()
          })

      }.justifyContent(FlexAlign.Center).width('100%')
    }.width('80%')
    .padding(30)
  }

}

