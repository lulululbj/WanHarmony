import { FlowLayoutConfig } from './FlowLayoutConfig'

@Component
export struct FlowLayout {
  @State selectedIndex: number = -1
  data: string[]
  flowLayoutConfig?: FlowLayoutConfig
  clickListener: (index: number) => void = () => {

  }

  aboutToAppear() {
    if (!this.flowLayoutConfig) {
      this.flowLayoutConfig = new FlowLayoutConfig()
    }
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      ForEach(this.data, (item: string, index: number) => {
        Text(item)
          .fontSize(this.flowLayoutConfig.itemFontSize)
          .fontColor(this.selectedIndex == index ? this.flowLayoutConfig.itemSelectedFontColor : this.flowLayoutConfig.itemNormalFontColor)
          .height(this.flowLayoutConfig.itemHeight)
          .borderRadius(this.flowLayoutConfig.itemBorderRadius)
          .borderWidth(this.flowLayoutConfig.itemBorderWidth)
          .borderColor(this.flowLayoutConfig.itemBorderColor)
          .backgroundColor(this.selectedIndex == index ? this.flowLayoutConfig.itemSelectedBgColor : this.flowLayoutConfig.itemNormalBgColor)
          .padding(this.flowLayoutConfig.itemPadding)
          .margin(this.flowLayoutConfig.itemMargin)
          .onClick(() => {
            this.selectedIndex = index
            this.clickListener(index)
          })
      }, (item: string) => {
        return item
      })
    }
  }
}