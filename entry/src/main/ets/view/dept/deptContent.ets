import { allResponse, login, SysUser, updateDeptInterface } from '../../common/Model'
import searchView from './searchView'
import ListView from './ListView'
import navHeader from '../../common/components/navHeader'
import {deleteByNameDialog} from '../../common/dialog'
import { promptAction } from '@kit.ArkUI'
import middleText from '../../common/middleText'
import { deleteDepReq, dept, findDept, getAllDept, updateDeptReq } from '../../common/http/dept'

@Component
export default struct deptContent{

  public name:string='部门管理'
  @State list:SysUser[]=[]
  @State deptList:dept[]=[]
  @State isClickSearch:boolean=false
  @State isClickDept:boolean=false
  @State isClickList:boolean=true
  @State loadingSearch:boolean=true
  @Provide @Watch("deleteByIdFunc") deleteId:string=''
  @Provide  obj:dept={} as dept
  @Provide
  username:string=''

  @Provide
  phonenumber:string=''

  @Provide
  state:number=0

  @Provide
  createTime:Date=new Date()

  @Provide @Watch("updateDept") updateDeptFlag:boolean=false

  async deleteByIdFunc(){
    if(this.deleteId!='')
    {
      let deleteObj:updateDeptInterface={name:this.obj.dept_name,id:this.obj.dept_id.toString(),status:this.obj.status,leader:this.obj.leader,phone:this.phonenumber}
      const res =await deleteDepReq(deleteObj)
      if(res){
        promptAction.showToast({message:'删除成功'})
      }else {
        promptAction.showToast({message:'删除失败'})
      }
      this.deleteId=''
    }
    else
      this.getData()
  }


  deleteByNameController:CustomDialogController=new CustomDialogController({
    builder:deleteByNameDialog(),
    alignment:DialogAlignment.Center
  })

  updateController:CustomDialogController=new CustomDialogController({
    builder:updateUserDialog(),
    alignment:DialogAlignment.Center
  })

  async searchUser(){

    await this.getSearchData()
    this.username=''
    this.phonenumber=''
    this.state=0
    this.isClickSearch=false
  }

  private async getSearchData() {

    this.isClickList = false

    let url = `/dept/find?username=${this.username}`


    this.deptList =[await findDept(this.username)]

    console.log(`search res:${JSON.stringify(this.list)}`)

    this.isClickList = true
  }

  async aboutToAppear(): Promise<void> {

    this.deptList=await getAllDept()
    promptAction.showDialog({message:`${JSON.stringify(this.deptList[0])}`})
    this.loadingSearch=false

  }

  private async getData() {

    this.loadingSearch = true

    console.log('req')

    this.deptList=await getAllDept()

    console.log('req')

    this.loadingSearch = false

  }

  private async updateDept(){

    if(this.updateDeptFlag){
      this.updateController.open()

    }else{
      const res = await updateDeptReq(this.obj.dept_name,this.obj.leader,this.obj.phone,this.obj.status,this.obj.dept_id.toString())

      if(res){
        promptAction.showToast({message:'编辑部门成功'})
      }else {
        promptAction.showToast({message:'编辑部门失败'})
      }

      await this.getData()
    }
  }

  build() {
    Column({space:7}){

      navHeader({isShow:this.isClickSearch,title:'搜索'})
      if(this.isClickSearch===true)
      {
        searchView()
        Button('搜索').onClick(()=>{
          this.searchUser()
        })
      }

      navHeader({isShow:this.isClickDept,title:'添加部门'})
      if(this.isClickDept) {
        Button('添加部门')
          .onClick(()=>{
            this.updateDeptFlag=true
          })
      }

      navHeader({isShow:this.isClickList,title:'部门列表'})
      if(this.isClickList){
        if(this.loadingSearch===false)
          ListView({list:this.deptList}).height('80%')
      }

    }.height('100%')
    .justifyContent(FlexAlign.Start)
  }

}

@CustomDialog
export  struct updateUserDialog{

  controller:CustomDialogController
  @Consume obj:dept
  @State tmp:dept=this.obj
  @Consume updateDeptFlag:boolean
  @State username:string=this.tmp.dept_name
  @State nickname:string=this.tmp.leader
  @State phonenumber:string=this.tmp.phone
  @State status:string=this.tmp.status.toString()

  build() {

    Column({space:15}){
      Row({space:15}){
        middleText({name:'用户名称'})
        TextInput({text:$$this.username})
          .onChange(()=>{
            this.tmp.dept_name=this.username
          }).layoutWeight(1)

      }
      Row({space:15}){
        middleText({name:'负责人'})
        TextInput({text:$$this.nickname})
          .onChange(()=>{
            this.tmp.leader=this.nickname
          }).layoutWeight(1)

      }
      Row({space:15}){
        middleText({name:'手机号码'})
        TextInput({text:$$this.phonenumber})
          .onChange(()=>{
            this.tmp.phone=this.phonenumber
          }).layoutWeight(1)

      }
      Row({space:15}){
        middleText({name:'状态'})
        TextInput({text:$$this.status})
          .onChange(()=>{
            this.tmp.status=this.status
          }).layoutWeight(1)

      }
      Row({space:15}){
        Button('取消')
          .onClick(()=>{
            this.updateDeptFlag=false
            this.obj=this.tmp
            this.controller.close()
          })
        Button('确定')
          .onClick(()=>{
            this.updateDeptFlag=false
            this.obj=this.tmp
            this.controller.close()
          })
      }
    }.width('85%').padding(20)

  }

}