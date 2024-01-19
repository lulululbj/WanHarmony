import { ArticleEntity, getAuthorName } from '../model/entity/ArticleEntity'

@Component
export struct ArticleView {
  @Prop article: ArticleEntity

  build() {
    Column() {
      Text(this.article.title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Row() {
        Text(getAuthorName(this.article))
          .fontSize(12)
          .fontColor($r('app.color.color_999999'))
        if (this.article.top) {
          Text('置顶')
            .fontSize(8)
            .fontColor(Color.Red)
            .padding({ left: 4, right: 4 })
            .backgroundColor($r('app.color.white'))
            .border({ width: 1, color: Color.Red, radius: 2 })
        }
        if (this.article.fresh) {
          Text('新')
            .fontSize(8)
            .fontColor(Color.Red)
            .padding({ left: 4, right: 4 })
            .backgroundColor($r('app.color.white'))
            .border({ width: 1, color: Color.Red, radius: 2 })
        }
        Blank()
        Text(`${this.article.superChapterName}/${this.article.chapterName}`)
          .fontSize(12)
          .fontColor($r('app.color.color_999999'))

      }
      .width('100%')
      .margin({ top: 8 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.white'))
    .alignItems(HorizontalAlign.Start)
  }
}

