import topPart from '../view/Index/topPart';

@Entry
@Component
struct Index {

  build() {
    Row() {
      Column() {
        topPart({img:$r('app.media.startIcon')})
      }
      .width('100%')
    }
    .height('100%')
  }
}