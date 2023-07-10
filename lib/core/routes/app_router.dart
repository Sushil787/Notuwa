import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kuraa/core/constants/route_constants.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// AppRouter
class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(path: AppRoutes.home, builder: (context, state) => HomePAge()),
    ],
  );

  /// Router Getter
  GoRouter get router => _router;
}

class HomePAge extends StatelessWidget {
  const HomePAge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
