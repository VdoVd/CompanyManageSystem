import { SysUser } from '../../common/Model'
import ListItemView from './ListItemVIew'

@Component
export default struct ListView{

  @Prop list:SysUser[]

  @State timeId:number=0

  build() {
      List(){
        ForEach(this.list,(item:SysUser,index:number)=>{
          ListItem(){
              ListItemView({obj:item,index:index+1})
          }
        })
      }.scrollBar(BarState.Off)
      .width('100%')
      .height('100%')
      .onReachEnd(()=>{
        clearTimeout(this.timeId)
        this.timeId=setTimeout(()=>{
          console.log('it is end')
        },1000)
      })

  }

}