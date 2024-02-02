PersistentStorage.PersistProp("username", "")

@Entry
@Component
export struct LoginPage {
  @StorageLink("username") username: string = ""
  @State password: string = ""

  build() {
    Column() {
      TextInput({ placeholder: "用户名", text: this.username })
        .width('80%')
        .type(InputType.Normal)
        .onChange((value: string) => {
          this.username = value
        })

      TextInput({ placeholder: "密码", text: this.password })
        .width('80%')
        .type(InputType.Password)
        .onChange((value: string) => {
          this.password = value
        })
        .margin({ top: 20 })

      Button("登录", { type: ButtonType.Capsule })
        .width('80%')
        .margin({ top: 20 })
        .enabled(this.username.length > 0 && this.password.length > 0)
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}