export class QaCommentEntity {
  anonymous:number
  appendForContent:number
  articleId: number
  canEdit: boolean
  content: string
  contentMd: string
  id: number
  niceDate: string
  publishDate: number
  replyCommentId: number
  replyComments: QaCommentEntity[]
  rootCommentId: number
  status: number
  toUserId: number
  toUserName: string
  userId: number
  userName: string
  zan: number
}