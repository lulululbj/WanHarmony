export const MENU_HOT = "menu_hot"
export const MENU_SQUARE = "menu_square"
export const MENU_LEARN_ROUTE = "menu_lear_route"
export const MENU_NAV = "menu_nav"
export const MENU_TUTORIAL = "menu_tutorial"
export const MENU_UTIL = "menu_util"

export class MenuEntity {
  id: string
  name: string

  constructor(id: string, name: string) {
    this.id = id
    this.name = name
  }
}