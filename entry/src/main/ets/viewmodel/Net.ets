import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import { WanResponse } from '../model/entity/WanResponse';
import { BannerEntity } from '../model/entity/BannerEntity';
import { ArticleEntity } from '../model/entity/ArticleEntity';
import { PageData } from '../model/entity/PageData';
import { NavData } from '../model/entity/NavData';
import Log from '../utils/Log';
import { TutorialEntity } from '../model/entity/TutorialEntity';
import { UtilEntity } from '../model/entity/UtilEntity';
import { QaCommentEntity } from '../model/entity/QaCommnetEntity';


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
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<BannerEntity[]>, AxiosResponse<WanResponse<BannerEntity[]>>, null>('/banner/json')
      .then((res: AxiosResponse<WanResponse<BannerEntity[]>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data)
        } else {
          reject(new Error(res.statusText))
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
        } else {
          reject(new Error(res.statusText))
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
        } else {
          reject(new Error(res.statusText))
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
        } else {
          reject(new Error(res.statusText))
        }
      }).catch((err: AxiosError) => {
      reject(err)
    })
  })
}

/**
 * 获取导航数据
 */
export function getNavigationData(): Promise<NavData[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<NavData[]>, AxiosResponse<WanResponse<NavData[]>>, null>('/navi/json')
      .then((res: AxiosResponse<WanResponse<NavData[]>>) => {
        Log.error("getNavigationData success")
        if (res.data.errorCode == 0) {
          resolve(res.data.data)
        } else {
          reject(new Error(res.statusText))
        }
      }).catch((err: Error) => {
      Log.error("getNavigationData failed: " + err.message)
      reject(err)
    })
  })
}

/*
 * 获取教程目录
 */
export function getTutorialData(): Promise<TutorialEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<TutorialEntity[]>, AxiosResponse<WanResponse<TutorialEntity[]>>, null>('/chapter/547/sublist/json')
      .then((res: AxiosResponse<WanResponse<TutorialEntity[]>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data)
        } else {
          reject(new Error(res.statusText))
        }
      })
      .catch((err: Error) => {
        Log.error("getTutorialData failed: " + err.message)
        reject(err)
      })
  })
}

/**
 * 获取单个教程的内容目录
 */
export function getTutorialDetailData(tutorialId: number): Promise<ArticleEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<PageData<ArticleEntity>>, AxiosResponse<WanResponse<PageData<ArticleEntity>>>, null>(`/article/list/0/json?cid=${tutorialId}&order_type=1`)
      .then((res: AxiosResponse<WanResponse<PageData<ArticleEntity>>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data.datas)
        } else {
          reject(new Error(res.statusText))
        }
      })
      .catch((err: Error) => {
        Log.error("getTutorialData failed: " + err.message)
        reject(err)
      })
  })
}

export function getUtilData(): Promise<UtilEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<UtilEntity[]>, AxiosResponse<WanResponse<UtilEntity[]>>, null>('/tools/list/json')
      .then((res: AxiosResponse<WanResponse<UtilEntity[]>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data)
        } else {
          reject(new Error(res.statusText))
        }
      })
      .catch((err: Error) => {
        Log.error("getUtilData failed: " + err.message)
        reject(err)
      })
  })
}

/**
 * 获取问答列表
 */
export function getQAList(pageNumber: number): Promise<ArticleEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<PageData<ArticleEntity>>, AxiosResponse<WanResponse<PageData<ArticleEntity>>>, null>(`/wenda/list/${pageNumber}/json`)
      .then((res: AxiosResponse<WanResponse<PageData<ArticleEntity>>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data.datas)
        } else {
          reject(new Error(res.statusText))
        }
      }).catch((err: AxiosError) => {
      reject(err)
    })
  })
}

/**
 * 获取问题回答列表
 * @param id 问题 id
 */
export function getQACommentList(id: number): Promise<QaCommentEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<PageData<QaCommentEntity>>, AxiosResponse<WanResponse<PageData<QaCommentEntity>>>, null>(`/wenda/comments/${id}/json`)
      .then((res: AxiosResponse<WanResponse<PageData<QaCommentEntity>>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data.datas)
        } else {
          reject(new Error(res.statusText))
        }
      }).catch((err: AxiosError) => {
      reject(err)
    })
  })
}

/**
 * 公众号作者列表
 */
export function getBlogData(): Promise<TutorialEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<TutorialEntity[]>, AxiosResponse<WanResponse<TutorialEntity[]>>, null>('/wxarticle/chapters/json')
      .then((res: AxiosResponse<WanResponse<TutorialEntity[]>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data)
        } else {
          reject(new Error(res.statusText))
        }
      })
      .catch((err: Error) => {
        Log.error("getBlogData failed: " + err.message)
        reject(err)
      })
  })
}

/**
 * 指定公众号的文章列表  wxarticle/list/408/1/json
 */
/**
 * 获取广场文章列表
 */
export function getBlogArticleList(id: number, pageNumber: number): Promise<ArticleEntity[]> {
  return new Promise((resolve, reject) => {
    axiosInstance.get<WanResponse<PageData<ArticleEntity>>, AxiosResponse<WanResponse<PageData<ArticleEntity>>>, null>(`/wxarticle/list/${id}/${pageNumber}/json`)
      .then((res: AxiosResponse<WanResponse<PageData<ArticleEntity>>>) => {
        if (res.data.errorCode == 0) {
          resolve(res.data.data.datas)
        } else {
          reject(new Error(res.statusText))
        }
      }).catch((err: AxiosError) => {
      Log.error("getBlogArticleList error: " + err)
      reject(err)
    })
  })
}
