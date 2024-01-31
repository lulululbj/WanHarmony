import { TabMenu, TabMenuList } from '../model/TabMenu'
import { BlogPage } from './BlogPage'
import { HomePage } from './home/HomePage'
import { MyPage } from './MyPage'
import { ProjectPage } from './ProjectPage'
import { QaPage } from './qa/QaPage'

@Entry
@Component
struct Index {
  @State currentTabIndex: number = 0
  private tabsController: TabsController = new TabsController()
  private tabMenuList: TabMenu[] = TabMenuList

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, index: this.currentTabIndex, controller: this.tabsController }) {
        TabContent() {
          HomePage()
        }.tabBar(this.tabBuilder(0))

        TabContent() {
          QaPage()
        }.tabBar(this.tabBuilder(1))

        TabContent() {
          BlogPage()
        }.tabBar(this.tabBuilder(2))

        TabContent() {
          ProjectPage()
        }.tabBar(this.tabBuilder(3))

        TabContent() {
          MyPage()
        }.tabBar(this.tabBuilder(4))
      }
      .width('100%')
      .height('100%')
      .vertical(false)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentTabIndex = index
      })
    }
    .width('100%')
    .height('100%')

  }

  @Builder
  tabBuilder(index: number) {
    Column() {
      Image(this.currentTabIndex == index ? this.tabMenuList[index].selectedIcon : this.tabMenuList[index].normalIcon)
        .width(23)
        .height(23)
        .margin(4)
        .objectFit(ImageFit.Contain)
      Text(this.tabMenuList[index].name)
        .fontSize(14)
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#f2f3f5')
  }
}