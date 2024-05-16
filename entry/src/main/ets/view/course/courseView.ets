import navHeader from '../../common/components/navHeader'
import searchView from '../../common/components/searchView'
import showAllList from '../../common/components/showAllList'
import { GetAllMenu, GetSearchMenus } from '../../common/http/menu'

export interface searchIt{
  cid:string
  courseName:string
}

export class  showAll implements searchIt{
  cid: string=''
  courseName: string=''
  subject:string=''
  price:string=''
  fit:string=''
  intro:string=''
  create_time:string=''
}

@Component
export default struct courseVIew{

  @Provide
  searchData:searchIt={
    cid:'课程编号',
    courseName:'课程名称'
  }

  showAllObj:showAll={
    cid:'课程编号',
    courseName:'课程名称',
    subject:'学科',
    price:'价格',
    fit:'适应人群',
    intro:'课程介绍',
    create_time:'创建时间'
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