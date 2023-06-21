enum MenuType { clock, alarm, timer, stopwatch }

class MenuInfo {
  MenuType menuType;
  String? title;
  String? imageSource;

  MenuInfo(this.menuType, {this.title, this.imageSource});

  // updateMenu(MenuInfo menuInfo) {
  //   menuType = menuInfo.menuType;
  //   title = menuInfo.title;
  //   imageSource = menuInfo.imageSource;
  // }
}
