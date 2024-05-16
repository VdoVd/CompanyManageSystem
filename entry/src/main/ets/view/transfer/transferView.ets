import navHeader from '../../common/components/navHeader'
import searchView from '../../common/components/searchView'
import showAllList from '../../common/components/showAllList'
import { GetAllMenu, GetSearchMenus } from '../../common/http/menu'

export interface searchIt{
  name:string
  phone:string
}

export class  showAll implements searchIt{
  phone: string=''
  name:string='空'
  clue_num:string=''
  opportunity_num:string=''
  create_time:string=''

}

@Component
export default struct transferVIew{

  @Provide
  searchData:searchIt={
    name:'菜单名称',
    phone:'手机号码'
  }

  showAllObj:showAll= {
    name: '角色名称',
    phone: '手机号码',
    clue_num: '线索数量',
    opportunity_num: '商机数量',
    create_time: '创建时间'
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
    if(this.searchFlag===false){

    }
    // this.allList = await GetAllMenu()
  }

  async startSearchFunc(){

    this.isShowAll=false
    console.log(`search data:${JSON.stringify(this.searchData)} values:${JSON.stringify(this.sv)}`)
    // this.allList=[...await GetSearchRoles(this.searchData,this.sv)]
    // this.allList = await GetSearchMenus(this.searchData,this.sv)

    console.log(`start search:${this.allList}`)
    this.isShowAll=true
    this.searchFlag=false
  }

  build() {

    Column(){

      navHeader({title:'搜索转派', isShow:this.isShowSearch})

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