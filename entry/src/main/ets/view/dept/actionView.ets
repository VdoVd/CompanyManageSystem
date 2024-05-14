import { dept } from '../../common/http/dept'
import { SysUser } from '../../common/Model'
import smallText from '../../common/smallText'
import { getRGB } from '../../common/util'

@Component
export default struct actionView{
  @Prop item:dept
  @Consume deleteId:string
  @Consume obj:dept
  @Consume updateDeptFlag:boolean
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
            this.updateDeptFlag=true
          })
        smallText({name:'删除',color:Color.White})
          .onClick(()=>{
            this.obj=this.item
            this.deleteId=this.item.dept_id.toString()
          })
      }.layoutWeight(1).padding({left:20}).backgroundColor(Color.Black).padding(7)
    }.width('85%')
  }

}