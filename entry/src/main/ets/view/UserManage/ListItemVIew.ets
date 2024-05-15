import commonRow from '../../common/components/commonRow'
import { SysUser } from '../../common/Model'
import actionView from './actionView'

@Component
export default struct ListItemView{

  @Prop obj:SysUser
  @Prop index:number
  build() {
    Column(){
        commonRow({title:"编号",val:`${this.index}`})
        commonRow({title:"用户名称",val:this.obj.user_name})
        commonRow({title:'账号',val:this.obj.nick_name})
        commonRow({title:'手机号',val:this.obj.phonenumber})
        commonRow({title:'状态',val:this.obj.status===1?'停用':'正常'})
        commonRow({title:'创建时间',val:this.obj.create_time})
        actionView({item:this.obj})
    }.margin({bottom:10})
    .borderRadius(20).width('100%')
    .height(220)
  }

}