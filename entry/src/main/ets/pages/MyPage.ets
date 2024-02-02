import router from '@ohos.router'

@Component
export struct MyPage {
  menus: string[] = ["收藏文章", "收藏网站", "分享文章", "分享项目"]
  @State currentTabIndex: number = 0
  private tabsController: TabsController = new TabsController()

  build() {
    Scroll() {
      Column() {

        Column() {
          Row() {
            Image($r('app.media.luyao'))
              .width(60)
              .height(60)
              .borderRadius(30)

            Text('登录')
              .fontSize(20)
              .fontColor($r('app.color.white'))
              .padding(16)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/login/LoginPage',
                }, router.RouterMode.Standard)
              })
          }
        }
        .padding(16)
        .width('100%')
        .aspectRatio(2)
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Center)
        .backgroundImage($r('app.media.luyao'))
        .backgroundBlurStyle(BlurStyle.Thin)

        // 暂时位置居中，无法在左边，api 10 会支持
        Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex, controller: this.tabsController }) {
          ForEach(this.menus, (item: string, index: number) => {
            TabContent() {

            }.tabBar(this.tabBuilder(index))
          }, (item: string) => {
            return item
          })
        }
        .width('100%')
        .barMode(BarMode.Scrollable)
        .onChange((index: number) => {
          this.currentTabIndex = index
        })
      }
      .width('100%')
      .height('100%')
    }
  }

  @Builder
  tabBuilder(index: number) {
    // Column() {
      Text(this.menus[index])
        .fontColor(this.currentTabIndex == index ? $r('app.color.black') : $r('app.color.color_999999'))
        .fontSize(14)
        .margin({ left: 8, right: 8 })
    //   Divider()
    //     .strokeWidth(2)
    //     .color($r('app.color.color_999999'))
    //     .opacity(this.currentTabIndex == index ? 1 : 0)
    // }
  }
}