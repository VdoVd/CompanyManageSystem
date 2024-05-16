import navHeader from '../../common/components/navHeader'
import searchView from '../../common/components/searchView'
import showAllList from '../../common/components/showAllList'
import { GetAllMenu, GetSearchMenus } from '../../common/http/menu'

export interface searchIt{
  name:string
  status:string
}

export class  showAll{
  name:string='空'
  status:string='空'
  perms?:string='空'
  component?:string='空'
  time:string='空'
}

@Component
export default struct menuVIew{

  @Provide
  searchData:searchIt={
    name:'菜单名称',
    status:'菜单状态'
  }

  showAllObj:showAll={
    name:'角色名称',
    status:'状态',
    perms:'权限标识',
    component:'组件地址',
    time:'时间',

  }

  @State isShowSearch:boolean=false
  @Provide @Watch("getAllData") isShowAll:boolean=false
  @Provide allList:showAll[]=[]
  @Provide AllKeys:string[]=Object.values(this.showAllObj)
  @Provide searchFlag:boolean=false
  @Provide sv:string[]=[]

  async aboutToAppear(): Promise<void> {
    await this.getAllData()
    // this.allList=await GetAllRole('/role/all')

  }

  private async getAllData() {
    if(this.searchFlag===false)
    this.allList = await GetAllMenu()
  }

  async startSearchFunc(){

    this.isShowAll=false
    console.log(`search data:${JSON.stringify(this.searchData)} values:${JSON.stringify(this.sv)}`)
    // this.allList=[...await GetSearchRoles(this.searchData,this.sv)]
    this.allList = await GetSearchMenus(this.searchData,this.sv)

    console.log(`start search:${this.allList}`)
    this.isShowAll=true
    this.searchFlag=false
  }

  build() {

    Column(){

      navHeader({title:'搜索菜单', isShow:this.isShowSearch})

      if(this.isShowSearch===true)
        searchView({startSearch:()=>{
          this.startSearchFunc()
        }})

      navHeader({isShow:this.isShowAll,title:'全部菜单'})
        .margin({bottom:15})

      if(this.isShowAll){

        showAllList({dataModel:this.allList})
          .layoutWeight(1)

      }

    }.height('100%')

  }

}