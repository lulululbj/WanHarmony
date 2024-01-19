export interface TabMenu {
  name: Resource
  normalIcon: Resource
  selectedIcon: Resource
}

export let TabMenuList: TabMenu[] = [
  {
    name: $r("app.string.mainPage"),
    normalIcon: $r('app.media.ic_home_normal'),
    selectedIcon: $r('app.media.ic_home_selected')

  },
  {
    name: $r('app.string.qa'),
    normalIcon: $r("app.media.ic_qa_normal"),
    selectedIcon: $r('app.media.ic_qa_selected')
  },
  {
    name: $r('app.string.blog'),
    normalIcon: $r("app.media.ic_blog_normal"),
    selectedIcon: $r('app.media.ic_blog_selected')
  },
  {
    name: $r('app.string.project'),
    normalIcon: $r('app.media.ic_project_normal'),
    selectedIcon: $r('app.media.ic_project_selected')
  },
  {
    name: $r('app.string.me'),
    normalIcon: $r('app.media.ic_me_normal'),
    selectedIcon: $r('app.media.ic_me_selected')
  }
]