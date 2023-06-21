import 'package:alarm_clock/models/menu_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentSelectMenuTypeProvider = StateProvider<MenuType>(
  (ref) => MenuType.clock,
);
