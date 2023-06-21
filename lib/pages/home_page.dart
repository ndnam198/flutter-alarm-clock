import 'package:alarm_clock/pages/clock_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/side_menu_provider.dart';
import '../models/menu_info.dart';
import '../theme/colors.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/images/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/images/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/images/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/images/stopwatch_icon.png'),
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMenuType = ref.watch(currentSelectMenuTypeProvider);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: CustomColors.pageBackgroundColor,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: menuItems
                    .map(
                      (menuInfo) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: SideMenuButton(
                          menuInfo: menuInfo,
                          isSelect: currentMenuType == menuInfo.menuType,
                          onSelect: () {
                            ref
                                .read(currentSelectMenuTypeProvider.notifier)
                                .state = menuInfo.menuType;
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            VerticalDivider(
              color: CustomColors.dividerColor,
              width: 1,
            ),
            const ClockPage(),
          ],
        ),
      ),
    );
  }
}

class SideMenuButton extends StatelessWidget {
  const SideMenuButton({
    super.key,
    required this.menuInfo,
    required this.isSelect,
    required this.onSelect,
  });

  final MenuInfo menuInfo;
  final bool isSelect;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
      color: isSelect
          ? CustomColors.menuBackgroundColor
          : CustomColors.pageBackgroundColor,
      onPressed: onSelect,
      child: Column(
        children: [
          Image.asset(
            menuInfo.imageSource!,
            scale: 1.5,
          ),
          const SizedBox(height: 16),
          Text(
            menuInfo.title ?? '',
            style: TextStyle(
              fontFamily: 'avenir',
              color: CustomColors.primaryTextColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
