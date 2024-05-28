import router from '@ohos.router'
@Entry
@Component
struct Second {
  @State message: string = '123456'

  build() {
    Row() {
      Column() {
        //Image('https://pic.qqtn.com/up/2017-12/15132234796094190.jpg')
        Image($r('app.media.back_mine')).width("100%").height('300vp')
        Text(this.message).fontSize(30).fontColor('#ff6637').fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
        }
        .margin({ top: 20 })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          //router.back()
          try {
            // 返回第一页
            router.back()
            console.info('Succeeded in returning to the first page.')
          } catch (err) {
            console.error(`Failed to return to the first page.Code is ${err.code}, message is ${err.message}`)
          }
        })
      }.width('100%')
    }
    .height('100%')
  }
}