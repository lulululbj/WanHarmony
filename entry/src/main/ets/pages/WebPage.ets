import router from '@ohos.router'
import webview from '@ohos.web.webview'
import { ArticleEntity } from '../model/entity/ArticleEntity'
import Log from '../utils/Log'
import { TitleComponent } from './TitleComponent'
import promptAction from '@ohos.promptAction'
import { WebParam } from '../model/entity/WebParam'

const webParam = router.getParams() as WebParam

@Entry
@Component
struct WebPage {
  controller: webview.WebviewController = new webview.WebviewController()

  aboutToAppear() {
    this.configWebviewController()
  }

  build() {
    Column() {
      TitleComponent({ title: webParam.title, back: () => {
        if (this.controller.accessBackward()) {
          this.controller.backward()
        } else {
          router.back()
        }
      } })
      Web({ src: webParam.url, controller: this.controller })
        .javaScriptAccess(true)
        .onPageEnd(() => {
          Log.info(`onPageEnd: ${webParam.url}`)
        })
        .onErrorReceive((event) => {
          promptAction.showToast({
            message: `onErrorReceive: ${event.error.getErrorInfo()}`,
            duration: 1000
          })
        })
        .width('100%')
        .height('100%')
    }
  }

  configWebviewController() {

  }
}