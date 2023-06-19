import 'package:alarm_clock/navigation/page_not_found.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/debug/presentation/debug_page.dart';
import '../features/home/presentation/home_page.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      errorBuilder: (context, state) => PageNotFound(state.error),
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DebugPage(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  },
);
