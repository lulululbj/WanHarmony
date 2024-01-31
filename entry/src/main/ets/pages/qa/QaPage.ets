import router from '@ohos.router'
import { ArticleEntity } from '../../model/entity/ArticleEntity'
import { jumpToWeb } from '../../utils/Common'
import { getQAList } from '../../viewmodel/Net'
import { ArticleView } from '../ArticleView'

@Component
export struct QaPage {
  @State articleList: ArticleEntity[] = []
  private scroller: Scroller = new Scroller();
  private pageNumber: number = 0

  aboutToAppear() {
    getQAList(this.pageNumber).then((data: ArticleEntity[]) => {
      this.articleList = data
    })
  }

  build() {
    List({ scroller: this.scroller }) {
      ForEach(this.articleList, (item: ArticleEntity) => {
        ListItem() {
          Column() {
            Shape() {
              Rect().width('100%').height(8).fill($r('app.color.color_f2f3f5'))
            }

            ArticleView({ article: item })
              .onClick(() => {
                router.pushUrl({
                  url: "pages/qa/QaDetailPage",
                  params: item
                })
              })
          }
        }
      })
    }
    .height('100%')
    .width('100%')
    .edgeEffect(EdgeEffect.None)
  }
}