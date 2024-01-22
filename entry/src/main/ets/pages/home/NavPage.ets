import { NavData } from '../../model/entity/NavData'
import { getNavigationData } from '../../viewmodel/Net'

@Component
export struct NavPage {
  @State navData: NavData[] = []

  aboutToAppear() {
    getNavigationData().then((data: NavData[]) => {
      this.navData = data
    })
  }

  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.navData, (item: NavData) => {
            ListItem() {
              Text(item.name)
                .fontColor(Color.Black)
                .height(30)
                .borderRadius(12)
                .backgroundColor($r('app.color.color_f2f3f5'))

            }
          }, (item: NavData) => {
            return item.cid + ""
          })
        }
        .width(100)
        .height('100%')

      }
      .width('100%')
      .height('100%')
    }
  }
}