import { ArticleEntity } from '../../model/entity/ArticleEntity';
import { ArticleView } from '../ArticleView'
import { PullToRefresh } from '@ohos/pulltorefresh'
import router from '@ohos.router';
import Log from '../../utils/Log';
import { getSquareArticleList } from '../../viewmodel/Net';

@Component
export struct SquarePage {
  @State articleList: ArticleEntity[] = []
  pageNumber: number = 0
  private scroller: Scroller = new Scroller();

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
                router.pushUrl({
                  url: 'pages/WebPage',
                  params: item
                }, router.RouterMode.Single)
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
      getSquareArticleList(this.pageNumber).then((list: ArticleEntity[]) => {
        this.articleList = this.articleList.concat(list)
        resolve('刷新成功')
      }).catch((err: Error) => {
        Log.error('getArticleList failed', err.message)
        resolve('刷新失败')
      })
    })
  }

  loadMore(): Promise<string> {
    return new Promise((resolve, reject) => {
      this.pageNumber++
      getSquareArticleList(this.pageNumber).then((list: ArticleEntity[]) => {
        this.articleList = this.articleList.concat(list)
        resolve('加载成功')
      }).catch((err: Error) => {
        reject('加载失败')
        Log.error('getArticleList failed', err.message)
      })
    })
  }
}