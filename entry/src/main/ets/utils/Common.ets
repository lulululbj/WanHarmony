import router from '@ohos.router';
import { ArticleEntity } from '../model/entity/ArticleEntity';
import { WebParam } from '../model/entity/WebParam';

export function jumpToWeb(article: ArticleEntity) {
  router.pushUrl({
    url: "pages/WebPage",
    params: new WebParam(article.title, article.link)
  }, router.RouterMode.Single)
}

export function jumpToWeb2(title: string, url: string) {
  router.pushUrl({
    url: "pages/WebPage",
    params: new WebParam(title, url)
  }, router.RouterMode.Single)
}
