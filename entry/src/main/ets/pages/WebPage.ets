import router from '@ohos.router'
import { ArticleEntity } from '../model/entity/ArticleEntity'

const articleItem = router.getParams() as ArticleEntity

@Entry
@Component
struct WebPage {
  build() {
    Text(articleItem.title)
  }
}