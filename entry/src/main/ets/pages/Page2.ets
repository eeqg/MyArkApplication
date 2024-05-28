import { WeChatTitle } from '../widget/CommonStyle'
import { ContactItem } from '../widget/WCContactItem'
import { getContactInfo, WeChatColor } from '../model/WeChatData'

@Entry
@Component
export struct Page2 {

  private  contactsInfo = getContactInfo()

  build() {
    Column() {

      WeChatTitle({ text: '通讯录' })

      Scroll() {
        Column() {
          ContactItem({ imageSrc: "new_friend.png", text: "新的朋友" })
          ContactItem({ imageSrc: "group.png", text: "群聊" })
          ContactItem({ imageSrc: "biaoqian.png", text: "标签" })
          ContactItem({ imageSrc: "gonzh.png", text: "公众号" })

          // 企业联系人
          Text("      我的企业及企业联系人")
            .fontSize('12fp')
            .backgroundColor(WeChatColor)
            .height('80px')
            .width('100%')
          ContactItem({ imageSrc: "qiye.png", text: "企业微信联系人" })

          // 微信好友
          Text("      我的微信好友")
            .fontSize('12fp')
            .backgroundColor(WeChatColor)
            .height('80px')
            .width('100%')


          List() {
            ForEach(this.contactsInfo, (item) => {
              ListItem() {
                ContactItem({ imageSrc: item.portrait, text: item.nickName })
              }
            }, item => item.userId.toString())
          }
        }
      }
    }
  }
}