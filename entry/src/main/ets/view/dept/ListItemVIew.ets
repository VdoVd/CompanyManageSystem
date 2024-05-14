import commonRow from '../../common/commonRow'
import { dept } from '../../common/http/dept'
import { SysUser } from '../../common/Model'
import actionView from './actionView'

@Component
export default struct ListItemView{

  @Prop obj:dept
  @Prop index:number
  build() {
    Column(){
        commonRow({title:"编号",val:`${this.index}`})
        commonRow({title:"部门名称",val:this.obj.dept_name})
        commonRow({title:'部门id',val:this.obj.dept_id.toString()})
        commonRow({title:'负责人',val:this.obj.leader})
        commonRow({title:'手机号',val:this.obj.phone})
        commonRow({title:'部门状态',val:this.obj.status==="1"?'停用':'正常'})
        commonRow({title:'邮箱',val:this.obj.email})
        actionView({item:this.obj})
    }.margin({bottom:10})
    .borderRadius(20).width('100%')
    .height(240)
  }

}