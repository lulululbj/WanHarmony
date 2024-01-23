import router from '@ohos.router'
import { ArticleEntity } from '../../model/entity/ArticleEntity'
import { NavData } from '../../model/entity/NavData'
import { getNavigationData } from '../../viewmodel/Net'
import { FlowLayout, FlowLayoutConfig } from '@luyao/flowlayout'

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
      this.leftList()

      Divider()
        .width(2)
        .height('100%')
        .backgroundColor(Color.Grey)

      this.rightList()
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

  @Builder
  leftList() {
    List({ scroller: this.leftScroller }) {
      ForEach(this.navData, (item: NavData, index: number) => {
        ListItem() {
          Text(item.name)
            .fontColor(Color.Black)
            .fontSize(16)
            .height(30)
            .borderRadius(12)
            .backgroundColor($r('app.color.color_f2f3f5'))
            .padding({ left: 8, right: 8, top: 6, bottom: 6 })
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
  }

  @Builder
  rightList() {
    List({ scroller: this.rightScroller }) {
      ForEach(this.navData, (item: NavData, index: number) => {
        ListItem() {
          Column() {
            Text(item.name)
              .fontSize(20)
              .padding({ top: 8, bottom: 8 })

            FlowLayout({
              data: item.articles.map((it: ArticleEntity) => {
                return it.title
              }),
              flowLayoutConfig: new FlowLayoutConfig()
                .setItemFontSize(16)
                .setItemNormalFontColor(Color.Black)
                .setItemSelectedFontColor(Color.White)
                .setItemHeight(30)
                .setItemNormalBgColor($r('app.color.color_f2f3f5'))
                .setItemSelectedBgColor(Color.Green)
                .setItemPadding({ left: 6, right: 6, top: 4, bottom: 4 })
                .setItemMargin(4)
                .setItemBorderRadius(12),
              clickListener: (index: number) => {
                router.pushUrl({
                  url: 'pages/WebPage',
                  params: item.articles[index]
                }, router.RouterMode.Single)
              }
            })
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
}