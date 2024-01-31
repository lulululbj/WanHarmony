import { PullToRefresh } from '@ohos/pulltorefresh'
import { ArticleEntity } from '../../model/entity/ArticleEntity'
import { TutorialEntity } from '../../model/entity/TutorialEntity'
import { jumpToWeb } from '../../utils/Common'
import Log from '../../utils/Log'
import { getBlogArticleList } from '../../viewmodel/Net'
import { ArticleView } from '../ArticleView'

@Component
export struct BlogDetailPage {
  blogEntity: TutorialEntity
  @State articleList: ArticleEntity[] = []
  pageNumber: number = 1
  private scroller: Scroller = new Scroller()

  aboutToAppear() {
    this.refreshArticle()
  }

  build() {
    PullToRefresh({
      data: $articleList,
      scroller: this.scroller,
      customList: () => {
        this.getArticleList()
      },
      onRefresh: () => {
        return this.refreshArticle()
      },
      onLoadMore: () => {
        return this.loadMore()
      },
      customRefresh: null,
      customLoad: null
    })
  }

  @Builder
  getArticleList() {
    List({ scroller: this.scroller }) {
      ForEach(this.articleList, (item: ArticleEntity) => {
        ListItem() {
          Column() {
            Shape() {
              Rect().width('100%').height(8).fill($r('app.color.color_f2f3f5'))
            }

            ArticleView({ article: item })
              .onClick(() => {
                jumpToWeb(item)
              })
          }
        }
      })
    }
    .height('100%')
    .width('100%')
    .edgeEffect(EdgeEffect.None)
  }

  refreshArticle(): Promise<string> {
    return new Promise((resolve, reject) => {
      this.articleList = []
      this.pageNumber = 0
      getBlogArticleList(this.blogEntity.id, this.pageNumber).then((list: ArticleEntity[]) => {
        this.articleList = this.articleList.concat(list)
        resolve('刷新成功')
      }).catch((err: Error) => {
        Log.error('getBlogArticleList failed', err.message)
        resolve('刷新失败')
      })
    })
  }

  loadMore(): Promise<string> {
    return new Promise((resolve, reject) => {
      this.pageNumber++
      getBlogArticleList(this.blogEntity.id, this.pageNumber).then((list: ArticleEntity[]) => {
        this.articleList = this.articleList.concat(list)
        resolve('加载成功')
      }).catch((err: Error) => {
        reject('加载失败')
        Log.error('getBlogArticleList failed', err.message)
      })
    })
  }
}