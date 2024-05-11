import smallText from './smallText'
import { getRGB } from './util'

@Component
export default struct commonRow{
  @Prop title:string
  @Prop val:string
  build() {
    Row(){
      smallText({name:this.title,color:Color.White}).width('30%').padding({left:15}).backgroundColor(getRGB())
        .padding(7)
      smallText({name:this.val,color:Color.White}).width('70%').backgroundColor(getRGB())
        .padding(7)
    }
    .width('85%')
  }
}