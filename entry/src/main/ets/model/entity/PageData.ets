export class PageData<T> {
  curPage: number
  datas: T[]
  offset: number
  over: boolean
  pageCount: number
  size: number
  total: number
}