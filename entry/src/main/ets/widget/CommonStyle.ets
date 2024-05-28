import { WeChatColor } from '../model/WeChatData'
@Component
export struct WeChatTitle {
  private text: string

  build() {
    Flex({justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center}) {
      Text(this.text)
        .fontSize('18fp')
        .padding('20px')
    }
    .height('120px')
    .backgroundColor(WeChatColor)
  }

  //组件生命周期
  //组件即将出现时回调该接口，具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行
  aboutToAppear(){
    console.info("-----aboutToAppear: WeChatTitle")
  }

  //在自定义组件析构销毁之前执行
  aboutToDisappear(){
    console.info("-----aboutToDisappear: WeChatTitle")
  }
}

@Component//@Component装饰器仅能装饰struct关键字声明的数据结构。struct被@Component装饰后具备组件化的能力，需要实现build方法描述UI，一个struct只能被一个@Component装饰。
export struct MyDivider {
  private style: string = ""

  build() {
    Row() {
      Divider()
        .vertical(false)
        .color(WeChatColor)
        .strokeWidth(this.style == "1" ? '3px' : '23px')
    }
    .height(this.style == "1" ? '3px' : '23px')
    .width('100%')
  }
}