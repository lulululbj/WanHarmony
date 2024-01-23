import { ArticleEntity } from './ArticleEntity'

export class TutorialEntity {
  articleList: ArticleEntity[]
  author: string
  children: string[]
  courseId: number
  cover: string
  desc: string
  id: number
  lisense: string
  lisenseLink: string
  name: string
  order: number
  parentChapterId: number
  type: number
  userControlSetTop: boolean
  visible: number
}