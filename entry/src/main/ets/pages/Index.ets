@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text('Index').width('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}