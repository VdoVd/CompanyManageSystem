import navHeader from '../../common/components/navHeader'
import searchView from '../../common/components/searchView'
import showAllList from '../../common/components/showAllList'
import { GetAllMenu, GetSearchMenus } from '../../common/http/menu'

export interface searchIt{
  cid:string
  phone:string
}

export class  showAll implements searchIt{
  cid: string=''
  name:string=''
  goodSubject:string=''
  goodCourse:string=''
  phone: string=''
  create_time:string=''

}

@Component
export default struct contractVIew{

  @Provide
  searchData:searchIt={
    cid:'合同编号',
    phone:'手机号'
  }

  showAllObj:showAll= {
    name: '客户姓名',
    cid: '合同编号',
    goodSubject: '购买学科',
    goodCourse: '购买课程',
    phone: '手机号',
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

      navHeader({title:'搜索合同', isShow:this.isShowSearch})

      if(this.isShowSearch===true)
        searchView({startSearch:()=>{
          this.startSearchFunc()
        }})

      navHeader({isShow:this.isShowAll,title:'全部合同'})
        .margin({bottom:15})

      if(this.isShowAll){

        showAllList({dataModel:this.allList})
          .layoutWeight(1)

      }

    }.height('100%')

  }

}