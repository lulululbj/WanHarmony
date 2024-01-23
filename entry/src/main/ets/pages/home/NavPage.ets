import router from '@ohos.router'
import { ArticleEntity } from '../../model/entity/ArticleEntity'
import { NavData } from '../../model/entity/NavData'
import { getNavigationData } from '../../viewmodel/Net'

@Component
export struct NavPage {
  @State navData: NavData[] = []
  @State leftScrollIndex: number = 0
  private leftScroller: Scroller = new Scroller()
  private rightScroller: Scroller = new Scroller()

  aboutToAppear() {
    getNavigationData().then((data: NavData[]) => {
      this.navData = data
    })
  }

  build() {
    Row() {
      List({scroller: this.leftScroller}) {
        ForEach(this.navData, (item: NavData,index: number) => {
          ListItem() {
            Text(item.name)
              .fontColor(Color.Black)
              .height(30)
              .borderRadius(12)
              .backgroundColor($r('app.color.color_f2f3f5'))
              .padding({ left: 6, right: 6, top: 4, bottom: 4 })
              .onClick(() => {
                this.rightScroller.scrollToIndex(index)
              })
          }.margin({ bottom: 8 })
        }, (item: NavData) => {
          return item.cid + ""
        })
      }
      .width(100)
      .height('100%')
      .alignListItem(ListItemAlign.Center)
      .onScrollIndex((firstIndex: number) => {
        this.rightScroller.scrollToIndex(firstIndex)
      })

      Divider()
        .width(2)
        .height('100%')
        .backgroundColor(Color.Grey)

      List({scroller: this.rightScroller}) {
        ForEach(this.navData, (item: NavData) => {

          ListItem() {
            Column() {
              Text(item.name)
                .fontSize(20)
                .padding({ top: 8, bottom: 8 })

              Flex({ wrap: FlexWrap.Wrap }) {
                ForEach(item.articles, (item: ArticleEntity) => {
                  Text(item.title)
                    .fontColor(Color.Black)
                    .height(30)
                    .borderRadius(12)
                    .backgroundColor($r('app.color.color_f2f3f5'))
                    .padding({ left: 6, right: 6, top: 4, bottom: 4 })
                    .margin(4)
                    .onClick(() => {
                      router.pushUrl({
                        url: 'pages/WebPage',
                        params: item
                      }, router.RouterMode.Single)
                    })
                }, (item: ArticleEntity) => {
                  return item.id + ""
                })
              }
            }
            .alignItems(HorizontalAlign.Start)
          }.margin({ top: 4, bottom: 4 })
        }, (item: NavData) => {
          return item.cid + ""
        })
      }
      .margin({ left: 8 })
      .width('100%')
      .height('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .padding({ top: 8, bottom: 8 })
  }
}