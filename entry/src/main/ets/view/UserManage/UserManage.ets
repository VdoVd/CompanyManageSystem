import { httpClass } from '../../common/http/req'
import { allResponse, login, SysUser } from '../../common/Model'
import searchView from './searchView'
import ListView from './ListView'
import navHeader from '../../common/components/navHeader'
import {deleteByNameDialog} from '../../common/dialog'
import { promptAction } from '@kit.ArkUI'
import middleText from '../../common/middleText'
import { updateUser, updateUserInterface } from '../../common/http/manageSystem'

@Component
export default struct UserManage{

  public name:string='用户管理'
  @State list:SysUser[]=[]
  @State isClickSearch:boolean=false
  @State isClickUser:boolean=false
  @State isClickList:boolean=true
  @State loadingSearch:boolean=true
  @Provide @Watch("deleteByNameFunc") deleteName:string=''
  @Provide  obj:SysUser={} as SysUser
  @Provide @Watch('updateUserFunc') updateDialogFlag:boolean=false
  @Provide
  username:string=''

  @Provide
  phonenumber:string=''

  @Provide
  state:number=0

  @Provide
  createTime:Date=new Date()

  deleteByNameFunc(){
    if(this.deleteName!='')
    this.deleteByNameController.open()
    else
      this.getData()
  }

  async updateUserFunc(){
    if(this.updateDialogFlag){

      this.updateController.open()

    }else {

      let theObj:updateUserInterface={} as updateUserInterface
      theObj.nickname=this.obj.user_name
      theObj.username=this.obj.nick_name
      theObj.status=this.obj.status.toString()
      theObj.phonenumber=this.obj.phonenumber
      const res=await updateUser(theObj)

      if(res){
        promptAction.showDialog({message:'update success'})
      }else{
        promptAction.showDialog({message:'update failed'})
      }

      this.getData()

    }

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

    let url = `/user/find?username=${this.username}&state=${this.state}&phonenumber=${this.phonenumber}`

    const res = await httpClass.get<SysUser[]>(url)

    this.list = res

    console.log(`search res:${JSON.stringify(this.list)}`)

    this.isClickList = true
  }

  async aboutToAppear(): Promise<void> {

    await this.getData()

  }

  private async getData() {

    this.loadingSearch = true

    console.log('req')

    this.list = JSON.parse((await httpClass.get<SysUser[]>('/users')).toString()) as SysUser[]

    console.log('req')

    this.loadingSearch = false

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
      Button('test').onClick(()=>{
        promptAction.showDialog({message:`${JSON.stringify(this.obj)}`})
      })
      navHeader({isShow:this.isClickUser,title:'用户'})
      if(this.isClickUser) {
        Button('添加用户')
      }

      navHeader({isShow:this.isClickList,title:'用户列表'})
      if(this.isClickList){
        if(this.loadingSearch===false)
          ListView({list:this.list}).height('80%')
      }

    }.height('100%')
    .justifyContent(FlexAlign.Start)
  }

}

@CustomDialog
export  struct updateUserDialog{

  controller:CustomDialogController
  @Consume obj:SysUser
  @State tmp:SysUser=this.obj
  @Consume updateDialogFlag:boolean
  @State username:string=this.tmp.user_name
  @State nickname:string=this.tmp.nick_name
  @State phonenumber:string=this.tmp.phonenumber
  @State status:string=this.tmp.status.toString()
  build() {

    Column({space:15}){
      Row({space:15}){
        middleText({name:'用户名称'})
        TextInput({text:$$this.username})
          .onChange(()=>{
            this.tmp.user_name=this.username
          }).layoutWeight(1)

      }
      Row({space:15}){
        middleText({name:'账号'})
        TextInput({text:$$this.nickname})
          .onChange(()=>{
            this.tmp.nick_name=this.nickname
          }).layoutWeight(1)

      }
      Row({space:15}){
        middleText({name:'手机号码'})
        TextInput({text:$$this.phonenumber})
          .onChange(()=>{
            this.tmp.phonenumber=this.phonenumber
          }).layoutWeight(1)

      }
      Row({space:15}){
        middleText({name:'状态'})
        TextInput({text:$$this.status})
          .onChange(()=>{
            this.tmp.status=parseInt(this.status)
          }).layoutWeight(1)

      }
      Row({space:15}){
        Button('取消')
          .onClick(()=>{
            this.updateDialogFlag=false
            this.obj=this.tmp
            this.controller.close()
          })
        Button('确定')
          .onClick(()=>{
            this.updateDialogFlag=false
            this.obj=this.tmp
            this.controller.close()
          })
      }
    }.width('85%').padding(20)

  }

}