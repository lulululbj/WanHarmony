import { TutorialEntity } from '../../model/entity/TutorialEntity'
import { getBlogData } from '../../viewmodel/Net'
import { BlogDetailPage } from './BlogDetailPage'

@Component
export struct BlogPage {
  @State blogData: TutorialEntity[] = []
  @State currentTabIndex: number = 0
  private tabsController: TabsController = new TabsController()

  aboutToAppear() {
    getBlogData().then((data: TutorialEntity[]) => {
      this.blogData = data
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex, controller: this.tabsController }) {
        ForEach(this.blogData, (item: TutorialEntity, index: number) => {
          TabContent() {
            BlogDetailPage({ blogEntity: item })
          }.tabBar(this.tabBuilder(index))
        }, (item: TutorialEntity) => {
          return item.id + ""
        })
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
    // Column() {
    Text(this.blogData[index].name)
      .fontColor(this.currentTabIndex == index ? $r('app.color.black') : $r('app.color.color_999999'))
      .fontSize(16)
      .margin({ left: 8, right: 8 })
    //   Divider()
    //     .strokeWidth(2)
    //     .color($r('app.color.black'))
    //     .opacity(this.currentTabIndex == index ? 1 : 0)
    // }
  }
}

