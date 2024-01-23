const defaultItemNormalFontColor: ResourceColor = Color.Black
const defaultItemSelectedFontColor: ResourceColor = Color.White
const defaultItemFontSize: number | string | Resource = 14
const defaultItemNormalBgColor: ResourceColor = Color.Grey
const defaultItemSelectedBgColor: ResourceColor = Color.Green
const defaultItemHeight: number = 30
const defaultItemBorderRadius: number = 12
const defaultItemBorderWidth: number = 0
const defaultItemBorderColor: ResourceColor = undefined
const defaultItemPadding: Padding | Length = 8
const defaultItemMargin: Margin | Length = 4

export class FlowLayoutConfig {
  itemNormalFontColor ?: ResourceColor = defaultItemNormalFontColor // 标签字体颜色
  itemSelectedFontColor?: ResourceColor = defaultItemSelectedFontColor // 标签选中时字体颜色
  itemFontSize?: number | string | Resource = defaultItemFontSize // 标签字体大小
  itemNormalBgColor?: ResourceColor = defaultItemNormalBgColor // 标签背景色
  itemSelectedBgColor?: ResourceColor = defaultItemSelectedBgColor // 标签选中时背景色
  itemHeight?: number = defaultItemHeight // 标签高度
  itemBorderRadius?: number = defaultItemBorderRadius // 标签圆角
  itemBorderWidth?: number = defaultItemBorderWidth // 标签边框宽度
  itemBorderColor?: ResourceColor = defaultItemBorderColor // 标签边框颜色
  itemPadding?: Padding | Length = defaultItemPadding
  itemMargin?: Margin | Length = defaultItemMargin

  getItemNormalFontColor(): ResourceColor {
    return this.itemNormalFontColor == undefined ? defaultItemNormalFontColor : this.itemNormalFontColor
  }

  getItemSelectedFontColor(): ResourceColor {
    return this.itemSelectedFontColor == undefined ? defaultItemSelectedFontColor : this.itemSelectedFontColor
  }

  getItemFontSize(): number | string | Resource {
    return this.itemFontSize == undefined ? defaultItemFontSize : this.itemFontSize
  }

  getItemNormalBgColor(): ResourceColor {
    return this.itemNormalBgColor == undefined ? defaultItemNormalBgColor : this.itemNormalBgColor
  }

  getItemSelectedBgColor(): ResourceColor {
    return this.itemSelectedBgColor == undefined ? defaultItemSelectedBgColor : this.itemSelectedBgColor
  }

  getItemHeight(): number {
    return this.itemHeight == undefined ? defaultItemHeight : this.itemHeight
  }

  getItemBorderRadius(): number {
    return this.itemBorderRadius == undefined ? defaultItemBorderRadius : this.itemBorderRadius
  }

  getItemBorderWidth(): number {
    return this.itemBorderWidth == undefined ? defaultItemBorderWidth : this.itemBorderWidth
  }

  getItemBorderColor(): ResourceColor {
    return this.itemBorderColor == undefined ? defaultItemBorderColor : this.itemBorderColor
  }

  getItemPadding(): Padding | Length {
    return this.itemPadding == undefined ? defaultItemPadding : this.itemPadding
  }

  getItemMargin(): Margin | Length {
    return this.itemMargin == undefined ? defaultItemMargin : this.itemMargin
  }

  setItemNormalFontColor(itemNormalFontColor: ResourceColor): FlowLayoutConfig {
    this.itemNormalFontColor = itemNormalFontColor
    return this
  }

  setItemSelectedFontColor(itemSelectedFontColor: ResourceColor): FlowLayoutConfig {
    this.itemSelectedFontColor = itemSelectedFontColor
    return this
  }

  setItemFontSize(itemFontSize: number | string | Resource): FlowLayoutConfig {
    this.itemFontSize = itemFontSize
    return this
  }

  setItemNormalBgColor(itemNormalBgColor: ResourceColor): FlowLayoutConfig {
    this.itemNormalBgColor = itemNormalBgColor
    return this
  }

  setItemSelectedBgColor(itemSelectedBgColor: ResourceColor): FlowLayoutConfig {
    this.itemSelectedBgColor = itemSelectedBgColor
    return this
  }

  setItemHeight(itemHeight: number): FlowLayoutConfig {
    this.itemHeight = itemHeight
    return this
  }

  setItemBorderRadius(itemBorderRadius: number): FlowLayoutConfig {
    this.itemBorderRadius = itemBorderRadius
    return this
  }

  setItemBorderWidth(itemBorderWidth: number): FlowLayoutConfig {
    this.itemBorderWidth = itemBorderWidth
    return this
  }

  setItemBorderColor(itemBorderColor: ResourceColor): FlowLayoutConfig {
    this.itemBorderColor = itemBorderColor
    return this
  }

  setItemPadding(itemPadding: Padding | Length): FlowLayoutConfig {
    this.itemPadding = itemPadding
    return this
  }

  setItemMargin(itemMargin: Margin | Length): FlowLayoutConfig {
    this.itemMargin = itemMargin
    return this
  }

  static create(): FlowLayoutConfig {
    return new FlowLayoutConfig()
  }
}