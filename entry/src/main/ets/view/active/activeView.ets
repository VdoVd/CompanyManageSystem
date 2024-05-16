import navHeader from '../../common/components/navHeader'
import searchView from '../../common/components/searchView'
import showAllList from '../../common/components/showAllList'
import { GetAll, GetSearch } from '../../common/http/active'
import { GetAllMenu, GetSearchMenus } from '../../common/http/menu'

export interface searchIt{
  activeNum:string
  src:string
}

export class  showAll{
  activeNum:string='空'
  src:string='空'
  intro:string='空'
  detail?:string='空'
  create_time:string='空'
  end_time:string='空'
}

@Component
export default struct activeVIew{

  @Provide
  searchData:searchIt={
    activeNum:'活动编号',
    src:'渠道来源'
  }

  showAllObj:showAll={
    activeNum:'活动编号',
    intro:'活动介绍',
    detail:'活动明细',
    src:'渠道来源',
    create_time:'开始时间',
    end_time:'结束时间'
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
      this.allList = await GetAll()

    }
  }

  async startSearchFunc(){

    this.isShowAll=false
    console.log(`search data:${JSON.stringify(this.searchData)} values:${JSON.stringify(this.sv)}`)
    this.allList=[...await GetSearch(this.searchData,this.sv)]
    // this.allList = await GetSearchMenus(this.searchData,this.sv)

    console.log(`start search:${this.allList}`)
    this.isShowAll=true
    this.searchFlag=false
  }

  build() {

    Column(){

      navHeader({title:'搜索活动', isShow:this.isShowSearch})

      if(this.isShowSearch===true)
        searchView({startSearch:()=>{
          this.startSearchFunc()
        }})

      navHeader({isShow:this.isShowAll,title:'全部活动'})
        .margin({bottom:15})

      if(this.isShowAll){

        showAllList({dataModel:this.allList})
          .layoutWeight(1)

      }

    }.height('100%')

  }

}