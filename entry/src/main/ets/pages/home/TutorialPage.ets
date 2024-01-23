import router from '@ohos.router'
import { TutorialEntity } from '../../model/entity/TutorialEntity'
import { getTutorialData } from '../../viewmodel/Net'

@Component
export struct TutorialPage {
  @State tutorialData: TutorialEntity[] = []

  aboutToAppear() {
    getTutorialData().then((data: TutorialEntity[]) => {
      this.tutorialData = data
    })
  }

  build() {
    List() {
      ForEach(this.tutorialData, (item: TutorialEntity) => {
        ListItem() {
          TutorialComponent({ tutorialEntity: item })
            .onClick(() => {
              router.pushUrl({
                url: 'pages/home/TutorialDetailPage',
                params: item
              }, router.RouterMode.Standard)
            })
        }
      }, (item: TutorialEntity) => {
        return item.id + ""
      })
    }
    .alignListItem(ListItemAlign.Start)
    .width('100%')
    .height('100%')
  }
}

@Component
struct TutorialComponent {
  tutorialEntity: TutorialEntity

  build() {
    Row({ space: 16 }) {
      Image(this.tutorialEntity.cover)
        .width(100)

      Column({ space: 16 }) {
        Text(this.tutorialEntity.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
        Text(`作者：${this.tutorialEntity.author}`)
          .fontSize(14)
          .fontColor($r('app.color.color_666666'))
        Text(this.tutorialEntity.desc)
          .fontSize(14)
          .fontColor($r('app.color.color_666666'))
      }
      .alignItems(HorizontalAlign.Start) // 交叉轴的排列
      .justifyContent(FlexAlign.Start) // 主轴的排列
      .width('100%')
    }
    .width('100%')
    .padding(16)
  }
}