import router from '@ohos.router'

@Entry
@Component
export struct  Page1 {
  @State message: string = 'Hello, World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text("Next")
        }
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .backgroundColor('#12345678')
        .width('30%')
        .height('6%')
        .onClick(() => {
          console.info("-----> clicked")
          router.pushUrl({ url: 'pages/Second' })
            .then(() => {
              console.info('-----> jumping...')
            })
            .catch((err) => {
              console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
            })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}