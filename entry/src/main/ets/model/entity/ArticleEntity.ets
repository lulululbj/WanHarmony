// {
//                 "adminAdd":false,
//                 "apkLink":"",
//                 "audit":1,
//                 "author":"",
//                 "canEdit":false,
//                 "chapterId":502,
//                 "chapterName":"自助",
//                 "collect":false,
//                 "courseId":13,
//                 "desc":"",
//                 "descMd":"",
//                 "envelopePic":"",
//                 "fresh":true,
//                 "host":"",
//                 "id":27812,
//                 "isAdminAdd":false,
//                 "link":"https://juejin.cn/post/7320169878644031488",
//                 "niceDate":"1小时前",
//                 "niceShareDate":"1小时前",
//                 "origin":"",
//                 "prefix":"",
//                 "projectLink":"",
//                 "publishTime":1704425132000,
//                 "realSuperChapterId":493,
//                 "selfVisible":0,
//                 "shareDate":1704425132000,
//                 "shareUser":"青杉",
//                 "superChapterId":494,
//                 "superChapterName":"广场Tab",
//                 "tags":[
//
//                 ],
//                 "title":"Android低功耗蓝牙开发总结",
//                 "type":0,
//                 "userId":82437,
//                 "visible":1,
//                 "zan":0
//             }

export class ArticleEntity {
  adminAdd: boolean
  apkLink: string
  audit: number
  author: string
  canEdit: Boolean
  chapterId: number
  chapterName: string
  collect: boolean
  courseId: number
  desc: string
  descMd: string
  envelopePic: string
  fresh: boolean
  host: string
  id: number
  isAdminAdd: boolean
  link: string
  niceDate: string
  niceShareDate: string
  origin: string
  prefix: string
  projectLink: string
  publishTime: number
  realSuperChapterId: number
  selfVisible: number
  shareDate: number
  shareUser: string
  superChapterId: number
  superChapterName: string
  tags: Array<any>
  title: string
  type: number
  userId: number
  visible: number
  zan: number
  top: boolean = false

  constructor(adminAdd: boolean, apkLink: string, audit: number, author: string, canEdit: Boolean, chapterId: number, chapterName: string, collect: boolean, courseId: number, desc: string, descMd: string, envelopePic: string, fresh: boolean, host: string, id: number, isAdminAdd: boolean, link: string, niceDate: string, niceShareDate: string, origin: string, prefix: string, projectLink: string, publishTime: number, realSuperChapterId: number, selfVisible: number, shareDate: number, shareUser: string, superChapterId: number, superChapterName: string, tags: Array<any>, title: string, type: number, userId: number, visible: number, zan: number) {
    this.adminAdd = adminAdd;
    this.apkLink = apkLink;
    this.audit = audit;
    this.author = author;
    this.canEdit = canEdit;
    this.chapterId = chapterId;
    this.chapterName = chapterName;
    this.collect = collect;
    this.courseId = courseId;
    this.desc = desc;
    this.descMd = descMd;
    this.envelopePic = envelopePic;
    this.fresh = fresh;
    this.host = host;
    this.id = id;
    this.isAdminAdd = isAdminAdd;
    this.link = link;
    this.niceDate = niceDate;
    this.niceShareDate = niceShareDate;
    this.origin = origin;
    this.prefix = prefix;
    this.projectLink = projectLink;
    this.publishTime = publishTime;
    this.realSuperChapterId = realSuperChapterId;
    this.selfVisible = selfVisible;
    this.shareDate = shareDate;
    this.shareUser = shareUser;
    this.superChapterId = superChapterId;
    this.superChapterName = superChapterName;
    this.tags = tags;
    this.title = title;
    this.type = type;
    this.userId = userId;
    this.visible = visible;
    this.zan = zan;
  }
}

export function getAuthorName(article: ArticleEntity): string {
  if (article.author != null && article.author.length > 0) {
    return article.author + "   " + article.niceDate + "   "
  } else if (article.shareUser != null && article.shareUser.length > 0) {
    return "分享者：" + article.shareUser + "   " + article.niceShareDate + "   "
  } else {
    return article.niceDate
  }
}