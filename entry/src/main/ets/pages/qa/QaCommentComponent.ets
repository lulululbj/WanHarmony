import { QaCommentEntity } from '../../model/entity/QaCommnetEntity'
import { lvMarkdownIn, lvCode } from '@luvi/lv-markdown-in'
import webview from '@ohos.web.webview';

lvCode.setTheme("dark")

@Component
export struct QaCommentComponent {
  comment: QaCommentEntity

  build() {
    Column() {

      Row() {

        Text(this.comment.userName)
          .fontSize(14)
          .fontColor(Color.Blue)
        if (this.comment.toUserName.length == 0) {
          Text(this.comment.niceDate)
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ left: 4 })
        } else {
          Text(`: @${this.comment.toUserName}`)
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin({ left: 4})
        }
      }.margin({top: 8})

      if (this.comment.contentMd.length > 0) {
        lvMarkdownIn({ text: this.comment.contentMd })
          .margin({ top: 8 })
      } else {
        // 内部实现是 Web，没法高度自适应
        // RichText(this.comment.content)
        //   .backgroundColor(Color.Green)
        lvMarkdownIn({ text: this.comment.content })
          .margin({ top: 8 })
      }

      if (this.comment.replyComments.length > 0) {
        ForEach(this.comment.replyComments, (item: QaCommentEntity) => {
          QaCommentComponent({ comment: item })
        }, (item: QaCommentEntity) => {
          return item.id + ""
        })
      }
    }
    .alignItems(HorizontalAlign.Start)
  }
}