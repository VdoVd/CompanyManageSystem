import { httpClass } from '../../common/http/req'
import { SysUser } from '../../common/Model'
import searchView from './searchView'
import ListView from './ListView'
import navHeader from '../../common/navHeader'

@Component
export default struct UserManage{

  public name:string='用户管理'

  @State list:SysUser[]=[]
  @State isClickSearch:boolean=false
  @State isClickUser:boolean=false
  @State isClickList:boolean=true
  @State loadingSearch:boolean=true

  @Provide
  username:string=''
  @Provide
  phoneNumber:string=''
  @Provide
  state:number=0
  @Provide
  createTime:Date=new Date()

  searchUser(){

      let url=`/user/find?username=${this.username}&state=${this.state}&phonenumber=${this.phoneNumber}`

      const res = httpClass.get<string>(url)


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