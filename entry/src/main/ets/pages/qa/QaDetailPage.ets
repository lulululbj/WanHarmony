import router from '@ohos.router'
import webview from '@ohos.web.webview'
import { ArticleEntity } from '../../model/entity/ArticleEntity'
import { TitleComponent } from '../TitleComponent'

import { getQACommentList } from '../../viewmodel/Net'
import { QaCommentEntity } from '../../model/entity/QaCommnetEntity'
import { QaCommentComponent } from './QaCommentComponent'

const articleEntity = router.getParams() as ArticleEntity


@Entry
@Component
export struct QaDetailPage {
  @State qaCommentEntityData: QaCommentEntity[] = []

  aboutToAppear() {
    getQACommentList(articleEntity.id)
      .then((data: QaCommentEntity[]) => {
        this.qaCommentEntityData = data
      })
  }

  build() {
    Column() {
      TitleComponent({ title: "问答详情" })

      Text(articleEntity.title)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
        .fontColor(Color.Black)
        .padding(16)


      List({ space: 16 }) {

        ListItem() {
          Row() {
            Text(articleEntity.author)
              .fontSize(16)
              .fontColor($r('app.color.color_666666'))
              .fontWeight(FontWeight.Bold)
            Text(articleEntity.niceDate)
              .fontSize(16)
              .fontColor($r('app.color.color_666666'))
              .fontWeight(FontWeight.Bold)
              .margin({ left: 6 })
          }
          .margin({ left: 16, right: 16 })
        }

        ListItem() {
          Text(articleEntity.desc)
            .fontSize(16)
            .fontColor($r('app.color.color_333333'))
            .fontWeight(FontWeight.Bold)
            .margin(16)

          // 内部实现是 Web，没法高度自适应
          // RichText(articleEntity.desc)
        }

        ForEach(this.qaCommentEntityData, (item: QaCommentEntity) => {
          ListItem() {
            QaCommentComponent({ comment: item })
          }.margin(16)
        }, (item: QaCommentEntity) => {
          return item.id + ""
        })
      }
      .edgeEffect(EdgeEffect.None)
      .width('100%')
      .height('100%')

    }
    .alignItems(HorizontalAlign.Start)
  }
}