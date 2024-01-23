import router from '@ohos.router'
import { ArticleEntity } from '../../model/entity/ArticleEntity'
import { TutorialEntity } from '../../model/entity/TutorialEntity'
import { jumpToWeb } from '../../utils/Common'
import { getTutorialDetailData } from '../../viewmodel/Net'
import { TitleComponent } from '../TitleComponent'

const tutorialEntity = router.getParams() as TutorialEntity

@Entry
@Component
export struct TutorialDetailPage {
  @State tutorialData: ArticleEntity[] = []

  aboutToAppear() {
    getTutorialDetailData(tutorialEntity.id)
      .then((data: ArticleEntity[]) => {
        this.tutorialData = data
      })
  }

  build() {
    Column() {
      TitleComponent({
        title: tutorialEntity.name
      })

      List() {
        ForEach(this.tutorialData, (item: ArticleEntity, index: number) => {
          ListItem() {
            Column() {
              Text(`${index} ${item.title}`)// .margin({ top: 8, bottom: 8, left: 16, right: 16 })
                .padding({ top: 8, bottom: 8, left: 16, right: 16 })
                .borderRadius(12)
                .backgroundColor($r('app.color.color_f2f3f5'))
                .width('100%')
            }.padding({ top: 8, bottom: 8, left: 16, right: 16 })
            .onClick(() => {
              jumpToWeb(item)
            })

          }
        }, (item: ArticleEntity) => {
          return item.id + ""
        })
      }
      .alignListItem(ListItemAlign.Start)
      .width('100%')
      .height('100%')
    }
  }
}