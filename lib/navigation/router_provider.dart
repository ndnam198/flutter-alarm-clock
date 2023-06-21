import 'package:alarm_clock/navigation/page_not_found.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/debug_page.dart';
import '../pages/home_page.dart';

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
