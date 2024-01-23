import router from '@ohos.router';
import { ArticleEntity } from '../model/entity/ArticleEntity';

export function jumpToWeb(article: ArticleEntity) {
  router.pushUrl({
    url: "pages/WebPage",
    params: article
  }, router.RouterMode.Single)
}