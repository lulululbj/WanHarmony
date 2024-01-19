import { DOMAIN, getArticleList, getBanner, getTopArticleList, TAG } from '../../viewmodel/Net'
import hilog from '@ohos.hilog'
import { BannerEntity } from '../../model/entity/BannerEntity'
import Log from '../../utils/Log'
import { ArticleEntity } from '../../model/entity/ArticleEntity'
import { ArticleView } from '../ArticleView'
import { PullToRefresh } from '@ohos/pulltorefresh'
import router from '@ohos.router'

@Component
export struct HotPage {
  @State bannerList: BannerEntity[] = []
  @State articleList: ArticleEntity[] = []
  pageNumber: number = 0
  private scroller: Scroller = new Scroller();

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

  aboutToAppear() {
    this.getBannerData()
    this.refreshArticle()
  }

  @Builder
  getArticleList() {
    List({ scroller: this.scroller }) {
      ListItem() {
        Banner({ bannerList: this.bannerList })
      }
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
      getArticleList(this.pageNumber).then((list: ArticleEntity[]) => {
        this.articleList = this.articleList.concat(list)
        resolve('刷新成功')
      }).catch((err: Error) => {
        Log.error('getArticleList failed', err.message)
        resolve('刷新失败')
      })

      getTopArticleList().then((list: ArticleEntity[]) => {
        let result: ArticleEntity[] = []
        result = result.concat(list)
        result = result.concat(this.articleList)
        this.articleList = result
      }).catch((err: Error) => {
        Log.error('getTopArticleList failed', err.message)
      })
    })
  }

  loadMore(): Promise<string> {
    return new Promise((resolve, reject) => {
      this.pageNumber++
      getArticleList(this.pageNumber).then((list: ArticleEntity[]) => {
        this.articleList = this.articleList.concat(list)
        resolve('加载成功')
      }).catch((err: Error) => {
        reject('加载失败')
        Log.error('getArticleList failed', err.message)
      })
    })
  }

  getBannerData() {
    getBanner().then((list: BannerEntity[]) => {
      this.bannerList = list
    }).catch((err: Error) => {
      Log.error('getBanner failed', err.message)
    })
  }
}


@Component
struct Banner {
  @Prop bannerList: BannerEntity[]

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerEntity) => {
        Image(item.imagePath)
          .width('90%')
          .aspectRatio(2)
          .objectFit(ImageFit.Cover)// .alt($r('app.media.icon'))
          .onClick(() => {
            hilog.debug(DOMAIN, TAG, `show image: ${item.imagePath}`)
          })
      }, (item: BannerEntity) => {
        return item.id.toString()
      })
    }
    .width('100%')
    .padding(10)
    .autoPlay(true)
    .interval(2000)
    .visibility(this.bannerList.length > 0 ? Visibility.Visible : Visibility.Hidden)
  }
}

@Preview
@Component
struct PreviewHomePage {
  build() {
    HotPage()
  }
}