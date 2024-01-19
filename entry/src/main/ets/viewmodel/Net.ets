import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { WanResponse } from '../model/entity/WanResponse';
import { BannerEntity } from '../model/entity/BannerEntity';
import { ArticleEntity } from '../model/entity/ArticleEntity';
import { PageData } from '../model/entity/PageData';


export const DOMAIN = 0x0001

export const TAG = "net"

export const axiosInstance = axios.create({
  baseURL: 'https://www.wanandroid.com',
  timeout: 20 * 1000,
})

export function getBanner(): Promise<BannerEntity[]> {
  // let context = getContext(this)
  // context.resourceManager.getRawFileContent("banner.json", (err, value) => {
  //   let decoder = util.TextDecoder.create("utf-8")
  //   let string = decoder.decodeWithStream(value, { stream: false })
  //   hilog.info(DOMAIN, TAG, string)
  //   let response = <WanResponse<BannerEntity[]>> JSON.parse(string)
  //   hilog.info(DOMAIN, TAG, `${response.errorCode} ${response.data.length}`)
  //   if (response.errorCode == 0) {
  //     callback(response.data)
  //   }
  // })
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<BannerEntity[]>, AxiosResponse<WanResponse<BannerEntity[]>>, null>('/banner/json')
      .then((res: AxiosResponse<WanResponse<BannerEntity[]>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data)
        }
      }).catch((err: AxiosError) => {
      reject(err)
    })
  })
}

export function getArticleList(pageNumber: number): Promise<ArticleEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<PageData<ArticleEntity>>, AxiosResponse<WanResponse<PageData<ArticleEntity>>>, null>(`/article/list/${pageNumber}/json`)
      .then((res: AxiosResponse<WanResponse<PageData<ArticleEntity>>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data.datas)
        }
      }).catch((err: AxiosError) => {
      reject(err)
    })
  })
}

export function getTopArticleList(): Promise<ArticleEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<ArticleEntity[]>, AxiosResponse<WanResponse<ArticleEntity[]>>, null>('/article/top/json')
      .then((res: AxiosResponse<WanResponse<ArticleEntity[]>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data.map((value) => {
            value.top = true
            return value
          }))
        }
      }).catch((err: AxiosError) => {
      reject(err)
    })
  })
}



