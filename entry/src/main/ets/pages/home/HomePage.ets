import {
  MenuEntity,
  MENU_HOT,
  MENU_LEARN_ROUTE,
  MENU_NAV,
  MENU_SQUARE,
  MENU_TUTORIAL,
  MENU_UTIL
} from '../../model/entity/MenuEntity'
import { TestPage } from '../TestPage'
import { HotPage } from './HotPage'
import { NavPage } from './NavPage'
import { SquarePage } from './SquarePage'
import { TutorialPage } from './TutorialPage'
import { UtilPage } from './UtilPage'

@Component
export struct HomePage {
  @State currentTabIndex: number = 0
  private tabsController: TabsController = new TabsController()
  private menus = [
    new MenuEntity(MENU_HOT, "热门"),
    new MenuEntity(MENU_SQUARE, "广场"),
    new MenuEntity(MENU_NAV, "导航"),
    new MenuEntity(MENU_TUTORIAL, "教程"),
    new MenuEntity(MENU_UTIL, "工具"),
    new MenuEntity(MENU_LEARN_ROUTE, "学习路线"),
  ]

  build() {
    Column() {
      SearchBar()
      Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex, controller: this.tabsController }) {
        ForEach(this.menus, (item: MenuEntity, index: number) => {
          TabContent() {
            this.homePageTabContentBuilder(item.id)
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
      Text(this.menus[index].name)
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
  homePageTabContentBuilder(id: string) {
    if (id == MENU_HOT) {
      HotPage()
    } else if (id == MENU_SQUARE) {
      SquarePage()
    } else if (id == MENU_NAV) {
      NavPage()
    } else if (id == MENU_TUTORIAL) {
      TutorialPage()
    } else if (id == MENU_UTIL) {
      UtilPage()
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

