import searchItemView from './searchItemView'

@Component
export default struct searchView{

  @Consume username:string
  @Consume phonenumber:string
  @Consume state:number
  @Consume createTime:Date
  build() {
    Column({space:15}){

      searchItemView({name:'用户名称',value:this.username})

      searchItemView({name:'手机号',value:this.phonenumber})

      searchItemView({name:'状态',value:this.state})

    }.padding(15)
  }


}