import navHeader from '../../common/components/navHeader'
import searchView from '../../common/components/searchView'
import showAllList from '../../common/components/showAllList'
import { GetAllRole, GetSearchRoles } from '../../common/http/role'

export interface searchRole{
  name:string
  status:string
}

export interface showAllRole{
  name:string
  role:string
  status:string
  time:string
}

@Component
export default struct roleVIew{

   @Provide
   searchData:searchRole={
    name:'角色名称',
    status:'角色状态'
  }

  showAllObj:showAllRole={
    name:'角色名称',
    role:'权限名称',
    status:'状态',
    time:'时间'
  }

  @State isShowSearch:boolean=false
  @Provide isShowAll:boolean=false
  @Provide allList:showAllRole[]=[]
  @Provide AllKeys:string[]=Object.values(this.showAllObj)
  @Provide searchFlag:boolean=false
  @Provide sv:string[]=[]

  async aboutToAppear(): Promise<void> {

    this.allList=await GetAllRole('/role/all')

  }

  async startSearchFunc(){

    this.isShowAll=false
    console.log(`search data:${JSON.stringify(this.searchData)} values:${JSON.stringify(this.sv)}`)
    this.allList=[...await GetSearchRoles(this.searchData,this.sv)]
    console.log(`start search:${this.allList}`)
    this.isShowAll=true
    this.searchFlag=false
  }

  build() {

    Column(){

      navHeader({title:'搜索角色', isShow:this.isShowSearch})

      if(this.isShowSearch===true)
      searchView({startSearch:()=>{
        this.startSearchFunc()
      }})

      navHeader({isShow:this.isShowAll,title:'全部角色'})
        .margin({bottom:15})

      if(this.isShowAll){

        showAllList({dataModel:this.allList})
          .layoutWeight(1)

      }

    }.height('100%')

  }

}