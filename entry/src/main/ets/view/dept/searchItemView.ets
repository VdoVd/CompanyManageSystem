@Component
export default struct searchItemView{
  @Prop name:string=''
  @Link value:string|number|Date

  build() {
    Row({space:10}){
      Text(this.name+':').fontSize(15)
      TextInput({placeholder:'请输入',text:$$this.value})
        .width('70%')
        .backgroundColor('rgba(0,0,0,0.3)')
    }.width('90%').justifyContent(FlexAlign.SpaceBetween)
  }

}