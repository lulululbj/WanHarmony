import { TestPage } from '../TestPage'
import { HotPage } from './HotPage'
import { NavPage } from './NavPage'
import { SquarePage } from './SquarePage'

@Component
export struct HomePage {
  @State currentTabIndex: number = 0
  private tabsController: TabsController = new TabsController()
  private menus = ['热门', '广场', '学习路线', '导航', '教程', '工具']

  build() {
    Column() {
      SearchBar()
      Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex, controller: this.tabsController }) {
        ForEach(this.menus, (item: string, index: number) => {
          TabContent() {
            this.homePageTabContentBuilder(index)
          }.tabBar(this.tabBuilder(index))
        }, (item: string) => item)
      }
      .barMode(BarMode.Scrollable)
      .onChange((index: number) => {
        animateTo({ duration: 280 }, () => {
          this.currentTabIndex = index
        })
      }).layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  tabBuilder(index: number) {
    Column() {
      Text(this.menus[index])
        .fontColor(this.currentTabIndex == index ? $r('app.color.black') : $r('app.color.color_999999'))
        .fontSize(16)
        .margin({ bottom: 6 })
      Divider()
        .strokeWidth(2)
        .color($r('app.color.black'))
        .opacity(this.currentTabIndex == index ? 1 : 0)
    }
    .width(96)
  }

  @Builder
  homePageTabContentBuilder(index: number) {
    if (index == 0) {
      HotPage()
    } else if (index == 1) {
      SquarePage()
    } else if (index == 3) {
      NavPage()
    } else {
      TestPage()
    }
  }
}

@Component
struct SearchBar {
  build() {
    Row() {
      Text()
        .borderRadius(12)
        .backgroundColor($r('app.color.color_f2f3f5'))
        .margin(10)
        .width('85%')
        .height(30)
      Image($r('app.media.ic_search'))
        .width(20)
        .height(20)
    }
    .width('100%')
    .height(46)
    .onClick(() => {
      console.error('go to search page')
    })
  }
}

