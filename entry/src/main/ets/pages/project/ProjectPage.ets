import { TutorialEntity } from '../../model/entity/TutorialEntity'
import { getProjectTypeList } from '../../viewmodel/Net'
import { ProjectDetailPage } from './ProjectDetailPage'

@Component
export struct ProjectPage {
  @State projectTypeData: TutorialEntity[] = []
  @State currentTabIndex: number = 0
  private tabsController: TabsController = new TabsController()

  aboutToAppear() {
    getProjectTypeList().then((data: TutorialEntity[]) => {
      this.projectTypeData = data
    })
  }

  build() {
    Column() {

      Tabs({ barPosition: BarPosition.Start, index: this.currentTabIndex, controller: this.tabsController }) {

        // 最新项目
        TabContent() {
          ProjectDetailPage()
        }.tabBar(this.tabBuilder(0))

        // 分类项目
        ForEach(this.projectTypeData, (item: TutorialEntity, index: number) => {
          TabContent() {
            ProjectDetailPage({ projectTypeEntity: item })
          }.tabBar(this.tabBuilder(index + 1))
        }, (item: TutorialEntity) => {
          return item.id + ""
        })
      }
      .barMode(BarMode.Scrollable)
      .onChange((i: number) => {
        animateTo({ duration: 280 }, () => {
          this.currentTabIndex = i
        })
      }).layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  tabBuilder(index: number) {
    // Column() {
    Text(index == 0 ? "最新" : this.projectTypeData[index-1].name)
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

