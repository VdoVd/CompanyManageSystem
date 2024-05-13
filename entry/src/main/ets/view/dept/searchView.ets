import searchItemView from './searchItemView'

@Component
export default struct searchView{

  @Consume username:string
  @Consume phonenumber:string
  @Consume state:number
  @Consume createTime:Date
  build() {
    Column({space:15}){

      searchItemView({name:'部门名称',value:this.username})



    }.padding(15)
  }


}