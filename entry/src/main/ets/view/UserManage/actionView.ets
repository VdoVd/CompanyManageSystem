import { SysUser } from '../../common/Model'
import smallText from '../../common/smallText'
import { getRGB } from '../../common/util'

@Component
export default struct actionView{
  @Prop item:SysUser
  @Consume deleteName:string
  @Consume obj:SysUser
  @Consume updateDialogFlag:boolean
  build() {
    Row(){
      Row(){
        smallText({name:'操作',color:Color.White,textAlign:TextAlign.Center})
      }.width('30%').justifyContent(FlexAlign.Center)
      .backgroundColor(getRGB())
      .padding(7)
      Row({space:17}){
        smallText({name:'修改',color:Color.White})
          .onClick(()=>{
            this.obj=this.item
            this.updateDialogFlag=true
          })
        smallText({name:'删除',color:Color.White})
          .onClick(()=>{
            this.deleteName=this.item.user_name
          })
        smallText({name:'重置密码',color:Color.White})
      }.layoutWeight(1).padding({left:20}).backgroundColor(Color.Black).padding(7)
    }.width('85%')
  }

}