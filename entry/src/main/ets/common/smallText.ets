@Component
export default struct smallText{
  @Prop name:string='未定义'
  @Prop color:Color|string=Color.Blue
  @Prop textAlign:TextAlign=TextAlign.Start
  build() {
    Text(this.name).fontSize(12).fontColor(this.color).textAlign(TextAlign.Center)
  }
}