import router from '@ohos.router'

@Component
export struct TitleComponent {

  title: string = ""
  back: () => void = () => {
    router.back()
  }

  build() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(24)
        .height(24)
        .onClick(() => {
          this.back()
        })

      Text(this.title)
        .fontSize(20)
        .fontColor($r('app.color.black'))
        .padding({left: 16, right: 16})

    }
    .width('100%')
    .padding(16)
  }
}

@Preview
@Component
struct TitleComponentPreview {
  build() {
    TitleComponent({title: 'Title'})
  }
}