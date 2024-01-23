import { UtilEntity } from '../../model/entity/UtilEntity'
import { jumpToWeb, jumpToWeb2 } from '../../utils/Common'
import { getUtilData } from '../../viewmodel/Net'

@Component
export struct UtilPage {
  @State utilEntityData: UtilEntity[] = []

  aboutToAppear() {
    getUtilData().then((data: UtilEntity[]) => {
      this.utilEntityData = data
    })
  }

  build() {
    List({ space: 16 }) {
      ForEach(this.utilEntityData, (item: UtilEntity) => {
        ListItem() {
          this.buildUtilView(item)
        }
        .onClick(() => {
          jumpToWeb2(item.name, item.link)
        })
        .margin({ left: 8, right: 8 })
      }, (item: UtilEntity) => {
        return item.id + ""
      })
    }
    .lanes(2)
    .margin({ left: 8, right: 8 })
    .height('100%')
  }

  @Builder
  buildUtilView(data: UtilEntity) {
    Column() {
      Text(data.name)
        .fontColor(Color.Black)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
      Text(data.desc)
        .fontColor($r('app.color.color_666666'))
        .fontSize(14)
        .maxLines(2)
        .margin({ top: 6 })
    }
    .justifyContent(FlexAlign.Center)
    .borderRadius(12)
    .backgroundColor($r('app.color.color_f2f3f5'))
    .height(80)
    .width('100%')
  }
}