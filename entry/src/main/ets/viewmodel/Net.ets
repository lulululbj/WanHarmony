import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { WanResponse } from '../model/entity/WanResponse';
import { BannerEntity } from '../model/entity/BannerEntity';
import { ArticleEntity } from '../model/entity/ArticleEntity';
import { PageData } from '../model/entity/PageData';
import { NavData } from '../model/entity/NavData';
import Log from '../utils/Log';


export const DOMAIN = 0x0001

export const TAG = "net"

export const axiosInstance = axios.create({
  baseURL: 'https://www.wanandroid.com',
  timeout: 20 * 1000,
})

/**
 * 获取 Banner 数据
 */
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

/**
 * 获取首页文章列表
 */
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

/**
 * 获取置顶文章列表
 */
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

/**
 * 获取广场文章列表
 */
export function getSquareArticleList(pageNumber: number): Promise<ArticleEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<PageData<ArticleEntity>>, AxiosResponse<WanResponse<PageData<ArticleEntity>>>, null>(`/user_article/list/${pageNumber}/json`)
      .then((res: AxiosResponse<WanResponse<PageData<ArticleEntity>>>) => {
        if (res.data.errorCode == 0) {
          Log.error("getSquareArticleList success")
          resolve(res.data.data.datas)
        }
      }).catch((err: AxiosError) => {
      reject(err)
    })
  })
}


export function getNavigationData(): Promise<NavData[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<NavData[]>, AxiosResponse<WanResponse<NavData[]>>, null>('/navi/json')
      .then((res: AxiosResponse<WanResponse<NavData[]>>) => {
        Log.error("getNavigationData success")
        if (res.data.errorCode == 0) {
          resolve(res.data.data)
        }
      }).catch((err: Error) => {
      Log.error("getNavigationData failed: " + err.message)
      reject(err)
    })
  })
}
