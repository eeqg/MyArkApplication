import { Page1 } from './Page1'
import { Page2 } from './Page2'
import { Page3 } from './Page3'
import { Page4 } from './Page4'

@Entry //@Entry装饰的自定义组件将作为UI页面的入口(即页面的根节点)。在单个UI页面中，最多可以使用@Entry装饰一个自定义组件。
@Component //@Component装饰器仅能装饰struct关键字声明的数据结构。struct被@Component装饰后具备组件化的能力，需要实现build方法描述UI，一个struct只能被一个@Component装饰。
struct Index {
  @State currentIndex: number = 0

  build() { //UI描述
    Column() {
      Tabs({ index: this.currentIndex, barPosition: BarPosition.End }) {
        //page1
        TabContent() {
          Page1()
        }
        .tabBar(this.tabBuilder(0, "page1", $r('app.media.me_normal'), $r('app.media.me_selected')))

        //page2
        TabContent() {
          Page2()
        }
        .tabBar(this.tabBuilder(1, "page2", $r('app.media.me_normal'), $r('app.media.me_selected')))

        TabContent() {
          Page3()
        }
        .tabBar(this.tabBuilder(2, "Page3", $r('app.media.me_normal'), $r('app.media.me_selected')))

        TabContent() {
          Page4()
        }
        .tabBar(this.tabBuilder(3, "Page4", $r('app.media.me_normal'), $r('app.media.me_selected')))
      }
      .barMode(BarMode.Fixed)
      .onChange((index) => {
        this.currentIndex = index
      })
    }
  }

  //组件生命周期
  //组件即将出现时回调该接口，具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行
  aboutToAppear(){
    console.info("-----aboutToAppear: WeChatTitle")
  }

  //页面生命周期
  //页面每次显示时触发一次，包括路由过程、应用进入前台等场景
  onPageShow() {
    console.info('Index onPageShow');
  }

  //页面每次隐藏时触发一次，包括路由过程、应用进入后台等场景
  onPageHide() {
    console.info('Index onPageHide')
  }

  //点击返回按钮时触发
  onBackPress() {
    console.info('Index onBackPress')
  }

  //在组件析构销毁之前执行
  aboutToDisappear(){
    console.info("-----aboutToDisappear: WeChatTitle")
  }

  @Builder tabBuilder(index: number, title: string, normalImage: Resource, selectedImage: Resource) {
    Column() {
      Image(this.currentIndex == index ? selectedImage : normalImage).size({ width: 25, height: 25 })
      Text(title).fontColor(this.currentIndex == index ? '#1698CE' : '#6B6B6B')
    }
    .width(100)
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}